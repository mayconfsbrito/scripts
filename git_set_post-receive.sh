#!/bin/bash

################################################################################
# Percorre todos os repositórios GIT dentro de um diretório e define um novo
# pos-receive padrão para todos. Não altera ou remove os post-receives já
# existentes.
#
# Author: Maycon Brito
################################################################################

DIR_REPOSITORIOS='/repositorios/git/'

while IFS='' read -r -d '' filename; do
  cd $filename
  dir=$(printf '%s\n' "${PWD##*/}")
  echo '-----Repositorio: '$dir'-----'

  POST_RECEIVE=$DIR_REPOSITORIOS$dir/hooks/post-receive
  if ! [[ -f $POST_RECEIVE ]]; then
    echo 'Criando post-receive em '$POST_RECEIVE
    echo 'git push origin master;' >> $POST_RECEIVE
  else
    echo 'Ja existe para este repositorio'
  fi

  echo $'\n'

done < <(find $DIR_REPOSITORIOS -name '*.git' -type d -print0)
