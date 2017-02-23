#!/bin/bash
ENV_FILE=/etc/profile.d/env_bioextratus

source assets/is_root
isRoot 1

shopt -s globstar
read -p "nome do usuario do sistema: " USER_SYSTEM;
read -p "nome do usuario (MySQL): " USER_MYSQL;
read -p "nome do banco de dados (MySQL): " DATABASE_NAME;
read -sp "senha do banco de dados mysql: " PASS_MYSQL;

touch ${ENV_FILE}
echo "
USER_SYSTEM = '${USER_SYSTEM}'
MYSQL_USER = '${USER_MYSQL}'
MYSQL_DATABASE_NAME = '${DATABASE_NAME}'
MYSQL_PASSWORD = '${PASS_MYSQL}'
" > ${ENV_FILE}
