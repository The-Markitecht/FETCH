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
using debug_monitor;

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
        protected Dictionary<string,UInt16> src_reg_map = new Dictionary<string,UInt16>();
        protected Dictionary<string,UInt16> dest_reg_map = new Dictionary<string,UInt16>();
        protected Dictionary<string,UInt32> ram_map = new Dictionary<string,UInt32>();
        protected Regex ipr_re = new Regex("\n([0-9a-f]{4}),([0-9a-f]{4}) >$", RegexOptions.Compiled);
        protected List<Paragraph> lines = new List<Paragraph>();
        protected string source_fn = null;
        protected UInt16 last_known_hilite = 0;
        protected UInt16 last_known_ipr = 0;
        protected UInt16 lagged_ipr = 0;

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
            Regex src_re = new Regex(patn, RegexOptions.Compiled | RegexOptions.IgnorePatternWhitespace);
            patn = @" ^ \s* -- \s* (src|dest) \s* reg \s* ([0-9a-f]{4}) \s+ (\w+) \s* $ ";
            Regex reg_map_re = new Regex(patn, RegexOptions.Compiled | RegexOptions.IgnorePatternWhitespace);
            patn = @" ^ \s* -- \s* ram \s* ([0-9a-f]{8}) \s+ (\w+) \s* $ ";
            Regex ram_map_re = new Regex(patn, RegexOptions.Compiled | RegexOptions.IgnorePatternWhitespace);
            UInt16 lnum = 0;
            lines.Clear();
            line_nums.Clear();
            src_reg_map.Clear();
            ram_map.Clear();
            src_doc.Blocks.Clear();
            using (System.IO.StreamReader rdr = new System.IO.StreamReader(src_fn))
            {                
                while ( ! rdr.EndOfStream) 
                {
                    string lin = rdr.ReadLine();

                    Match m = src_re.Match(lin);
                    if (m.Success)
                    {
                        UInt16 addr = UInt16.Parse(m.Groups[1].Value, System.Globalization.NumberStyles.HexNumber);
                        //UInt16 lnum = UInt16.Parse(m.Groups[3].Value);
                        line_nums[addr] = lnum;
                    }

                    m = reg_map_re.Match(lin);
                    if (m.Success)
                    {
                        UInt16 addr = UInt16.Parse(m.Groups[2].Value, System.Globalization.NumberStyles.HexNumber);
                        string name = m.Groups[3].Value.ToLower();
                        if (m.Groups[1].Value == "src")
                            src_reg_map[name] = addr;
                        else
                            dest_reg_map[name] = addr;
                    }

                    m = ram_map_re.Match(lin);
                    if (m.Success)
                    {
                        UInt32 addr = UInt32.Parse(m.Groups[1].Value, System.Globalization.NumberStyles.HexNumber);
                        string name = m.Groups[2].Value.ToLower();
                        ram_map[name] = addr;
                    }

                    Paragraph p = new Paragraph(new Run(lin));
                    lines.Add(p);
                    src_doc.Blocks.Add(p);
                    lnum++;
                }
            }            
            show_ipr();
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

        protected void show_hilite(UInt16 addr)
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
                last_known_hilite = addr;
            }            
        }

        protected void show_ipr()
        {
            if ((bool)ipr_chk.IsChecked) 
                show_hilite(last_known_ipr);
            else
                show_hilite(lagged_ipr); // guesses which instruction is in the EXR right now, based on where the IPR was pointed in the previous step.
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
                        lagged_ipr = last_known_ipr;
                        last_known_ipr = UInt16.Parse(m.Groups[1].Value, System.Globalization.NumberStyles.HexNumber);
                        show_ipr();
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
                Thread.Sleep(2);
            }
        }

        public void send(byte[] a, int start, int len)
        {
            for (int i = start; i < (start + len); i++)
            {
                port.Write(a, i, 1);
                Thread.Sleep(1);
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
            string src_fn = System.IO.Path.Combine(app_path, @"..\..\..\..\..\DE0_nano\source\synapse\program\target_program.bin");
            log(src_fn);
            send("l");
            byte[] b;
            fletcher16 sum = new fletcher16();
            using (System.IO.FileStream fs = new System.IO.FileStream(src_fn, System.IO.FileMode.Open, System.IO.FileAccess.Read))
            {
                b = new byte[fs.Length];
                fs.Read(b, 0, b.Length);
            }

            //b = new byte[0x10];
            //b[0] = (byte)(b.Length / 2 - 1); // program length field (in words).
            //b[1] = 0;
            //for (int i = 2; i < b.Length; i++)
            //    b[i] = (byte)i;

            for (int i = 2; i < b.Length; i++)
                sum.input8(b[i]);
            logf("{0} = file sum", sum.result().ToString("x4"));

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

        private void exr_chk_Checked(object sender, RoutedEventArgs e)
        {
            show_ipr();
        }

        private void ipr_chk_Checked(object sender, RoutedEventArgs e)
        {
            show_ipr();
        }

        private void dump0_btn_Click(object sender, RoutedEventArgs e)
        {
            dump(dump0_addr_txt, dump0_len_txt);
        }

        private void dump1_btn_Click(object sender, RoutedEventArgs e)
        {
            dump(dump1_addr_txt, dump1_len_txt);
        }

        private void dump(TextBox addr_txt, TextBox len_txt)
        {
            try
            {                
                string s = addr_txt.Text.Trim().ToLower();
                UInt32 addr = UInt32.Parse(s, System.Globalization.NumberStyles.HexNumber);
                UInt16 addr_hi = (UInt16)(addr >> 16);
                UInt16 addr_lo = (UInt16)(addr & 0xffff);
                s = len_txt.Text.Trim().ToLower();
                UInt16 len = UInt16.Parse(s, System.Globalization.NumberStyles.HexNumber);
                s = "u" + src_reg_map["av_write_data"].ToString("x4") + " " + src_reg_map["av_read_data"].ToString("x4") 
                    + " " + src_reg_map["av_ad_lo"].ToString("x4") + " " + src_reg_map["av_ad_hi"].ToString("x4") 
                    + " " + addr_hi.ToString("x4") + " " + addr_lo.ToString("x4") + " " + len.ToString("x4") + ".";
                log("\n" + s);
                send(s);            
            }
            catch (Exception ex)
            {
                log(ex.ToString());
            }
        }






    }
}
