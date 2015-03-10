package com.UARTTest;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.CheckBox;
import android.widget.TextView;

import com.UARTTest.behavior.*;
import com.UARTTest.framework.*;
import com.example.x.app.CustomGaugeMasterView;

import java.io.PrintWriter;
import java.io.StringWriter;


public class CarActivity extends Activity {

    protected TextView timestamp_txt;
    protected TextView cons_txt;
    protected CustomGaugeMasterView engine_temp_gage;
    protected CustomGaugeMasterView[] brake_temp_gage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_car);

        timestamp_txt = (TextView)findViewById(R.id.timestamp_txt);
        cons_txt = (TextView)findViewById(R.id.cons);
        engine_temp_gage = (CustomGaugeMasterView)findViewById(R.id.engine_temp_gage);
        brake_temp_gage = new CustomGaugeMasterView[] {
                (CustomGaugeMasterView)findViewById(R.id.brake_fl_gage),
                (CustomGaugeMasterView)findViewById(R.id.brake_fr_gage),
                null,
                null
        };

        car_behavior car = new car_behavior(UARTTestActivity.uartInterface, hnd);

        global.bthread = new behavior_thread(new behavior[] {car});
        global.bthread.start();
    }

    protected Handler hnd = new Handler(Looper.getMainLooper()) {
        @Override public void handleMessage(Message msg) {
            if (msg.obj == null)
                return;
            if (msg.obj instanceof m.car_data_frame) {
                m.car_data_frame fr = (m.car_data_frame)msg.obj;
                timestamp_txt.setText(Integer.toString(fr.timestamp));
                engine_temp_gage.setValue(fr.engine_block_temp);
                for (int i = 0; i < 2; i++)
                    brake_temp_gage[i].setValue(fr.brake_temp[i]);
            } else if (msg.obj instanceof m.text_rx_event) {
                cons(((m.text_rx_event) msg.obj).valu);
            } else if (msg.obj instanceof m.exception_event) {
                StringWriter wtr = new StringWriter();
                ((m.exception_event) msg.obj).valu.printStackTrace(new PrintWriter(wtr));
                cons(wtr.toString());
            }
        }
    };

    protected void cons(CharSequence s) {
        while (cons_txt.length() > 200)
            cons_txt.setText(cons_txt.getText().subSequence(200, cons_txt.length()));
        cons_txt.append(s);
    }

    public void sim_change(View vw) {
        global.bthread.send((new m.enable_sim_cmd()).set(((CheckBox)vw).isChecked()));
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_car, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
