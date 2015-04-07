using System;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO.Ports;
using System.Windows.Threading;
using System.Threading;
using System.Diagnostics;
using System.Xml;
using System.Text.RegularExpressions;

namespace CVtool
{
    public partial class MainWindow : Window
    {
        public string app_path = System.IO.Path.GetDirectoryName(Assembly.GetEntryAssembly().Location);

        Action emptyDelegate = delegate { };

        protected SerialPort port = null;
        protected DispatcherTimer rx_tmr = null;
        protected const int RETAIN_CHARS = 500;
        protected StringBuilder rx_sbuf = new StringBuilder(RETAIN_CHARS * 2);
        //protected Dictionary<UInt16,UInt16> old_values = new Dictionary<UInt16,UInt16>();
        protected Dictionary<UInt16,UInt16> line_nums = new Dictionary<UInt16,UInt16>();
        protected Regex ipr_re = new Regex("\n([0-9a-f]{4}),([0-9a-f]{4}) >$", RegexOptions.Compiled);
        protected List<Paragraph> lines = new List<Paragraph>();
        protected string source_fn = null;
        protected UInt16 last_ipr = 0;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void load_source(string src_fn)
        {
            bool timer_on = rx_tmr.IsEnabled;
            rx_tmr.Stop();
            log(src_fn);
            string patn = @" ^ \s* ([0-9a-f]{4}) \s* : \s* ([0-9a-f]{4}) \s* ; \s* -- \s* <(\d\d\d\d)> ";
            Regex re = new Regex(patn, RegexOptions.Compiled | RegexOptions.IgnorePatternWhitespace);
            UInt16 lnum = 0;
            lines.Clear();
            line_nums.Clear();
            src_doc.Blocks.Clear();
            using (System.IO.StreamReader rdr = new System.IO.StreamReader(src_fn))
            {                
                while ( ! rdr.EndOfStream) 
                {
                    string lin = rdr.ReadLine();
                    Match m = re.Match(lin);
                    if (m.Success)
                    {
                        UInt16 addr = UInt16.Parse(m.Groups[1].Value, System.Globalization.NumberStyles.HexNumber);
                        //UInt16 lnum = UInt16.Parse(m.Groups[3].Value);
                        line_nums[addr] = lnum;
                    }
                    Paragraph p = new Paragraph(new Run(lin));
                    lines.Add(p);
                    src_doc.Blocks.Add(p);
                    lnum++;
                }
            }            
            show_ipr(last_ipr);
            if (timer_on)
                rx_tmr.Start();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            port = new SerialPort("COM21", 115200, Parity.None, 8, StopBits.One);
            port.WriteTimeout = 500;
            port.ReadTimeout = 1;
            port.ReadBufferSize = 128;
            port.Open();

            rx_tmr = new DispatcherTimer();
            rx_tmr.Interval = TimeSpan.FromMilliseconds(100);
            rx_tmr.Tick += rx_tmr_tick;

            // parse source file.  memorize line number of each address.
            source_fn = System.IO.Path.Combine(app_path, @"..\..\..\..\..\DE0_nano\source\synapse\program\target_program.mif");
            load_source(source_fn);
            rx_tmr.Start();

            this.WindowState = System.Windows.WindowState.Maximized;
        }

        protected void show_ipr(UInt16 addr)
        {
            if (line_nums.ContainsKey(addr))
            {
                //src_txt.ScrollToVerticalOffset()
                //src_txt.BringIntoView()
                UInt16 lnum = line_nums[addr];
                Paragraph lin = lines[lnum];
                src_txt.Focus();
                lin.BringIntoView();
                src_txt.Selection.Select(lin.ContentStart, lin.ContentEnd);
                last_ipr = addr;
            }            
        }

