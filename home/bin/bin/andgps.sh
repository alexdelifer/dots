echo "make sure blue nmea is on and usb tethering enabled"
sudo adb forward tcp:4352 tcp:4352
gpsd -N -n -D5 tcp://localhost:4352
echo "gpsd android running"
