using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace debug_monitor
{
    class fletcher16
    {
        protected int sum1, sum2 = 0;

        public fletcher16() {
        }

        public void input16(UInt16 input) {
            input8((byte)(input));
            input8((byte)(input >> 8));
        }

        public void input8(byte input) {
            sum1 = (sum1 + input) % 0xff;
            sum2 = (sum2 + sum1) % 0xff;
        }

        public UInt16 result() {
            return (UInt16)((sum2 << 8) | sum1);
        }
    }
}
