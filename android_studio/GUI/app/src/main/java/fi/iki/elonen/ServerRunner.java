package fi.iki.elonen;

import java.io.IOException;

public class ServerRunner {
    public static void run(Class serverClass) {
        try {
            executeInstance((NanoHTTPD) serverClass.newInstance());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void executeInstance(NanoHTTPD server) {
        try {
            server.start();
        } catch (IOException ioe) {
            System.err.println("Couldn't start server:\n" + ioe);
            ioe.printStackTrace();
            System.exit(-1);
        }

        System.out.println("Server started.\n");
        while (server.request_count < 1000000000) {}
        server.stop();
        System.out.println("Server stopped.\n");
    }
}
