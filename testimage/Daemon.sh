#!/bin/bash

VERSION=$MC_VERSION
LOADER=$MC_LOADER
LOADER_VERSION=$MC_LOADER_VERSION

case $LOADER in
vanilla)
  # vanilla do something
  ;;
fabric)
  url="https://meta.fabricmc.net/v2/versions/loader/$VERSION/$LOADER_VERSION/1.1.1/server/jar"
  wget -O mc_server.jar "$url"
  ;;
forge)
  url="https://maven.minecraftforge.net/net/minecraftforge/forge/$VERSION-$LOADER_VERSION/forge-$VERSION-$LOADER_VERSION-installer.jar"
  wget -O mc_server.jar "$url"
  java -jar mc_server.jar --installServer
  rm /minecraft/mc_server.jar
  ;;
*)
  echo "Unknown loader: $LOADER"
  ;;
esac

echo "eula=true" >/minecraft/eula.txt

# running the server jar
jar_file=$(find /minecraft -maxdepth 1 -type f -name "*.jar" -print -quit)
if [ -f "$jar_file" ]; then
  java -jar "$jar_file" nogui
else
  echo "No jar file found!"
fi

# still a basic script
