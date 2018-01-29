#!/bin/bash
while IFS='' read -r -d '' filename; do
  cd $filename
  dir=$(printf '%s\n' "${PWD##*/}")
  echo '-----Repositorio: '$dir'-----'

  echo 'Antes:'
  git remote -v
  git remote rm origin
  git remote add origin ssh://git@192.168.100.170/repositorios/git/$dir

  echo 'Depois:'
  git remote -v

  echo $'\n'

done < <(find /repositorios/git/ -name '*.git' -type d -print0)
