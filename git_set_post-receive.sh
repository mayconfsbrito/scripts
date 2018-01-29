#!/bin/bash

################################################################################
# Percorre todos os reposit�rios GIT dentro de um diret�rio e define um novo
# pos-receive padr�o para todos. N�o altera ou remove os post-receives j�
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
