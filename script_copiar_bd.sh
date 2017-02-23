#!/bin/bash

#
# Realiza a cópia do banco de dados oficial (servidor 2) para o servidor de 
# homologação.
#
# Utiliza o dump realizado por rotina no diretório compartilhado 
# smb://192.168.101.2/sql, montando o no diretório /mnt/sql e executando
# o código sql de cada tabela.
#
# Author: Maycon Brito
#

################################################################################
# Variáveis do script
################################################################################
DBSERVER=//192.168.101.2/sql
DATABASE=bioextratus
USER='root'
LOCAL_PASS='/root/mysql'
DUMP_SQL=/mnt/sql

echo""

################################################################################
# Verifica se o usuário é root
################################################################################
if [ "$(id -u)" != "0" ]; then
	echo""
   	echo "Esse script deve ser executado com \"sudo\" ou como usuário \"root\"" 1>&2
   	echo""
   	exit 1
fi

################################################################################
# Verifica se o diretório DUMP_SQL existe
################################################################################
if [ ! -d ${DUMP_SQL} ]; then
	echo ""
	echo "Criando o diretório ${DUMP_SQL}"
	mkdir -v ${DUMP_SQL}
	echo "Diretório criado com sucesso"
	echo ""
fi

################################################################################
# Monta o dump do banco via samba no diretório DUMP_SQL
################################################################################
echo "Remontando ${DUMP_SQL}"
sudo umount ${DUMP_SQL} -l
mount -t cifs ${DBSERVER} ${DUMP_SQL} -o username=root
echo ""

################################################################################
# Gera as tabelas no banco de dados a partir do diretório montado
################################################################################
for file in ${DUMP_SQL}/*.sql
do
    echo "Gerando a tabela SQL: $file"
    mysql --login-path=${LOCAL_PASS} ${DATABASE} < $file --force
done

echo "Script finalizado"
echo ""