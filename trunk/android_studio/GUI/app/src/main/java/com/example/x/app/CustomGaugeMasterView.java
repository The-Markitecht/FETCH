package com.example.x.app;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.*;
import android.util.AttributeSet;
import android.view.View;

import com.UARTTest.R;


public class CustomGaugeMasterView extends View {

    private static final int DEFAULT_LONG_POINTER_SIZE = 1;

    private Paint mDialPaint, mPointerPaint, mTextPaint;
    private RectF mRect;
    private int mStartAngle;
    private int mSweepAngle;
    private int mStartValue;
    private int mEndValue;
    private int mValue;
    private double mUnitAngle;
    private int mPoint;
    private int[] mPointerColors;
    private float[] mPointerColorScale;

    public CustomGaugeMasterView(Context context)  throws Exception {
        super(context);
        throw new UnsupportedOperationException("Widget doesn't support that constructor.");
    }
    public CustomGaugeMasterView(Context context, AttributeSet attrs) {
        super(context, attrs);
        android.content.res.Resources res = getResources();

        // angle start and sweep (opposite direction 0, 270, 180, 90)
        mStartAngle = 180;
        mSweepAngle = 180;

        TypedArray a = context.getTheme().obtainStyledAttributes(attrs, R.styleable.CustomGaugeMasterView, 0, 0);
        try {
            // look for values in XML element declaring this view.  if not there, default to resource settings, or hard coded defaults.

            // scale (from mStartValue to mEndValue)
            mStartValue = a.getInt(R.styleable.CustomGaugeMasterView_scale_min, 0);
            mEndValue = a.getInt(R.styleable.CustomGaugeMasterView_scale_max, 100);
            // calculating sweep angle of one unit of scale value.
            mUnitAngle = ((double) Math.abs(mSweepAngle) / (mEndValue - mStartValue));

            // set up Paint brushes.
            mDialPaint = new Paint();
            mDialPaint.setColor(a.getColor(R.styleable.CustomGaugeMasterView_dial_color, res.getColor(R.color.gauge_dial)));
            mDialPaint.setStrokeWidth(a.getInt(R.styleable.CustomGaugeMasterView_dial_thickness, 20));
            mDialPaint.setAntiAlias(true);
            mDialPaint.setStrokeCap(Paint.Cap.BUTT);
            mDialPaint.setStyle(Paint.Style.STROKE);

            mPointerPaint = new Paint(mDialPaint);
            mPointerPaint.setStrokeWidth(a.getInt(R.styleable.CustomGaugeMasterView_dial_thickness, (int)mDialPaint.getStrokeWidth() * 5 / 4));

            mTextPaint = new Paint(mDialPaint);
            mTextPaint.setTextAlign(Paint.Align.CENTER);
            mTextPaint.setColor(a.getColor(R.styleable.CustomGaugeMasterView_text_color, res.getColor(R.color.window_text)));

            // allow for up to 3 solid color regions in the value indicator.
            // areas between those regions are filled in as a color gradient between their colors.
            mPointerColors = new int[] {
                    a.getColor(R.styleable.CustomGaugeMasterView_color_1, Color.rgb(0, 180, 0)),
                    a.getColor(R.styleable.CustomGaugeMasterView_color_1, Color.rgb(0, 180, 0)),
                    a.getColor(R.styleable.CustomGaugeMasterView_color_2, Color.rgb(0, 180, 0)),
                    a.getColor(R.styleable.CustomGaugeMasterView_color_2, Color.rgb(0, 180, 0)),
                    a.getColor(R.styleable.CustomGaugeMasterView_color_3, Color.rgb(0, 180, 0)),
                    a.getColor(R.styleable.CustomGaugeMasterView_color_3, Color.rgb(0, 180, 0))
            };
            mPointerColorScale = new float[] {
                    0.5F,
                    (float)scale_to_sweep(a.getInt(R.styleable.CustomGaugeMasterView_color_1_max, mStartValue + mEndValue * 1 / 5)),
                    (float)scale_to_sweep(a.getInt(R.styleable.CustomGaugeMasterView_color_2_min, mStartValue + mEndValue * 2 / 5)),
                    (float)scale_to_sweep(a.getInt(R.styleable.CustomGaugeMasterView_color_2_max, mStartValue + mEndValue * 3 / 5)),
                    (float)scale_to_sweep(a.getInt(R.styleable.CustomGaugeMasterView_color_3_min, mStartValue + mEndValue * 4 / 5)),
                    1.0F
            };
        } finally {
            a.recycle();
        }

        mRect = new RectF();

        setValue(mEndValue);
    }

    protected double scale_to_deg(float scale_value) {
        // convert gauge value to degrees of pointer.
        return mStartAngle + (scale_value - mStartValue) * mUnitAngle;
    }

    protected double scale_to_one(float scale_value) {
        // normalize to a range of 0.0 to 1.0.
        return (scale_value - mStartValue) / (mEndValue - mStartValue);
    }

    protected double scale_to_sweep(float scale_value) {
        // dial uses only second half of a unit.  0.5 to 1.0.
        return scale_to_one(scale_value) / 2 + 0.5;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);

        //mRect.set(mRectLeft, mRectTop, mRectRight, mRectBottom);
        int margin = (int)mPointerPaint.getStrokeWidth() / 2 + 2;
        mRect.set(margin, margin, getWidth() - margin, (getHeight() - margin) * 2);

        // frame
//        mPaint.setShader(null);
//        mPaint.setColor(Color.rgb(0, 255, 0));
//        canvas.drawRect(mRect, mPaint);

        // dial arc
        canvas.drawArc(mRect, mStartAngle, mSweepAngle, false, mDialPaint);

        // value indication.
//        if (mPointSize>0) {
//            // fixed-size pointer
//            if (mPoint > mStartAngle + mPointSize/2) {
//                canvas.drawArc(mRect, mPoint - mPointSize/2, mPointSize, false, mPointerPaint);
//            }
//            else { //to avoid excedding start/zero point
//                canvas.drawArc(mRect, mPoint, mPointSize, false, mPointerPaint);
//            }
//        }
//        else {
            // value's occupied area along the dial arc.
            // draw from start point to value point (long pointer)
            mPointerPaint.setShader(new SweepGradient( mRect.centerX(), mRect.centerY(), mPointerColors, mPointerColorScale ));
            if (mValue==mStartValue) //use non-zero default value for start point (to avoid lack of pointer for start/zero value)
                canvas.drawArc(mRect, mStartAngle, DEFAULT_LONG_POINTER_SIZE, false, mPointerPaint);
            else
                canvas.drawArc(mRect, mStartAngle, mPoint - mStartAngle, false, mPointerPaint);
//        }

        // value text
        mTextPaint.setTextSize(getHeight() / 2);
        mTextPaint.setStrokeWidth(mTextPaint.getTextSize() / 10);
        canvas.drawText(String.format("%d", mValue), mRect.centerX(), mRect.centerY(), mTextPaint);
    }

    public void setValue(int value) {
        mValue = value;
        mPoint = (int) scale_to_deg(value);
        invalidate();
    }

    public int getValue() {
        return mValue;
    }
}
