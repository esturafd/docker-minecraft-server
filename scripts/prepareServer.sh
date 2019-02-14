#/bin/bash

cd ${MINECRAFT_HOME}/
wget https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar
# Se acepta la licencia de minecraft
echo eula=true > eula.txt
# Se crean archivos importantes
mkdir data && cd data
cp ${MINECRAFT_HOME}/scripts/server.properties ./
echo "[]" > ops.json
echo "[]" > banned-players.json
echo "[]" > banned-ips.json
echo "[]" > whitelist.json

cd ..
mkdir logs && cd logs
echo '[]' > usercache.json

cd ..
ln -s ${MINECRAFT_HOME}/data/ops.json
ln -s ${MINECRAFT_HOME}/data/banned-players.json
ln -s ${MINECRAFT_HOME}/data/banned-ips.json
ln -s ${MINECRAFT_HOME}/data/whitelist.json
ln -s ${MINECRAFT_HOME}/data/server.properties
