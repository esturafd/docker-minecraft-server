# docker-minecraft-server

Otros idiomas disponibles: [ingles](https://github.com/esturafd/docker-minecraft-server/blob/master/README.md)

Este proyecto es una imagen docker para un servidor de minecraft.

## Compilar

```bash
git clone https://github.com/esturafd/docker-minecraft-server.git
cd docker-minecraft-server
docker build -t esturafd/minecraft-server .
```

## Uso

```bash
docker run -d -p 25565:25565 esturafd/minecraft-server
```

### Persistencia de configuración

```bash
docker run -d -p 25565:25565 \
      -v somedir:/opt/minecraft-server/data \
      -v otherdir:/opt/minecraft-server/logs \
      esturafd/minecraft-server
```

### configuraciones personalizadas

Se habilito todas las configuraciones propias del servidor de minecraft existentes
en el archivo server.properties, aquí se lista algunas, más información en la
documentación oficial de minecraft.

```bash
docker run -d -p 25565:25565 -e LEVEL_NAME=miservidor esturafd/minecraft-server
```

### MINECRAFT_SOURCE

La fuente del binario del servidor, por defecto descargara la versión 1.14.

#### LEVEL_NAME

Nombre del servidor.

#### MOTD

Descripción del servidor.

#### GAMEMODE

Tipo de juego.

#### SERVER_PORT

Puerto del servidor.

Ademas de estas variables, también hay otras dos que controlan la asignacion de
memoria que tendrá el servidor, por defecto ambas tienen valor de 1024M, recomendado
por Mojang.

```bash
docker run -d -p 25565:25565 -e MINECRAFT_XMX=2048M -e MINECRAFT_XMS=2048M esturafd/minecraft-server
```

#### MINECRAFT_XMX

Máximo tamaño de memoria.

#### MINECRAFT_XMS

Tamaño inicial de memoria.

## FAQ

### Los archivos de configuración normalmente están en la misma carpeta que jar del servidor, ¿La persistencia también incluye el jar?
No, la persistencia en volume, solo incluye los archivos ops.json, banned-\*.json, whitelist.json, server.properties y la carpeta del mapa.

### ¿Donde puedo encontrar mas información sobre las configuración personalizada?
Las variables son las mismas que el archivo server.properties pero en mayúsculas y cambiando el guion medio (-) por guion bajo (\_), y se puede encontrar mas información en esta [pagina](https://minecraft-es.gamepedia.com/Server.properties).
