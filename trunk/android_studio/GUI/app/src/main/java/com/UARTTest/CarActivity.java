package com.UARTTest;

import android.app.ActionBar;
import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.widget.CheckBox;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ViewFlipper;
import android.widget.ViewSwitcher;

import com.UARTTest.behavior.*;
import com.UARTTest.framework.*;
import com.example.x.app.CustomGaugeMasterView;

import java.io.PrintWriter;
import java.io.StringWriter;


public class CarActivity extends Activity {

    // Acer A110 tablet screen physical 600x1024,
    // 600x976 deducting action bar,
    // 1024x552 in landscape deducting action bar.

    protected ViewFlipper flipper;
    protected TextView timestamp_txt;
    protected TextView cons_txt;
    protected CustomGaugeMasterView engine_temp_gage;
    protected CustomGaugeMasterView trans_temp_gage;
    protected CustomGaugeMasterView ecm_temp_gage;
    protected CustomGaugeMasterView[] brake_temp_gage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_car);

        try {
            hide_android_gui();

            View decorView = getWindow().getDecorView();
            decorView.setOnSystemUiVisibilityChangeListener(new View.OnSystemUiVisibilityChangeListener() {
                @Override
                public void onSystemUiVisibilityChange(int visibility) {
                    // Note that system bars will only be "visible" if none of the
                    // LOW_PROFILE, HIDE_NAVIGATION, or FULLSCREEN flags are set.
                    if ((visibility & View.SYSTEM_UI_FLAG_FULLSCREEN) == 0) {
                        // The system bars are visible.
                        hide_android_gui();
                    } else {
                        // The system bars are NOT visible.
                    }
                }
            });

            flipper = (ViewFlipper)findViewById(R.id.flipper);
            timestamp_txt = (TextView)findViewById(R.id.timestamp_txt);
            cons_txt = (TextView)findViewById(R.id.cons);
            engine_temp_gage = (CustomGaugeMasterView)findViewById(R.id.engine_temp_gage);
            trans_temp_gage = (CustomGaugeMasterView)findViewById(R.id.trans_temp_gage);
            ecm_temp_gage = (CustomGaugeMasterView)findViewById(R.id.ecm_temp_gage);
            brake_temp_gage = new CustomGaugeMasterView[] {
                    (CustomGaugeMasterView)findViewById(R.id.brake_fl_gage),
                    (CustomGaugeMasterView)findViewById(R.id.brake_fr_gage),
                    null,
                    null
            };

            car_behavior car = new car_behavior(this, UARTTestActivity.uartInterface, hnd);

            global.bthread = new behavior_thread(new behavior[] {car});
            global.bthread.start();

        } catch (Exception ex) {
            ex.printStackTrace();
            cons(ex);
            Toast.makeText(this, ex.toString(), Toast.LENGTH_SHORT).show();
        }
    }

    protected Handler hnd = new Handler(Looper.getMainLooper()) {
        @Override public void handleMessage(Message msg) {
            if (msg.obj == null)
                return;

            if (msg.obj instanceof m.car_data_frame) {
                m.car_data_frame fr = (m.car_data_frame)msg.obj;
                timestamp_txt.setText(Integer.toString(fr.timestamp));
                engine_temp_gage.setValue(fr.engine_block_temp);
                trans_temp_gage.setValue(fr.transmission_temp);
                ecm_temp_gage.setValue(fr.ecm_heatsink_temp);
                for (int i = 0; i < 2; i++)
                    brake_temp_gage[i].setValue(fr.brake_temp[i]);

            } else if (msg.obj instanceof m.text_rx_event) {
                cons(((m.text_rx_event) msg.obj).valu);

            } else if (msg.obj instanceof m.exception_event) {
                cons(((m.exception_event) msg.obj).valu);
            }
        }
    };

    protected float origin_x = 500;
    protected int flip_child = 0;

    // these API constants are somehow inaccessible.
    //public static final int ANIM_SLIDE_IN_LEFT = 0x010a0002;
    //public static final int ANIM_SLIDE_OUT_RIGHT = 0x010a0003;

    @Override
    public boolean onTouchEvent(MotionEvent touchevent) {
        if (touchevent.getAction() == MotionEvent.ACTION_DOWN) {
            origin_x = touchevent.getX();
        } else if (touchevent.getAction() == MotionEvent.ACTION_UP) {
            float x = touchevent.getX();
            if (x < (origin_x - 200F)) {
                // swiped to left.  increase child index.
                flip_child = (flip_child + 1) % flipper.getChildCount();
                flipper.setOutAnimation(this, R.anim.slide_out_left);
                flipper.setInAnimation(this, R.anim.slide_in_right);
                flipper.setDisplayedChild(flip_child);
            }
            if (x > (origin_x + 200F)) {
                // swiped to right.  reduce child index.
                flip_child = (flip_child - 1) % flipper.getChildCount();
                flipper.setOutAnimation(this, R.anim.slide_out_right);
                flipper.setInAnimation(this, R.anim.slide_in_left);
                flipper.setDisplayedChild(flip_child);
            }
        }
        return false;
    }


    protected void hide_android_gui() {
        View decorView = getWindow().getDecorView();
        int uiOptions = View.SYSTEM_UI_FLAG_FULLSCREEN; //  | View.SYSTEM_UI_FLAG_LAYOUT_STABLE;
        decorView.setSystemUiVisibility(uiOptions);
        ActionBar actionBar = getActionBar();
        actionBar.hide();
    }

    protected void cons(CharSequence s) {
        while (cons_txt.length() > 1000)
            cons_txt.setText(cons_txt.getText().subSequence(1000, cons_txt.length()));
        cons_txt.append(s);
    }

    protected void cons(Exception ex) {
        StringWriter wtr = new StringWriter();
        ex.printStackTrace(new PrintWriter(wtr));
        cons(wtr.toString());
    }

    public void sim_change(View vw) {
        global.bthread.send((new m.enable_sim_cmd()).set(((Switch)vw).isChecked()));
    }

//
//    @Override
//    public boolean onCreateOptionsMenu(Menu menu) {
//        // Inflate the menu; this adds items to the action bar if it is present.
//        getMenuInflater().inflate(R.menu.menu_car, menu);
//        return true;
//    }
//
//    @Override
//    public boolean onOptionsItemSelected(MenuItem item) {
//        // Handle action bar item clicks here. The action bar will
//        // automatically handle clicks on the Home/Up button, so long
//        // as you specify a parent activity in AndroidManifest.xml.
//        int id = item.getItemId();
//
//        //noinspection SimplifiableIfStatement
//        if (id == R.id.action_settings) {
//            return true;
//        }
//
//        return super.onOptionsItemSelected(item);
//    }
}
