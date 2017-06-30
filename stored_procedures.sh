#!/bin/bash
shopt -s globstar
read -p "usuario (MYSQL): " USER_HOM_BD;
read -sp "password: " PASS_HOM_BD;
echo ""
read -p "ip do servidor mysql: " SERVER_IP;
DATABASE=bioextratus
LOCAL_PASS='/root/mysql'

echo '...'

DIR_SP=/var/www/stored-procedures

echo "Iniciando a execução das stored-procedures no diretório /var/www/stored-procedures"
for file in ${DIR_SP}/**/*.sql
do
    echo $file
    mysql --user=$USER_HOM_BD -h $SERVER_IP --port=3306 --password=$PASS_HOM_BD ${DATABASE} < $file --force
    echo '...'
done
echo "Execução do script finalizada"
echo '...'
