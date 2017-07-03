#!/bin/bash


cd /media/Data/Softwares/Desenvolvimento/
rm -rf my-sublime-text-settings/
git clone https://github.com/mayconfsbrito/my-sublime-text-settings.git
rm -rf /home/maycon/.config/sublime-text-3/Packages
ln -sf /media/Data/Softwares/Desenvolvimento/my-sublime-text-settings/Packages /home/maycon/.config/sublime-text-3/Packages
chmod -R 777 /home/maycon/.config/sublime-text-3/Packages
