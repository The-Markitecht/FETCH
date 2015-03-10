package com.UARTTest.framework;

import android.os.Handler;

public abstract class behavior {
    protected Handler gui;

    public boolean process(command_msg cmd) throws Exception {
        // call from behavior_thread ONLY.
        // called once for each arriving command from GUI or elsewhere.
        // implement state changes here as applicable.
        // returns true if the message was consumed, otherwise false (e.g. it
        // was found to not be addressed to this behavior object.)

        return false;
    }

    public void poll() throws Exception {
        // call from behavior_thread ONLY.
        // called periodically to do any background operations.
    }

    protected void send_to_gui(event_msg ev) throws Exception  {
        if (ev == null)
            return;
        android.os.Message m = android.os.Message.obtain();
        m.obj = ev;
        gui.sendMessage(m);
    }

}
