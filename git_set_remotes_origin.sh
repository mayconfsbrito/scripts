#!/bin/bash

################################################################################
# Percorre todos os repositórios GIT dentro de um diretório e remove todos os
# seus remotos, substiuindo-os por um novo.
#
# Author: Maycon Brito
################################################################################

REMOTE='192.168.100.170'

while IFS='' read -r -d '' filename; do
  cd $filename
  dir=$(printf '%s\n' "${PWD##*/}")
  echo '-----Repositorio: '$dir'-----'

  echo 'Antes:'
  git remote -v
  git remote rm origin
  git remote add origin ssh://git@${REMOTE}/repositorios/git/$dir

  echo 'Depois:'
  git remote -v

  echo $'\n'

done < <(find /repositorios/git/ -name '*.git' -type d -print0)
