package com.UARTTest;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.Double;

import java.io.FileNotFoundException;
import java.net.*;

import com.UARTTest.FT311UARTInterface;

import fi.iki.elonen.*;

public class UARTTestActivity extends Activity
{	
	final int UPDATE_READ_DATA = 1;
	final int UPDATE_READ_DATA_DONE = 4;
	final int UPDATE_SEND_DATA = 2;
	final int UPDATE_SEND_DATA_DONE = 3;
	
	/*declare a FT311 UART interface variable*/
    public static FT311UARTInterface uartInterface;
    
    /*graphical objects*/
    EditText TimeText;
    Spinner baudSpinner;;
    Spinner stopSpinner;
    Spinner dataSpinner;
    Spinner paritySpinner;
    Spinner flowSpinner;
    
    Button configButton,savefileButton, sendfileButton1;
    
    /*local variables*/
//    byte[] writeBuffer;
    byte[] readBuffer;
    int [] actualNumBytes;
    
    int baudRate; /*baud rate*/
    byte stopBit; /*1:1stop bits, 2:2 stop bits*/
    byte dataBit; /*8:8bit, 7: 7bit*/
    byte parity;  /* 0: none, 1: odd, 2: even, 3: mark, 4: space*/
    byte flowControl; /*0:none, 1: flow control(CTS,RTS)*/

    private static final String FILE_NAME = "SavedFile.txt";
    private static final String ACCESS_FILE = android.os.Environment.getExternalStorageDirectory()
    											+ java.io.File.separator + FILE_NAME;
    
    public FileInputStream fos_open;
    public FileOutputStream fos_save;
    public BufferedOutputStream buf_save;
    
    public long start_time, end_time;
    long cal_time_1, cal_time_2;
    int totalDataCount = 0;

//	public save_data_thread save_data_Thread;
//	public send_file_thread send_file_Thread;

	public Context global_context;
   
    boolean WriteFileThread_start = false;

    //patch: obsolete
    private static final int SERVERPORT = 9900;
    private static final String SERVER_IP = "127.0.0.1";
    private Socket socket;

    //patch: new nanoHTTPd stuff
    HelloServer server = null;

    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        global_context = this;
        setContentView(R.layout.main);
        
        TimeText = (EditText)findViewById(R.id.TimeValues);        
                       
        configButton = (Button)findViewById(R.id.configButton);
        savefileButton = (Button)findViewById(R.id.SaveFileButton);
        sendfileButton1 = (Button)findViewById(R.id.SendFileButton1);        

        /*allocate buffer*/
//        writeBuffer = new byte[64];
        readBuffer = new byte [4096];
        actualNumBytes = new int[1];
                
        /*setup the baud rate list*/
        baudSpinner = (Spinner)findViewById(R.id.baudRateValue);
        ArrayAdapter<CharSequence> baudAdapter = ArrayAdapter.createFromResource(this, R.array.baud_rate, 
        									R.layout.my_spinner_textview);
        baudAdapter.setDropDownViewResource(R.layout.my_spinner_textview);
        baudSpinner.setAdapter(baudAdapter);
        baudSpinner.setGravity(0x10);
        baudSpinner.setSelection(4);
        /*by default it is 9600*/
        baudRate = 9600;
        
        /*stop bits*/
        stopSpinner = (Spinner)findViewById(R.id.stopBitValue);
        ArrayAdapter<CharSequence> stopAdapter = ArrayAdapter.createFromResource(this,
        										 R.array.stop_bits, R.layout.my_spinner_textview);
        
        stopAdapter.setDropDownViewResource(R.layout.my_spinner_textview);
        stopSpinner.setAdapter(stopAdapter);
        stopSpinner.setGravity(0x01);
        /*default is stop bit 1*/
        stopBit = 1;        
        
        /*daat bits*/
        dataSpinner = (Spinner)findViewById(R.id.dataBitValue);
        ArrayAdapter<CharSequence> dataAdapter = ArrayAdapter.createFromResource(this,
        										 R.array.data_bits, R.layout.my_spinner_textview);
        
        dataAdapter.setDropDownViewResource(R.layout.my_spinner_textview);
        dataSpinner.setAdapter(dataAdapter);
        dataSpinner.setGravity(0x11);
        dataSpinner.setSelection(1);
        /*default data bit is 8 bit*/
        dataBit = 8;
        
        /* parity*/
        paritySpinner = (Spinner)findViewById(R.id.parityValue);
        ArrayAdapter<CharSequence> parityAdapter = ArrayAdapter.createFromResource(this,
        										 R.array.parity, R.layout.my_spinner_textview);
        
        parityAdapter.setDropDownViewResource(R.layout.my_spinner_textview);
        paritySpinner.setAdapter(parityAdapter);
        paritySpinner.setGravity(0x11);
        /*default is none*/
        parity = 0;
        
