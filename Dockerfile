# --
FROM openjdk:8
ENV MINECRAFT_HOME=/opt/minecraft-server
RUN mkdir $MINECRAFT_HOME && mkdir $MINECRAFT_HOME/scripts
COPY scripts/ ${MINECRAFT_HOME}/scripts/
RUN chmod +x ${MINECRAFT_HOME}/scripts/*.sh && ${MINECRAFT_HOME}/scripts/prepareServer.sh
VOLUME ["/opt/minecraft-server/data","/opt/minecraft-server/logs"]
CMD bash ${MINECRAFT_HOME}/scripts/initServer.sh
