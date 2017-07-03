#!/bin/bash

# Update
dnf update

# fstab
cp /etc/fstab /etc/fstab_bkp_orig
cp fstab /etc/fstab
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
	-y"
eval "systemctl enable transmission-daemon.service"

#codecs e vlc
eval "su -c 'dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm' -y"
eval "dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg -y"
eval "dnf install gstreamer{1,}-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} --setopt=strict=0 -y"
eval "dnf install vlc -y"

#fstab
eval "mkdir /media/Data /media/Games"
eval "echo 'UUID=515BFFEB722C1BEC /media/Games    ntfs    defaults,uid=1000,gid=1000,nofail 0 0' >> /etc/fstab"
eval "mount -a"

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