        /*flow control*/
        flowSpinner = (Spinner)findViewById(R.id.flowControlValue);
        ArrayAdapter<CharSequence> flowAdapter = ArrayAdapter.createFromResource(this,
        										 R.array.flow_control, R.layout.my_spinner_textview);
        
        flowAdapter.setDropDownViewResource(R.layout.my_spinner_textview);
        flowSpinner.setAdapter(flowAdapter);
        flowSpinner.setGravity(0x11);
        /*default flow control is is none*/
        flowControl = 0;
        
        uartInterface = new FT311UARTInterface(this, null);

        server = new HelloServer();
        server.uart = uartInterface;

//        savefileButton.setOnClickListener(new View.OnClickListener()
//        {
//			//@Override
//			public void onClick(View v) {
//				if(false == WriteFileThread_start)
//				{
//					Toast.makeText(global_context, "Prepare to save data to file ...", Toast.LENGTH_SHORT).show();
//
//			        try {
//						fos_save = new FileOutputStream(ACCESS_FILE);
//						buf_save =  new BufferedOutputStream(fos_save);
//					} catch (FileNotFoundException e) {e.printStackTrace();}
//
//					WriteFileThread_start = true;
//					save_data_Thread = new save_data_thread(handler);
//					save_data_Thread.start();
//				}
//				else
//				{
//					Toast.makeText(global_context, "Close file", Toast.LENGTH_SHORT).show();
//					WriteFileThread_start = false;
//					try {
//						buf_save.flush();
//						buf_save.close();
//						fos_save.close();
//					} catch (IOException e) {
//						e.printStackTrace();
//					}
//				}
//			}
//		});

//		sendfileButton1.setOnClickListener(new View.OnClickListener()
//		{
//			//@Override
//			public void onClick(View v)
//			{
///*
//                Toast.makeText(global_context, "Send 1 char", Toast.LENGTH_SHORT).show();
//                byte[] buffer = new byte[10];
//                buffer[0] = 'F';
//                uartInterface.SendData(1, buffer);
//*/
//                new Thread(new ServerThread()).start();
//                try {
//                    Thread.sleep(1000);
//                } catch (Exception ex) {}
//                new Thread(new ClientThread()).start();
//
//
//
////					Toast.makeText(global_context, "Start sending Saved_File...", Toast.LENGTH_SHORT).show();
////
////			        try {
////						//fos_open = openFileInput("Saved_File");
////						fos_open = new FileInputStream(ACCESS_FILE);
////					} catch (FileNotFoundException e) {e.printStackTrace();}
////
////			        TimeText.setText("Sending...");
////					//uartInterface.StartWriteFileThread();
////			        send_file_Thread = new send_file_thread(handler, fos_open);
////			        send_file_Thread.start();
//			}
//		});