        public void rx_tmr_tick(object sender, EventArgs args)
        {
            int avail = port.BytesToRead;
            if (avail > 0)
            {
                byte[] b = new byte[avail];
                int actual = port.Read(b, 0, avail);
                if (actual < avail)
                    log(" read_fail ");
                if (actual > 0)
                {
                    string s = Encoding.ASCII.GetString(b, 0, actual);
                    log(s, false); 
                    rx_sbuf.Append(s);
                    if (rx_sbuf.Length > RETAIN_CHARS)
                        rx_sbuf.Remove(0, rx_sbuf.Length - RETAIN_CHARS);
                    s = rx_sbuf.ToString();
                    Match m = ipr_re.Match(s);
                    if (m.Success)
                    {
                        show_ipr(UInt16.Parse(m.Groups[1].Value, System.Globalization.NumberStyles.HexNumber));
                    }
                }
            }
        }

        public string hex_dump(byte[] b)
        {
            return hex_dump(b, 0, b.GetUpperBound(0));
        }

        public string hex_dump(byte[] b, int start, int final)
        {
            StringBuilder sb = new StringBuilder();
            for (int i = start; i <= final; i++)
                sb.Append(b[i].ToString("X2")).Append(' ');
            return sb.ToString();
        }

        public void log(string s, bool newline = true)
        {
            if (newline)
                journal.AppendText(s + '\n');
            else
                journal.AppendText(s);
            //journal.SelectionLength = 0;
            //journal.SelectionStart = journal.Text.Length;
            journal.ScrollToEnd();
            journal.Dispatcher.Invoke(emptyDelegate, DispatcherPriority.Render); 
        }

        public void logf(string patn, params object[] args)
        {
            log(string.Format(patn, args));
        }

        public void send(string s)
        {
            char[] ar = new char[1];
            foreach (char c in s)
            {
                ar[0] = c;
                port.Write(ar, 0, 1);
                Thread.Sleep(50);
            }
        }

        public void send(byte[] a, int start, int len)
        {
            for (int i = start; i < (start + len); i++)
            {
                port.Write(a, i, 1);
                Thread.Sleep(20);
                rx_tmr_tick(null, null);
            }
        }

        private void step_btn_Click(object sender, RoutedEventArgs e)
        {
            send("n");
        }

        private void run_btn_Click(object sender, RoutedEventArgs e)
        {
            send("r");
        }


        private void load_btn_Click(object sender, RoutedEventArgs e)
        {
            string src_fn = System.IO.Path.Combine(app_path, @"..\..\..\..\..\DE0_nano\source\target_program.bin");
            log(src_fn);
            send("l");
            byte[] b;
            using (System.IO.FileStream fs = new System.IO.FileStream(src_fn, System.IO.FileMode.Open, System.IO.FileAccess.Read))
            {
                b = new byte[fs.Length];
                fs.Read(b, 0, (int)fs.Length);
            }
            send(b, 0, b.Length);
            load_source(source_fn);
        }

        private void set_bp(int bpnum, TextBox tb)
        {
            try
            {                
                string s = tb.Text.Trim().ToLower();
                UInt16 addr = UInt16.Parse(s, System.Globalization.NumberStyles.HexNumber);
                send("b" + bpnum + "=" + addr.ToString("x4"));            
            }
            catch (Exception ex)
            {
                log(ex.ToString());
            }
        }

        private void set_bp0_btn_Click(object sender, RoutedEventArgs e)
        {
            set_bp(0, bp0_txt);
        }

        private void set_bp1_btn_Click(object sender, RoutedEventArgs e)
        {
            set_bp(1, bp1_txt);
        }

        private void set_bp2_btn_Click(object sender, RoutedEventArgs e)
        {
            set_bp(2, bp2_txt);
        }

        private void set_bp3_btn_Click(object sender, RoutedEventArgs e)
        {
            set_bp(3, bp3_txt);
        }

        private void bp3_txt_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
                set_bp3_btn_Click(null, null);
        }

        private void bp2_txt_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
                set_bp2_btn_Click(null, null);
        }

        private void bp1_txt_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
                set_bp1_btn_Click(null, null);
        }

        private void bp0_txt_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
                set_bp0_btn_Click(null, null);
        }





    }
}
