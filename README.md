# docker-minecraft-server

Other languages available: [spanish](https://github.com/streameast/docker-minecraft-server/blob/master/README-es.md)

This project is a docker image for a minecraft server.

## Build

```bash
git clone https://github.com/streameast/docker-minecraft-server.git
cd docker-minecraft-server
docker build -t streameast/minecraft-server .
```

## Use

```bash
docker run -d -p 25565:25565 streameast/minecraft-server
```

### Pesistance of configuration

```bash
docker run -d -p 25565:25565 \
      -v somedir:/opt/minecraft-server/data \
      -v otherdir:/opt/minecraft-server/logs \
      streameast/minecraft-server
```

### Custom configuration

All minecraft server configurations existing in the server.properties file are
enabled, some of them are listed here, more information in the official minecraft documentation.

```bash
docker run -d -p 25565:25565 -e LEVEL_NAME=miservidor streameast/minecraft-server
```

#### LEVEL_NAME

Server name.

#### MOTD

Server description.

#### GAMEMODE

Game mode.

#### SERVER_PORT

Server port.

In addition to these variables, there are also two others that control the memory
allocation that the server will have, by default both have a value of 1024M, recommended by Mojang.

```bash
docker run -d -p 25565:25565 -e MINECRAFT_XMX=2048M -e MINECRAFT_XMS=2048M streameast/minecraft-server
```

#### MINECRAFT_XMX

Maximum memory size.

#### MINECRAFT_XMS

Initial memory size.

## FAQ

### Why can not I find the image in docker-hub?
This is because of the non-redistribution license of minecraft, when compiling
the Mojang software is downloaded and as it can not be redistributed I can not upload it.

### The configuration files are usually in the same folder as the server jar, does persistence also include jar?
No, the persistence in volume, only includes the files ops.json, banned-\*.json,
whitelist.json, server.properties and the map folder.

### Where can I find more information about custom settings?
The variables are the same as the server.properties file but in uppercase and
changing the middle dash (-) by underscore (\_), and you can find more information
on this [page](https://minecraft-es.gamepedia.com/Server.properties).
