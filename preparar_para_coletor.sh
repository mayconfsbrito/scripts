#!/bin/bash
sudo apt-get install \
	android-tools-adb \
	android-tools-fastboot -y

wget -O - https://skia.googlesource.com/skia/+archive/cd048d18e0b81338c1a04b9749a00444597df394/platform_tools/android/bin/linux.tar.gz \
	| tar -zxvf - adb

sudo mv adb /usr/bin/adb

sudo chmod +x /usr/bin/adb

adb version

sudo cp ./assets/android/51-android.rules /etc/udev/rules.d/51-android.rules
sudo chmod a+r /etc/udev/rules.d/51-android.rules

sudo service udev restart

sudo apt-get install mtp-tools  \
	libusb-1.0-0 \
	libusb-1.0-0-dev

cd ~/Downloads/
wget https://ufpr.dl.sourceforge.net/project/libmtp/libmtp/1.1.12/libmtp-1.1.12.tar.gz
tar xvf libmtp-1.1.12.tar.gz
cd libmtp-1.1.12/
./configure --prefix=/usr \
	&& make \
	&& sudo make install \
	&& sudo cp 69-libmtp.rules /etc/udev/rules.d