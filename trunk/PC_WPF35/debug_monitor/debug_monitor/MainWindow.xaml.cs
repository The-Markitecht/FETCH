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
        protected Dictionary<UInt16,UInt16> old_values = new Dictionary<UInt16,UInt16>();
        protected Dictionary<UInt16,UInt16> line_nums = new Dictionary<UInt16,UInt16>();
        protected Regex ipr_re = new Regex("\n([0-9a-f]{4}),([0-9a-f]{4}) >$", RegexOptions.Compiled);
        protected List<Paragraph> lines = new List<Paragraph>();

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            // parse source file.  memorize line number of each address.
            string src_fn = System.IO.Path.Combine(app_path, @"..\..\..\..\..\DE0_nano\target_program.mif");
            log(src_fn);
            string patn = @" ^ \s* ([0-9a-f]{4}) \s* : \s* ([0-9a-f]{4}) \s* ; \s* -- \s* <(\d\d\d\d)> ";
            Regex re = new Regex(patn, RegexOptions.Compiled | RegexOptions.IgnorePatternWhitespace);
            UInt16 lnum = 0;
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

            port = new SerialPort("COM9", 115200, Parity.None, 8, StopBits.One);
            port.WriteTimeout = 500;
            port.ReadTimeout = 1;
            port.ReadBufferSize = 128;
            port.Open();

            rx_tmr = new DispatcherTimer();
            rx_tmr.Interval = TimeSpan.FromMilliseconds(100);
            rx_tmr.Tick += rx_tmr_tick;
            rx_tmr.Start();
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
                    log(s); 
                    rx_sbuf.Append(s);
                    if (rx_sbuf.Length > RETAIN_CHARS)
                        rx_sbuf.Remove(0, rx_sbuf.Length - RETAIN_CHARS);
                    s = rx_sbuf.ToString();
                    Match m = ipr_re.Match(s);
                    if (m.Success)
                    {
                        UInt16 addr = UInt16.Parse(m.Groups[1].Value, System.Globalization.NumberStyles.HexNumber);
                        if (line_nums.ContainsKey(addr))
                        {
                            //src_txt.ScrollToVerticalOffset()
                            //src_txt.BringIntoView()
                            UInt16 lnum = line_nums[addr];
                            Paragraph lin = lines[lnum];
                            src_txt.Focus();
                            lin.BringIntoView();
                            src_txt.Selection.Select(lin.ContentStart, lin.ContentEnd);
                        }
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

        public void log(string s)
        {
            journal.AppendText(s + '\n');
            //journal.SelectionLength = 0;
            //journal.SelectionStart = journal.Text.Length;
            journal.ScrollToEnd();
            journal.Dispatcher.Invoke(emptyDelegate, DispatcherPriority.Render); 
        }

        public void logf(string patn, params object[] args)
        {
            log(string.Format(patn, args));
        }

        private void clear_4da_btn_Click(object sender, RoutedEventArgs e)
        {
            _4da_txt.Clear();
            Keyboard.Focus(_4da_txt);
        }

        private void step_btn_Click(object sender, RoutedEventArgs e)
        {
            port.Write("n");
        }



    }
}
