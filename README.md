# docker-minecraft-server

Este proyecto es una imagen docker para un servidor de minecraft.

## Compilar

```
git clone https://github.com/streameast/docker-minecraft-server.git
cd docker-minecraft-server
docker build -t streameast/minecraft-server .
```

## Uso

```
docker run -d -p 25565:25565 streameast/minecraft-server
```

### Persistencia de configuración

```
docker run -d -p 25565:25565 -v somedir:/opt/minecraft-server/data streameast/minecraft-server
```

### configuraciones personalizadas

Se habilito todas las configuraciones propias del servidor de minecraft existentes
en el archivo server.properties, aquí se lista algunas, más información en la
documentación oficial de minecraft.

```
docker run -d -p 25565:25565 -e LEVEL_NAME=miservidor streameast/minecraft-server
```

#### LEVEL_NAME

Nombre del servidor.

#### MOTD

Descripción del servidor.

#### GAMEMODE

Tipo de juego.

#### SERVER_PORT

Puerto del servidor.

## FAQ

### ¿Por que no encuentro la imagen en docker-hub?
Esto es por la licencia de no redistribución de minecraft, al compilar se descarga
el software de Mojang y al no poder redistribuirse no lo puedo subir.

### Los archivos de configuración normalmente están en la misma carpeta que jar del servidor, ¿La persistencia también incluye el jar?
No, la persistencia en volume, solo incluye los archivos ops.json, banned-\*.json, whitelist.json y server.properties.

### ¿Donde puedo encontrar mas información sobre las configuración personalizada?
Las variables son las mismas que el archivo server.properties pero en mayusculas y cambiando el guion medio (-) por guion bajo (\_), y se puede encontrar mas información en la [paguina oficial](https://minecraft-es.gamepedia.com/Server.properties).
