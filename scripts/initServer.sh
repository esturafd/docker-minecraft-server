#/bin/bash

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

cd $MINECRAFT_HOME
java -Xmx1024M -Xms1024M -jar ${MINECRAFT_HOME}/server.jar nogui