        /*set the adapter listeners for baud*/
        baudSpinner.setOnItemSelectedListener(new MyOnBaudSelectedListener());
        /*set the adapter listeners for stop bits*/
        stopSpinner.setOnItemSelectedListener(new MyOnStopSelectedListener());
        /*set the adapter listeners for data bits*/
        dataSpinner.setOnItemSelectedListener(new MyOnDataSelectedListener());
        /*set the adapter listeners for parity*/
        paritySpinner.setOnItemSelectedListener(new MyOnParitySelectedListener());
        /*set the adapter listeners for flow control*/
        flowSpinner.setOnItemSelectedListener(new MyOnFlowSelectedListener());
    }
    
    
    public class MyOnBaudSelectedListener implements OnItemSelectedListener
    {    
    	public void onItemSelected(AdapterView<?> parent, View view, int pos, long id) 
    	{
    		baudRate = Integer.parseInt(parent.getItemAtPosition(pos).toString());
    	}

    	public void onNothingSelected(AdapterView<?> parent) 
    	{      // Do nothing.    }}
    	}
    }
    
    public class MyOnStopSelectedListener implements OnItemSelectedListener
    {    
    	public void onItemSelected(AdapterView<?> parent, View view, int pos, long id) 
    	{
    		stopBit = (byte)Integer.parseInt(parent.getItemAtPosition(pos).toString());
    	}

    	public void onNothingSelected(AdapterView<?> parent) 
    	{      // Do nothing.    }}
    	}
    }
    
    public class MyOnDataSelectedListener implements OnItemSelectedListener 
    {    
    	public void onItemSelected(AdapterView<?> parent, View view, int pos, long id) 
    	{
    		dataBit = (byte)Integer.parseInt(parent.getItemAtPosition(pos).toString());

    	}

    	public void onNothingSelected(AdapterView<?> parent) 
    	{      // Do nothing.    }}
    	}
    }
    
    public class MyOnParitySelectedListener implements OnItemSelectedListener
    {    
    	public void onItemSelected(AdapterView<?> parent, View view, int pos, long id) 
    	{
    		String parityString = new String(parent.getItemAtPosition(pos).toString());
    		if(parityString.compareTo("None") == 0)
    		{
    			parity = 0;
    		}

    		if(parityString.compareTo("Odd") == 0)
    		{
    			parity = 1;
    		}

    		if(parityString.compareTo("Even") == 0)
    		{
    			parity = 2;
    		}

    		if(parityString.compareTo("Mark") == 0)
    		{
    			parity = 3;
    		}

    		if(parityString.compareTo("Space") == 0)
    		{
    			parity = 4;
    		}
    	}

    	public void onNothingSelected(AdapterView<?> parent) 
    	{      // Do nothing.    }}
    	}
    }
    
    public class MyOnFlowSelectedListener implements OnItemSelectedListener
    {    	
    	public void onItemSelected(AdapterView<?> parent, View view, int pos, long id) 
    	{
    		String flowString = new String(parent.getItemAtPosition(pos).toString());
    		if(flowString.compareTo("None")==0)
    		{
    			flowControl = 0;
    		}

    		if(flowString.compareTo("CTS/RTS")==0)
    		{
    			flowControl = 1;
    		}

    	}

    	public void onNothingSelected(AdapterView<?> parent) 
    	{      // Do nothing.    }}
    	}
    }

    public void config_click(View vw) {
        //uartInterface.SetConfig(baudRate, dataBit, stopBit, parity, flowControl);
        uartInterface.SetConfig(115200, (byte)8, (byte)1, (byte)0, (byte)0);
        //patch
        //ServerRunner.executeInstance(server);
        try {
//                    Toast.makeText(global_context, "config'ing", Toast.LENGTH_SHORT).show();
//                    uartInterface.SetConfig(baudRate, dataBit, stopBit, parity, flowControl);
//                    for (int i = 0; i < 50; i++) {
//                        Thread.sleep(5000, 0);
//                        byte[] buf = new byte[1];
//                        buf[0] = 67;
//                        Toast.makeText(global_context, "sending " + i, Toast.LENGTH_SHORT).show();
//                        uartInterface.SendData(1, buf);
//                    }
            server.start();
            Toast.makeText(global_context, "http server started", Toast.LENGTH_LONG).show();

            startActivity(new Intent(this, CarActivity.class));

        } catch (Exception ex) {
            Toast.makeText(global_context, "patch: " + ex.toString(), Toast.LENGTH_LONG).show();
        }
    }

    @Override
    protected void onResume() {
        // Ideally should implement onResume() and onPause()
        // to take appropriate action when the activity looses focus
        super.onResume();
        uartInterface.ResumeAccessory();
    }

    @Override
    protected void onPause() {
        // Ideally should implement onResume() and onPause()
        // to take appropriate action when the activity looses focus
        super.onPause();
    }
    
    @Override 
    protected void onDestroy(){    	
    	uartInterface.DestroyAccessory(true);
    	android.os.Process.killProcess(android.os.Process.myPid());
    	super.onDestroy();
    }


	
/*********************helper routines*************************************************/		

	final Handler handler =  new Handler()
    {
    	@Override 
    	public void handleMessage(Message msg)
    	{
			switch(msg.what)
			{
			case UPDATE_READ_DATA:
			{
				Double diffime = (double)(cal_time_2-start_time)/1000;
				TimeText.setText("Get "+totalDataCount + " bytes in " + diffime.toString() + " sec");
			}
				break;
			case UPDATE_READ_DATA_DONE:
			{
				Double diffime = (double)(end_time-start_time)/1000;
				TimeText.setText("Get "+totalDataCount + " bytes in " + diffime.toString() + " sec");
			}
				break;				
			case UPDATE_SEND_DATA:
			{
	    		Double diffime = (double)(cal_time_2-start_time)/1000;
				TimeText.setText("Send "+totalDataCount + " bytes in " + diffime.toString() + " sec");
			}
				break;
				
			case UPDATE_SEND_DATA_DONE:
			{
	    		Toast.makeText(global_context, "Send File - Done", Toast.LENGTH_SHORT).show();
	    		Double diffime = (double)(end_time-start_time)/1000;
	    		TimeText.setText("Send "+totalDataCount + " bytes in " + diffime.toString() + " sec");
			}
				break;
			default:
				break;
			}
    	}
    };		
	
	/*usb input data handler*/
