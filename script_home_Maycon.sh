cd /home/maycon/ 
rm -rf Downloads Games Musics Softwares Videos Documents Pictures Imagens Musicas web Music
ln -s /media/Data/Downloads Downloads
ln -s /media/Games Games
ln -s /media/Data/Musicas Music
ln -s /media/Data/Softwares Softwares
ln -s /media/Data/Softwares/Desenvolvimento/composer ~/composer
ln -sfn /media/Data/Cloud/Documents/Desenvolvimento/web /var/www
ln -s /media/Data/Videos Videos
ln -s /media/Data/Cloud/Documents Documents
ln -s /media/Data/Cloud/Documents/Desenvolvimento/web web
ln -s /media/Data/Cloud/Documents/Desenvolvimento/docker ~/docker
ln -s /media/Data/Cloud/Imagens Pictures

echo "Concluído com sucesso!"
