#!/bin/bash
cd `dirname $0`
TARGET_FILE="AltServer"
URL=`curl -s https://github.com/NyaMisty/AltServer-Linux/releases | grep href | grep "releases\/download\/" | grep ${TARGET_FILE} | head -n 1 | cut -d '"' -f 2 | sed -e "s/^/https\:\/\/github\.com/g"`
TARGET_URL=`curl -I -Ls -o /dev/null -w %{url_effective} ${URL}`
curl ${TARGET_URL} -o ${TARGET_FILE} || exit 1
cp -vf AltServer /usr/local/bin/
chmod +x /usr/local/bin/AltServer


