package com.UARTTest.behavior;

import android.content.Context;
import android.os.Handler;
import android.os.SystemClock;

import com.UARTTest.FT311UARTInterface;
import com.UARTTest.framework.*;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class car_behavior extends behavior {
    protected FT311UARTInterface uart = null;
    protected final int RX_BUF_LEN = 1000;
    protected byte[] rxbytes = new byte[RX_BUF_LEN];
    protected StringBuilder rxtext = new StringBuilder(RX_BUF_LEN);
    protected Charset ascii = Charset.forName("US-ASCII");
    protected Pattern pat;

    // data storage
    protected ArrayList<m.car_data_frame> history = new ArrayList<m.car_data_frame>();
    protected final int HISTORY_LEN = 5;
    protected final int FLUSH_INTERVAL_FRAMES = 20;
    protected int next_flush_frame = 0;
    protected int logged_frame_count = 0;
    BufferedWriter daq_wtr;
    SimpleDateFormat daq_date_fmt;

    // simulator
    protected boolean simulator_enabled = false;
    protected long next_sim_packet_ms = 0;

    public car_behavior(Context cont, FT311UARTInterface u, Handler gui_hnd) throws Exception  {
        super();
        uart = u;
        gui = gui_hnd;

        final String s = " ^ ([0-9a-f]{4}) : "
         + "\\s s7=([0-9a-f]{4}) \\s s6=([0-9a-f]{4}) \\s s5=([0-9a-f]{4}) \\s s4=([0-9a-f]{4}) "
         + "\\s s3=([0-9a-f]{4}) \\s s2=([0-9a-f]{4}) \\s s1=([0-9a-f]{4}) \\s s0=([0-9a-f]{4}) "
         + "\\r\\n ";
        pat = Pattern.compile(s, Pattern.CASE_INSENSITIVE | Pattern.COMMENTS);

        File f = new File(cont.getDir("camaro", Context.MODE_PRIVATE), "temperature.csv");
        daq_wtr = new BufferedWriter(new FileWriter(f, true), 65536);
        daq_date_fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);
        daq_date_fmt.setTimeZone(TimeZone.getDefault());
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
            // simulate receiving some bytes.
            long now = SystemClock.elapsedRealtime();
            if (now >= next_sim_packet_ms) {
                next_sim_packet_ms = now + 1000;
                int temp = (int)((now / 10) % 4096);
                String s = String.format("%04x: s7=%04x s6=%04x s5=%04x s4=%04x s3=%04x s2=%04x s1=%04x s0=%04x\r\n",
                        now % 0x10000, temp, temp, temp, temp, temp, temp, temp, temp);
                actual = s.length();
                rxtext.append(s);
                send_to_gui((new m.text_rx_event()).set(s));
                // copy the simulator string to the real uart, to see on the scope.
                uart.SendData(s.length(), ascii.encode(s).array());
            }
        } else {
            if (uart.inputstream != null) {
                actual = uart.inputstream.read(rxbytes, 0, RX_BUF_LEN);
                if (actual > 0) {
                    String s = new String(rxbytes, 0, actual, ascii);
                    rxtext.append(s);
                    send_to_gui((new m.text_rx_event()).set(s));
                }
            }
        }

        // scan for end-of-line.  start scanning from the start of rxtext, regardless of
        // how much of it has just arrived on this pass, or how much has just been consumed on this pass.
        if (actual > 0) {
            // search rxbytes for a \n and ignore the \r.
            int lfpos = rxtext.indexOf("\n");
            while (lfpos >= 0) {
                m.car_data_frame fr = parse(rxtext, lfpos);
                if (fr != null) {
                    send_to_gui(fr);
                    add_to_history(fr);
                    save_data();
                }
                lfpos = rxtext.indexOf("\n"); // start searching again from the beginning, because parse() deleted a bite of it.
            }
        }
    }

    protected m.car_data_frame parse(StringBuilder txt, int lfpos) {
        int beyond = lfpos + 1;
        String frame_string = txt.substring(0, beyond);
        //System.out.println(frame_string);
        if (txt.charAt(lfpos - 1) == '\r') {
            Matcher mat = pat.matcher(frame_string);
            if (mat.find()) {
                m.car_data_frame fr = new m.car_data_frame();
                fr.timestamp = Integer.parseInt(mat.group(1).toString(), 16);
                fr.android_time = new Date();
                fr.temp_data_string = frame_string.trim();
                fr.brake_temp = new int[4];
                fr.ecm_heatsink_temp = adc_to_deg_f(Integer.parseInt(mat.group(2).toString(), 16)); // s7
                fr.transmission_temp = adc_to_deg_f(Integer.parseInt(mat.group( 6).toString(), 16)); // s3
                fr.engine_block_temp = adc_to_deg_f(Integer.parseInt(mat.group( 7).toString(), 16)); // s2
                fr.brake_temp[m.wheels.FR.ordinal()] = adc_to_deg_f(Integer.parseInt(mat.group( 8).toString(), 16)); // s1
                fr.brake_temp[m.wheels.FL.ordinal()] = adc_to_deg_f(Integer.parseInt(mat.group( 9).toString(), 16)); // s0

                txt.delete(0, mat.end());
                return fr;
            }
        }
        // junk.
        txt.delete(0, beyond);
        return null;
    }

    protected void add_to_history(m.car_data_frame fr) {
        history.add(fr);
        while (history.size() > HISTORY_LEN)
            history.remove(0);
    }

    protected void save_data() throws Exception  {
        if (history.size() == HISTORY_LEN) {
//            m.car_data_frame avg = new m.car_data_frame();
//            for (m.car_data_frame fr : history)
//                avg += fr;
//            avg /= HISTORY_LEN;

            // for now just decimate frames & save the latest one.
            m.car_data_frame last_frame = history.get(HISTORY_LEN - 1);
            daq_wtr.append(String.format("%s,fmt,1,trn,%d,tds,%s\n", daq_date_fmt.format(last_frame.android_time), last_frame.transmission_temp, last_frame.temp_data_string));
            logged_frame_count++;

            history.clear();

            // flush file buffer periodically.  this prevents automatic flushing in the middle of a data line.
            if (logged_frame_count >= next_flush_frame) {
                daq_wtr.flush();
                next_flush_frame = logged_frame_count + FLUSH_INTERVAL_FRAMES;
            }
        }
    }

    protected int adc_to_deg_f(int adc) {
        // simple linear function.  based on endpoints of S2 in oven bake test 2015/1/16.
        // reads 20 deg F too low esp. at the low end.
        //float m = 5.507157F;
        //float b = 221.9775F;
        //return (int)(m * (float)adc + b);
        // had to reverse the linear function because i accidentally swapped X and Y before solving the equations.
        //return (int)(((float)adc - b) / m);

        if (adc > 4090)
            return 0; // invalid reading; probably sensor is disconnected.

        //patch: temporary cubic polynomial; fitted while i had a temp-sensitive diode in series in the signal path.
        return (int)( 0.00000002183561 * Math.pow(adc, 3) - 0.0001432459 * Math.pow(adc, 2) + 0.4509008 * (double)adc - 158.6781 );
    }
}
