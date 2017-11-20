#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/assets/is_root"

FILE="/usr/local/bin/selenium-server-standalone.jar"
if [ ! -f ${FILE} ]; then
	isRoot 1
    cd /usr/local/bin/
    wget https://goo.gl/3aWDMc -O selenium-server-standalone.jar
    chmod 777 ${FILE}
fi
java -jar ${FILE}

