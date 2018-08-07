#!/bin/bash

################################################################################
# Este script reescreve o arquivo hooks de todos os projetos em PROJETOS de 
# acordo com o deply da última migração de repositórios para o servidor 20.
#
# Author: Maycon Brito
################################################################################

PROJETOS=('bioextratus' 'ci' 'fwsibe' 'integracaosibe' 'portalcandidato' 'portalsibe' 'sibe' 'sibemovel' 'stored-procedures')
DIRETORIO='/repositorios/git/'

echo ""
echo -e "\e[1mIniciando execução do script...\e[0m"
echo ""

for i in ${PROJETOS[@]}; do

	echo -e "\e[1m${i}\e[0m"
	echo "rm ${DIRETORIO}${i}.git/hooks/post-receive"
	rm ${DIRETORIO}${i}.git/hooks/post-receive

	echo "Editando ${DIRETORIO}${i}.git/hooks/post-receive"
	echo '#!/bin/bash' >> ${DIRETORIO}${i}.git/hooks/post-receive
	echo 'echo "Atualizando pasta do projeto '${i}' em servidor ..."' >> ${DIRETORIO}${i}.git/hooks/post-receive
	echo 'GIT_WORK_TREE=/var/www/'${i}' git checkout -f;' >> ${DIRETORIO}${i}.git/hooks/post-receive
	echo 'echo "Projeto '${i}' atualizado com sucesso em servidor."' >> ${DIRETORIO}${i}.git/hooks/post-receive
	echo '' >> ${DIRETORIO}${i}.git/hooks/post-receive

	echo "Concedendo permissões:"
	chown git.git -R ${DIRETORIO}${i}.git/hooks
	chmod -R 777 ${DIRETORIO}${i}.git/hooks

	echo "Arquivo hooks/post-receive final:"
	echo "cat ${DIRETORIO}${i}.git/hooks/post-receive"
	echo ""
	cat ${DIRETORIO}${i}.git/hooks/post-receive
	echo ""

	echo ""

done;