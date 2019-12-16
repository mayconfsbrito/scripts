#!/bin/bash

################################################################################
# Script de automatização de build de imagens do docker e push para o registry #
# interno                                                                      #
#                                                                              #
# Encontra todos os arquivos Dockerfile dentro do diretório ./build            #
# Cada imagem dentro do diretório build deve conter um diretório e outro sub-  #
# diretório. Exemplos:                                                         #
# ./build/NOME_DA_IMAGEM/TAG                                                   #
# ./build/mysql/5.6                                                            #
#                                                                              #
# Dessa forma o diretório terá o nome da imagem e o subdiretório o nome da tag #
# Exemplos:                                                                    #
# ./build/mysql/5.6 ----> SERVIDOR/mysql:5.6                                   #
# ./build/php/fpm-prod-5.6 ----> SERVIDOR/php:fpm-prod-5.6                     #
#                                                                              #
# SERVIDOR é a url para o servidor com o registry interno com as imagens docker#
#                                                                              #
# author: Maycon Brito                                                         #
#                                                                              #
################################################################################

SERVIDOR=""
BUILD_DIR="build"

containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" = *"$match"* ]] && return 1; done
  return 0
}

# Cria diretório de Logs
mkdir -p cd/log

# Verifica no GIT os arquivos modificados no último commit
mapfile -t ARQUIVOS_MODIFICADOS < <(git diff --name-only HEAD HEAD~2)

printf "Verificando builds...\n\n"

find ./build -name 'Dockerfile' | while read dockerfile; do

    # Divide a string com a imagem e a tag em duas variáveis
    # O primeiro diretório é o nome da imagem
    # O segundo diretório é a tag
    arrayPath=(${dockerfile//// })
    IMAGE_NAME=${arrayPath[2]}
    TAG=${arrayPath[3]}
    IMAGE=${SERVIDOR}/${IMAGE_NAME}:${TAG}
    DIR=${BUILD_DIR}/${IMAGE_NAME}/${TAG}/
    ARQUIVO_LOG=cd/log/${IMAGE_NAME}_${TAG}.log

    # Verifica se a imagem deste dockerfile foi modificada neste commit
    containsElement $DIR ${ARQUIVOS_MODIFICADOS[@]}
    IS_IMAGEM_MODIFICADAO=$?

    if [ ${IS_IMAGEM_MODIFICADAO} -eq 1 ]; then
        printf "Realizando build para... ${IMAGE}\n\n"

        # Build da imagem
        printf "docker build -t ${IMAGE} ${DIR}\n"
        docker build -t ${IMAGE} ${DIR}
        printf "\n"

        #Push da imagem
        printf "docker push ${IMAGE} \n"
        docker push ${IMAGE}
        printf "\n${IMAGE}... OK\n\n"
    fi

done

