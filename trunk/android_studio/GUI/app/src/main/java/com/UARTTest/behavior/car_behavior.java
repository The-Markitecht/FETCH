package com.UARTTest.behavior;

import android.os.Handler;
import android.os.SystemClock;

import com.UARTTest.FT311UARTInterface;
import com.UARTTest.framework.*;

import java.nio.charset.Charset;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class car_behavior extends behavior {
    protected FT311UARTInterface uart = null;
    protected final int RX_BUF_LEN = 1000;
    protected byte[] rxbytes = new byte[RX_BUF_LEN];
    protected StringBuilder rxtext = new StringBuilder(RX_BUF_LEN);
    protected Charset ascii = Charset.forName("US-ASCII");
    protected Pattern pat = Pattern.compile(" ^ ([0-9a-f]{4}) : \\s .. = ([0-9a-f]{4}) \\s .. = ([0-9a-f]{4}) \\s ... = ([0-9a-f]{4}) \\r\\n ", Pattern.CASE_INSENSITIVE | Pattern.COMMENTS);

    // simulator
    protected boolean simulator_enabled = false;
    protected long next_sim_packet_ms = 0;

    public car_behavior(FT311UARTInterface u, Handler gui_hnd) {
        super();
        uart = u;
        gui = gui_hnd;
    }


    @Override public boolean process(command_msg cmd) throws Exception  {
        super.process(cmd);
        if (cmd instanceof m.enable_sim_cmd) {
            simulator_enabled = ((m.enable_sim_cmd) cmd).valu;
            return true;
        }
        return false;
    }

    @Override public void poll() throws Exception {
        super.poll();

        // receive bytes from car's embedded computer.
        int actual = 0;
        if (simulator_enabled) {
            long now = SystemClock.elapsedRealtime();
            if (now >= next_sim_packet_ms) {
                next_sim_packet_ms = now + 1000;
                int temp = (int)((now / 100) % 600);
                String s = String.format("%04x: s2=%04x s1=%04x ref=%04x\r\n", now % 0x10000, temp, temp, temp);
                actual = s.length();
                rxtext.append(s);
                // copy the simulator string to the real uart, to see on the scope.
                uart.SendData(s.length(), ascii.encode(s).array());
            }
        } else {
            //actual = uart.ReadData(RX_BUF_LEN, rxbytes);
            actual = uart.inputstream.read(rxbytes, 0, RX_BUF_LEN);
            if (actual > 0) {
                String s = new String(rxbytes, 0, actual, ascii);
                rxtext.append(s);
                send_to_gui((new m.text_rx_event()).set(s));
            }
        }

        // scan for end-of-line.  start scanning from the start of rxtext, regardless of
        // how much of it has just arrived on this pass, or how much has just been consumed on this pass.
        if (actual > 0) {
            // search rxbytes for a \n and ignore the \r.
            int lfpos = rxtext.indexOf("\n");
            while (lfpos >= 0) {
                send_to_gui(parse(rxtext, lfpos));
                lfpos = rxtext.indexOf("\n");
            }
        }
    }

    protected m.car_data_frame parse(StringBuilder txt, int lfpos) {
        int beyond = lfpos + 1;
        if (txt.charAt(lfpos - 1) == '\r') {
            System.out.println(txt.substring(0, beyond));
            Matcher mat = pat.matcher(txt);
            if (mat.find()) {
                m.car_data_frame fr = new m.car_data_frame();
                fr.timestamp = Integer.parseInt(mat.group(1).toString(), 16);
                fr.brake_temp = new int[4];
                fr.brake_temp[m.wheels.FL.ordinal()] = adc_to_deg_f(Integer.parseInt(mat.group(2).toString(), 16));
                fr.brake_temp[m.wheels.FR.ordinal()] = adc_to_deg_f(Integer.parseInt(mat.group(3).toString(), 16));
                fr.engine_block_temp = adc_to_deg_f(Integer.parseInt(mat.group(4).toString(), 16));
                txt.delete(0, mat.end());
                return fr;
            }
        }
        // junk.
        txt.delete(0, beyond);
        return null;
    }

    protected int adc_to_deg_f(int adc) {
        // simple linear function.  based on endpoints of S2 in oven bake test 2015/1/16.
        // reads 20 deg F too low esp. at the low end.
        //patch: upgrade to lookup table with linear interpolation.  OR get Excel etc. to fit a polynomial to it.
        float m = 5.507157F;
        float b = 221.9775F;
        //return (int)(m * (float)adc + b);
        // had to reverse the linear function because i accidentally swapped X and Y before solving the equations.
        return (int)(((float)adc - b) / m);
    }
}
