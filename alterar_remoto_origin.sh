#!/bin/bash

################################################################################
# Este script remove e determina novos repositórios origin para todos os 
# projetos especificados em PROJETOS. Adaptando assim os repositório de acordo
# com o deploy do servidor 20 para o 2 e 225
#
# Author: Maycon Brito
################################################################################

PROJETOS=('bioextratus' 'bioepesquisa' 'ci' 'fontes-protheus' 'fwsibe' 'integracaosibe' 'movel' 'portalcandidato' 'portalsibe' 'sibe' 'sibemovel' 'stored-procedures')
DIRETORIO='/repositorios/git/'

echo ""
echo -e "\e[1mIniciando execução do script...\e[0m"
echo ""

for i in ${PROJETOS[@]}; do

	echo -e "\e[1m${i}\e[0m"
	echo "cd ${DIRETORIO}${i}.git"
	cd /
	cd ${DIRETORIO}${i}.git

	echo "git remote rm origin"
	git remote rm origin

	echo "git remote rm origin2"
	git remote rm origin1

	echo "git remote rm origin225"
	git remote rm origin2

	echo "git remote rm local"
	git remote rm local

	echo "git remote add origin225 ssh://git@192.168.101.225/repositorios/git/${i}.git"
	git remote add origin225 ssh://git@192.168.101.225/repositorios/git/${i}.git

	echo "git remote add origin2 ssh://git@192.168.101.2/repositorios/git/${i}.git"
	git remote add origin2 ssh://git@192.168.101.2/repositorios/git/${i}.git

	echo "git remote -v"
	git remote -v

	echo ""

done;
echo -e "\e[1mExecução do script concluída com sucesso!\e[0m"
echo ""


