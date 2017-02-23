#!/bin/bash

################################################################################
# Este script redireciona o remote origin dos repositórios inseridos em PROJETOS
# para o novo servidor de repositórios inserido em REMOTE.
#
# Author: Maycon Brito
################################################################################

PROJETOS=('bioextratus' 'bioepesquisa' 'ci' 'fwsibe' 'portalcandidato' 'portalsibe' 'sibe' 'sibemovel' 'stored-procedures' 'teste' 'wiki')
REMOTE='192.168.101.2'
DIRETORIO='/var/www/'

echo ""
echo -e "\e[1mIniciando execução do script...\e[0m"
for i in ${PROJETOS[@]}; do

	echo -e "\e[1m${i}\e[0m"
	echo "cd ${DIRETORIO}${i}"
	cd /
	cd ${DIRETORIO}${i}

	echo "git remote rm origin"
	git remote rm origin

	echo "git remote add origin ssh://git@${REMOTE}/repositorios/git/${i}.git"
	git remote add origin ssh://git@${REMOTE}/repositorios/git/${i}.git

	echo "Novos remotes de ${i}:"
	git remote -v

	echo ""

done;
echo -e "\e[1mExecução do script concluída com sucesso!\e[0m"
echo ""


