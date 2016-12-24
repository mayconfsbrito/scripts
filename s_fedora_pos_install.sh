#!/bin/bash

# Chrome
eval "cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF"
eval "dnf install google-chrome-stable -y"

#transmission, gparted, nano
eval "dnf install transmission transmission-daemon nano gparted terminator steam -y"
eval "systemctl enable transmission-daemon.service"

#codecs e vlc
eval "su -c 'dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'"
eval "dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg -y"
eval "dnf install gstreamer{1,}-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} --setopt=strict=0 -y"
eval "dnf install vlc -y"

#fstab
eval "mkdir /media/Data /media/Games"
eval "echo 'UUID=C0B08DC4B08DC200 /media/Data    ntfs    defaults,nofail 0 0' >> /etc/fstab"
eval "echo 'UUID=515BFFEB722C1BEC /media/Games    ntfs    defaults,nofail 0 0' >> /etc/fstab"
eval "mount -a"

#sublime
eval "wget https://download.sublimetext.com/sublime_text_3_build_3126_x64.tar.bz2"
eval "tar -xjvf sublime_text_3_build_3126_x64.tar.bz2"
eval "ln -sf /home/maycon/sublime_text_3/sublime_text /usr/local/bin/subl"
eval "touch ~/.local/share/applications/sublime-text.desktop"
eval "echo '[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=Sublime Text
Comment=Sublime Text
Exec=subl &
Icon=/media/Data/Softwares/Linux/sublime_text_3/Icon/128x128/sublime-text.png
Terminal=false' >>  ~/.local/share/applications/sublime-text.desktop"
eval "cd /home/maycon/sublime_text_3/Packages/"
eval "git clone https://github.com/mayconfsbrito/my-sublime-text-settings.git"
eval "cd /media/Data/Softwares/Desenvolvimento/"
eval "rm -rf my-sublime-text-settings/"
eval "git clone https://github.com/mayconfsbrito/my-sublime-text-settings.git"
eval "rm -rf /home/maycon/.config/sublime-text-3/Packages/User/"
eval "ln -sf /media/Data/Softwares/Desenvolvimento/my-sublime-text-settings/Packages/User/ /home/maycon/.config/sublime-text-3/Packages/"


#home
eval "bash /media/Data/Softwares/Scripts/script_home_Maycon.sh"

#playonlinux
eval "dnf install playonlinux -y"

#docker
eval "tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/fedora/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF"
eval "dnf install docker-engine -y"
eval "systemctl enable docker.service"
eval "systemctl start docker"
eval "docker run --rm hello-world"
eval "groupadd docker"
eval "usermod -aG docker maycon"
eval "docker run hello-world"
eval "cd /media/Data/Softwares/Linux/"
eval "curl -L 'https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)' -o /usr/local/bin/docker-compose"
eval "chmod +x /usr/local/bin/docker-compose"
eval "docker-compose --version"