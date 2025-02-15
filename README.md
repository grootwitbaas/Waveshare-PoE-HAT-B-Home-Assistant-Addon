# Waveshare PoE-HAT (B) Home-Assistant Addon (forked from original)

Specifically for this PoE-HAT: https://www.waveshare.com/wiki/PoE_HAT_(B)

Home Assistant (HASS) Addon to fully support Waveshare PoE HAT B including fan control and display

This is a fork of reschix's original, with Dockerfile changes to fix errors after July 2023.

For anyone landing here, on my system i saw i have 
/dev/i2c-0
/dev/i2c-1
/dev/i2c-10
/dev/i2c-22
but in the original code it has /dev/i2c-11. 
I am no coder and does not know how to make this changable, so i forked to make the change and for me it works
Credit goes to original code, i just used a hammer to make the triangle fit in the round hole

this did not work because hassos-overlay changes not included, see below for full instructions ->  Important: Enable I2C first to make this work! As described here: https://www.home-assistant.io/common-tasks/os/#enable-i2c



below some instructions i found, will addapt here because i use a mac, commands are a bit different, but will do this when i have time.

start of copy/paste source: https://community.home-assistant.io/t/add-on-hassos-i2c-configurator/264167/82 
I am posting these directions as this is what worked for me and I’m guessing issues may be similar for others. They are yours to use at your own risk if you so choose.

remove your sd (or SSD in my case) from the pi and plug it into a system running a Linux OS (raspberian in my case)

most likley linux will not mount the partition “hassos-boot” because it is FAT
a) open a terminal window
b) type > blkid
c) in the resulting output, you will see "LABEL=“hassos-boot”
note the location (mine was /dev/sda1)
d) type > sudo mkdir /mnt/msdos
e) type > sudo mount -t vfat /dev/sda1 /mnt/msdos
f) now on your desktop, you can use the file explorer to navigate to the directory /mnt/msdos where you should see the file config.txt
g) open that file and uncomment the following lines.
dtparam=i2c_vc=on
dtparam=i2c_arm=on
in my config file there were actually 3 items under the i2c section - i uncommented all 3
save the config.txt file

NOW, this is where the problems started. the file is read only and unable to save:(
probably did something that I shouldn’t have, BUT

go back to the terminal window
cd /mnt/msdos
sudo chmod 777 confg.txt
go back to your txt editor with the config.txt file and hit save. It should now save the changes you made.
go back to terminal
sudo chmod 755 config.txt (i hope this is the default permission for this file)
ALMOST DONE

go back to your desktop and look to see if your system mounted the other drives/partitions from attached your HA sd/ssd drive. You should see a partition named hassos-overlay (if not go back and complete steps 2a-f for this partition)
a) open the file > hassos-overlay/etc/modules-load.d/rpi-i2c.conf
b) make sure it has the line i2c-dev in it. Save the file.
This was problem #2. For some reason, my file was named rpi-i2c.conf.txt (probably related to something i did while trying multiple times to get i2c to work)

and again the file will probably be write restricted. If so go back to terminal.

cd to the directory where that file is located (you should be able to get the full path from your desktop
ie (mine was similar to this)
cd /ha/hassos-overlay/etc/modules-load.d/
then
sudo chmod 777 rpi-i2c.conf.txt (or whatever your file name is)
go back to your txt editor with the rpi-i2c.conf file make the changes you need and hit save/save as with the correct file name rpi-i2c.conf. It should now save the changes you made.
go back to terminal
sudo chmod 755 rpi-i2c.conf
eject the HA disk from the linux device you are using. put it back into the raspberry pi and start her up.
You may need to start up and shut down twice, BUT, you should now see the i2c device:)

I used supervisor system “shutdown host”, wait for it to power down, unplug the power cord, plug it back in and restart. (DO THIS TWICE)

I hope this is able to help.

End of copy/paste
