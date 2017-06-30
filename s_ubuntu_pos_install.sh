#!/bin/bash

#fstab
cp /etc/fstab /etc/fstab_bkp
mkdir /media/Data /media/Games
blkid
echo 'UUID=515BFFEB722C1BEC /media/Games    ntfs    defaults,uid=1000,gid=1000,nofail 0 0' >> /etc/fstab
mount -a
echo 'UUID=55ab46a7-6c69-4507-8fcf-10ee21c12321    /media/Data    ext4    defaults,errors=remount-ro    0 0' >> /etc/fstab
mount -a

# Diretorio Home
bash /media/Data/Softwares/scripts/script_home_Maycon.sh

# Repositórios Chrome, Sublime
rm /etc/apt/sources.list.d/google.list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
rm /etc/apt/sources.list.d/sublime-text.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-get update 

# Instalação Softwares utilitários
apt-get install \
	git-core \
	nano \
	gparted \
	terminator \
	npm \
	nodejs \
	playonlinux \
	vlc \
	ubuntu-restricted-extras \
	google-chrome-stable \
	sublime-text \
	-y

# Configurando sublime
cd /media/Data/Softwares/Desenvolvimento/
rm -rf my-sublime-text-settings/
git clone https://github.com/mayconfsbrito/my-sublime-text-settings.git
rm -rf /home/maycon/.config/sublime-text-3/Packages/
ln -sf /media/Data/Softwares/Desenvolvimento/my-sublime-text-settings/Packages /home/maycon/.config/sublime-text-3/Packages

# Docker
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce -y
docker run hello-world

# docker-compose
curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

# autostart
echo "[Desktop Entry]
Type=Application
Exec=transmission-gtk
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=transmission
Name=transmission
Comment[en_US]=
Comment=" >> /home/maycon/.config/autostart/transmission-gtk.desktop 

