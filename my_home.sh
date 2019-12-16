DADOS="/media/bkp1/"

cd /home/maycon/ 
rm -rf Downloads Games Musics Softwares Videos Documents Pictures Imagens Musicas web Music
ln -s ${DADOS}Downloads Downloads
ln -s /media/GAMES Games
ln -s ${DADOS}Musicas Music
ln -s ${DADOS}Softwares Softwares
ln -s ${DADOS}Softwares/Desenvolvimento/composer ~/composer
ln -sfn ${DADOS}Cloud/Documents/Desenvolvimento/web /var/www
ln -s ${DADOS}Videos Videos
ln -s ${DADOS}Cloud/Documents Documents
ln -s ${DADOS}Cloud/Documents/Desenvolvimento/web web
ln -s ${DADOS}Cloud/Documents/Desenvolvimento/docker ~/docker
ln -s ${DADOS}Cloud/Imagens Pictures

echo "Concluído com sucesso!"
