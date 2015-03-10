
# exec C:/Tcl/bin/wish85.exe [lindex $argv 0]

# exec "J:/apps64/Android/sdk/platform-tools/adb.exe" install "J:/temp/junk_projects/FTDI_android_UARTTest/app/app-debug.apk"
# The -d flag specifies that you want to use the attached device (in case you also have an emulator running).

file copy -force [lindex $argv 0] "J:/BlueStacksAndroid/BlueStacks/UserData/SharedFolder/[clock seconds]-temperature.tcl"