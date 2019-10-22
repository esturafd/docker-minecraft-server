#/bin/bash

cd ${MINECRAFT_HOME}/
SOURCE=https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar
if [ -n "${MINECRAFT_SOURCE}" ]; then
    SOURCE=$MINECRAFT_SOURCE
fi
wget -O server.jar $SOURCE

cd ${MINECRAFT_HOME}/data
PROPERTIES=$(cat server.properties | grep -v '^#')
for i in $(echo -e "$PROPERTIES"); do
   PROPERTY=$(echo -e "$i" | \
      cut -d '=' -f 1 | \
      sed s/-/_/g | \
      awk '{print toupper($0)}')
   if [ -n "${!PROPERTY}" ]; then
      NAME=$(echo -e $i | cut -d '=' -f 1)
      PROPERTIES=$(echo -e "$PROPERTIES" | grep -v "$i" && echo ${NAME}=${!PROPERTY})
      echo ${NAME}=${!PROPERTY}
   fi
done
echo -e "$PROPERTIES" > server.properties

MAP=$(cat server.properties | grep level-name | cut -d '=' -f 2)
mkdir $MAP

cd $MINECRAFT_HOME
ln -s $MINECRAFT_HOME/data/$MAP

if [ -n "MINECRAFT_XMX" ]; then
   MINECRAFT_XMX="-Xmx${MINECRAFT_XMX}"
fi
if [ -n "MINECRAFT_XMS" ]; then
   MINECRAFT_XMS="-Xms${MINECRAFT_XMS}"
fi

java $MINECRAFT_XMX $MINECRAFT_XMS -jar ${MINECRAFT_HOME}/server.jar nogui