//	private class save_data_thread extends Thread
//	{
//		Handler mHandler;
//
//		save_data_thread(Handler h) {
//			mHandler = h;
//		}
//
//		@Override
//		public void run()
//		{
//			Message msg;
//			start_time = System.currentTimeMillis();
//			cal_time_1 = System.currentTimeMillis();
//			totalDataCount = 0;
//
//			while (true == WriteFileThread_start)
//			{
//				try {
//					Thread.sleep(100);
//				} catch (InterruptedException e) {
//				}
//
//				int actual = uartInterface.ReadData(4096, readBuffer);
//
////				Log.e(">>@@", "actualNumBytes:" + actualNumBytes[0]);
//
//				if (actual > 0)
//				{
//					totalDataCount += actual;
//					try {
//						buf_save.write(readBuffer, 0, actualNumBytes[0]);
//					} catch (IOException e) {
//						e.printStackTrace();
//					}
//				}
//
//				cal_time_2 = System.currentTimeMillis();
//				if((cal_time_2 - cal_time_1) > 200)
//				{
//					msg = mHandler.obtainMessage(UPDATE_READ_DATA);
//					mHandler.sendMessage(msg);
//					cal_time_1 = cal_time_2;
//				}
//			}
//
//			end_time = System.currentTimeMillis();
//			msg = mHandler.obtainMessage(UPDATE_READ_DATA_DONE);
//			mHandler.sendMessage(msg);
//		}
//	}
		
	// send file thread	
//	private class send_file_thread extends Thread
//	{
//		Handler mHandler;
//		FileInputStream instream;
//
//		send_file_thread(Handler h, FileInputStream stream)
//		{
//			mHandler = h;
//			instream = stream;
//			this.setPriority(Thread.MAX_PRIORITY);
//		}
//
//		@Override
//		public void run()
//		{
//
//			byte [] usbdata = new byte[64];
//			int readcount = 0;
//			totalDataCount = 0;
//
//			Message msg;
//			start_time = System.currentTimeMillis();
//			cal_time_1 = System.currentTimeMillis();
//			try{
//				if(instream != null)
//				{
//					readcount = instream.read(usbdata,0,64);
//					while(readcount > 0)
//					{
//						totalDataCount += readcount;
//						uartInterface.SendData(readcount, usbdata);
//						readcount = instream.read(usbdata,0,64);
//
//						cal_time_2 = System.currentTimeMillis();
//						if((cal_time_2 - cal_time_1) > 200)
//						{
//							msg = mHandler.obtainMessage(UPDATE_SEND_DATA);
//							mHandler.sendMessage(msg);
//							cal_time_1 = cal_time_2;
//						}
//					}
//				}
//			}catch (IOException e){}
//			end_time = System.currentTimeMillis();
//			msg = mHandler.obtainMessage(UPDATE_SEND_DATA_DONE);
//			mHandler.sendMessage(msg);
//		}
//	}

//    class ClientThread implements Runnable {
//        @Override public void run() {
//            try {
//                InetAddress serverAddr = InetAddress.getByName(SERVER_IP);
//                socket = new Socket(serverAddr, SERVERPORT);
//            } catch (Exception ex) {
//                ex.printStackTrace();
//                Toast.makeText(global_context, "Failed to reach server.", Toast.LENGTH_LONG).show();
//            }
//            char[] buffer = new char[10];
//            try {
//                BufferedReader rdr = new BufferedReader(new InputStreamReader(socket.getInputStream()));
//                while (true) {
//                    rdr.read(buffer, 0, 1);
//
////                    uartInterface.SendData(1, buffer);
//                    Toast.makeText(global_context, "char", Toast.LENGTH_SHORT).show();
//                }
//            } catch (Exception ex) {
//                ex.printStackTrace();
//                Toast.makeText(global_context, "Data loop failed.", Toast.LENGTH_LONG).show();
//            }
//        }
//    }
//
//    class ServerThread implements Runnable {
//        private ServerSocket listen = null;
//        @Override public void run() {
//            try {
//                listen = new ServerSocket(SERVERPORT);
//                while (!Thread.currentThread().isInterrupted()) {
//                    ServerCommThread commThread = new ServerCommThread();
//                    commThread.sock = listen.accept();
//                    new Thread(commThread).start();
//                }
//            } catch (Exception ex) {
//                ex.printStackTrace();
//                Toast.makeText(global_context, "Failed to reach server.", Toast.LENGTH_LONG).show();
//            }
//
//        }
//    }
//
//    class ServerCommThread implements Runnable {
//        public Socket sock = null;
//        @Override public void run() {
//            try {
//                while (sock == null) {}
//                BufferedWriter wtr = new BufferedWriter(new OutputStreamWriter(sock.getOutputStream()));
//                while (true) {
//                    Thread.sleep(1000);
//                    wtr.write("G");
//                }
//            } catch (Exception ex) {
//                ex.printStackTrace();
//                Toast.makeText(global_context, "Failed to reach server.", Toast.LENGTH_LONG).show();
//            }
//
//        }
//    }

}
