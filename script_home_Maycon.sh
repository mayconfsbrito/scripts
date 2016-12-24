cd /home/maycon/ 
rm -rf Downloads Games Musics Softwares Videos Documents Pictures Imagens Musicas web Music
ln -s /media/Data/Downloads Downloads
ln -s /media/Data/Games Games
ln -s /media/Data/Musicas Music
ln -s /media/Data/Softwares Softwares
ln -s /media/Data/Videos Videos
ln -s /media/Data/Google\ Drive/Documents Documents
ln -s /media/Data/Google\ Drive/Documents/Desenvolvimento/web web
ln -s /media/Data/Google\ Drive/Documents/Desenvolvimento/docker ~/docker
ln -s /media/Data/Google\ Drive/Imagens Pictures

echo "Concluído com sucesso!"
