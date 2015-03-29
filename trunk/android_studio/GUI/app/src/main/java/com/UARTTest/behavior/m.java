package com.UARTTest.behavior;

import com.UARTTest.framework.*;

import java.util.Date;

public abstract class m {
    public enum wheels {
        FL,
        FR,
        RL,
        RR
    }

    public static class enable_sim_cmd extends simple_cmd<Boolean> {}

    public static class exception_event extends simple_event<Exception> {}

    public static class text_rx_event extends simple_event<String> {}

    public static class car_data_frame extends event_msg {
        public int timestamp;
        public Date android_time;

        // temperatures not related to fuel injection.
        public int engine_block_temp;
        public int engine_air_intake_temp; // can be used as ambient temp.
        public int transmission_temp;
        public int[] brake_temp;
        public CharSequence temp_data_string;

        // fuel injection data.
        public int throttle_position;
        public int engine_rpm;
        public int pulse_width;
        public int exhaust_temp;
        public int exhaust_ox;

    }
}
