#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GECKO_DRIVER_VERSION="0.19.1"
CHROME_DRIVER_VERSION="2.33"

source "$DIR/assets/is_root"

FILE="/usr/local/bin/selenium-server-standalone.jar"
if [ ! -f ${FILE} ]; then
	isRoot 1
    cd /usr/local/bin/
    wget https://goo.gl/3aWDMc -O selenium-server-standalone.jar
    chmod 777 ${FILE}
fi

# https://github.com/mozilla/geckodriver/releases
FILE_GECKO="/usr/local/lib/geckodriver"
if [ ! -f ${FILE_GECKO} ]; then
	isRoot 1
	cd /usr/local/lib/
	wget  https://github.com/mozilla/geckodriver/releases/download/${GECKO_DRIVER_VERSION}/geckodriver-${GECKO_DRIVER_VERSION}-linux64.tar.gz -O geckodriver.tar.gz
	tar -zxvf geckodriver.tar.gz
	chmod 777 ${FILE_GECKO}
	rm -rf geckodriver.tar.gz
fi

# https://sites.google.com/a/chromium.org/chromedriver/downloads
FILE_CHROME="/usr/local/lib/chromedriver"
if [ ! -f ${FILE_CHROME} ]; then
	isRoot 1
	cd /usr/local/lib/
	wget https://chromedriver.storage.googleapis.com/${CHROME_DRIVER_VERSION}/chromedriver_linux64.zip -O chromedriver.zip
	unzip chromedriver.zip -d /usr/local/lib
	chmod 777 ${FILE_CHROME}
	rm -rf chromedriver.zip
fi

echo "java -Dwebdriver.gecko.driver=${FILE_GECKO} -Dwebdriver.chrome.driver=${FILE_CHROME} ${FILE}"
java -jar -Dwebdriver.gecko.driver=${FILE_GECKO} -Dwebdriver.chrome.driver=${FILE_CHROME} ${FILE}

