#!/bin/bash

################################################################################
# Este script clona os repositórios oficiais PHP do git para a máquina local
# autor: Maycon Brito
# data: 15/01/2015
################################################################################

################################################################################
# Inicializa variáveis do script
################################################################################
PROJETOS=("ci" "bioextratus" "biopesquisa" "fwsibe" "portalsibe" "sibe" "sibemovel" "stored-procedures")
SERVIDOR="192.168.101.2"
USUARIO="git"
DIRETORIO="/var/www/"

################################################################################
# Clona os repositórios definidos na variável PROJETOS
################################################################################
echo ""
echo -e "\e[1mClonando projetos PHP do servidor: \e[0m"
echo ""
echo "cd ${DIRETORIO}"
cd ${DIRETORIO}
echo ""

for i in ${PROJETOS[@]}; do
	echo ""
	echo -e "Clonando o projeto: \e[1m${i}...\e[0m"
	echo "git clone ssh://${USUARIO}@${SERVIDOR}/repositorios/git/${i}.git "
	git clone ssh://${USUARIO}@${SERVIDOR}/repositorios/git/${i}.git 
	echo "OK"
	echo ""
done;

################################################################################
# Concede permissões ao diretório DIRETORIO
################################################################################
echo ""
echo "Concedendo permissões aos projetos:"
echo ""
sudo chmod -R 777 ${DIRETORIO}
sudo chown -R www-data.www-data ${DIRETORIO}
echo ""

################################################################################
# Finaliza o script
################################################################################
echo -e "\e[1mScript Executado com sucesso! \e[0m"
echo ""
