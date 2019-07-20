package fi.iki.elonen;

import android.content.Context;
import android.content.SharedPreferences;

import com.UARTTest.*;

import java.util.Map;

/**
 *  subclassing NanoHTTPD to make a custom HTTP server.
 */
public class HelloServer extends fi.iki.elonen.NanoHTTPD {
    public FT311UARTInterface uart = null;
    public long request_count = 0;

    public HelloServer() {
        super(8080);
    }

    @Override
    public Response serve(IHTTPSession session) {
        Method method = session.getMethod();
        String uri = session.getUri();
        System.out.println(method + " '" + uri + "' ");
        request_count++;

        byte[] buf = new byte[1];
        buf[0] = 67;
        uart.SendData(1, buf);

        String msg = "<html><body><h1>Hello server</h1><p>" + request_count + " requests dunked.</p>\n";
        Map<String, String> parms = session.getParms();
        if (parms.get("username") == null)
            msg +=
                    "<form action='?' method='get'>\n" +
                            "  <p>Your name: <input type='text' name='username'></p>\n" +
                            "</form>\n";
        else
            msg += "<p>Hello, " + parms.get("username") + "!</p>";

        msg += "</body></html>\n";

        return new NanoHTTPD.Response(msg);
    }


    public static void main(String[] args) {
        ServerRunner.run(fi.iki.elonen.HelloServer.class);
    }
}
