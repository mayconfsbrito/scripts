#!/bin/bash

if [ $# -lt 1 ]
then
	echo "Defina parâmetro 1 - nome do branch para o qual os projetos serão modificados"
	echo "Execução interrompida"
	exit 1
fi

projetos=("ci" "fwsibe" "portalsibe" "sibe" "sibemovel" "bioextratus" "middlewares" "stored-procedures" "sws")
branch=$1

echo ""
echo "Log de checkout:"
for i in ${projetos[@]}; do
	echo "Modificando $i para branch $1..."
	cd /var/www/$i && git checkout $1 -f
	echo ""
done;
echo "Script Executado com sucesso!"
echo ""
