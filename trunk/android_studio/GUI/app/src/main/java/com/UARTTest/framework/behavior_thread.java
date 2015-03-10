package com.UARTTest.framework;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

public class behavior_thread extends Thread {
    protected behavior[] behaviors;

    protected BlockingQueue<command_msg> cmdq; // one queue serializes commands for all behavior objects being polled by this thread.

    protected boolean running = false;

    public behavior_thread(behavior[] beh) {
        super();
        behaviors = beh.clone(); // list cannot change now that we've begun using it.
        cmdq = new ArrayBlockingQueue<command_msg>(10, true);
    }

    public void shutdown() {
        // thread-safe, for use in any thread.
        running = false;
    }

    @Override public void run() {
        running = true;
        while (running) {
            try {
                // state change commands.
                command_msg cmd = cmdq.poll();
                if (cmd != null) {
                    for (behavior b : behaviors) {
                        if (b.process(cmd))
                            break;
                    }
                }

                // background operations
                for (behavior b : behaviors) {
                    b.poll();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                //patch: send out an error event to the GUI!
            }

            // loop throttle.
            try {
                Thread.sleep(50, 0);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    public void send(command_msg cmd) {
        // thread-safe, for use in any thread.
        cmdq.add(cmd);
    }
}
