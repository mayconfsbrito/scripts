#!/bin/bash

# Update
dnf update

# fstab
cp /etc/fstab /etc/fstab_bkp_orig
cp assets-pos-install/fstab /etc/fstab
mount -a

#home
eval "bash /media/Data/Softwares/scripts/script_home_Maycon.sh"

# Chrome
wget http://repo.fdzh.org/chrome/google-chrome-mirrors.repo -P /etc/yum.repos.d/ 
dnf install google-chrome-stable -y

#transmission, gparted, nano
eval "dnf install \
	transmission \
	git-core \
	gitk \
	nano \
	gparted \
	terminator \
	gnome-tweak-tool \
	npm \
	nodejs \
	vlc \
	-y"
eval "systemctl enable transmission-daemon.service"

#terminator
mkdir -p /home/maycon/.config/terminator
cp  assets-pos-install/terminator_config /home/maycon/.config/terminator/config

#transmission
cp assets-pos-install/trasmission-settings.json /home/maycon/.config/transmission/settings.json

#codecs e vlc
dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-25
dnf install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-25
dnf remove gstreamer1-plugin-mpg123 -y
sudo dnf install amrnb amrwb faad2 flac ffmpeg gpac-libs lame libfc14audiodecoder mencoder mplayer x264 x265 gstreamer-plugins-espeak gstreamer-plugins-fc gstreamer-rtsp gstreamer-plugins-good gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-plugins-base gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good -y

#sublime
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
dnf install sublime-text -y
cd /media/Data/Softwares/Desenvolvimento/
rm -rf my-sublime-text-settings/
git clone https://github.com/mayconfsbrito/my-sublime-text-settings.git
rm -rf /home/maycon/.config/sublime-text-3/Packages
ln -sf /media/Data/Softwares/Desenvolvimento/my-sublime-text-settings/Packages /home/maycon/.config/sublime-text-3/Packages
chmod -R 777 /home/maycon/.config/sublime-text-3/Packages

#playonlinux
eval "dnf install playonlinux -y"

#docker
dnf remove docker \
                  docker-common \
                  container-selinux \
                  docker-selinux \
                  docker-engine -y
dnf -y install dnf-plugins-core
dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
dnf makecache fast
dnf install docker-ce -y
systemctl start docker
systemctl enable docker
docker run hello-world

