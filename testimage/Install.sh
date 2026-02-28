#!/bin/bash

VERSION=$MC_VERSION
LOADER=$MC_LOADER
LOADER_VERSION=$MC_LOADER_VERSION

vanilla_url="https://gist.githubusercontent.com/cliffano/77a982a7503669c3e1acb0a0cf6127e9/raw/6c7799c6135292befbc7a07ffde0063ecaa506c4/minecraft-server-jar-downloads.md"

case $LOADER in
vanilla)
  url=$(wget -qO- "$vanilla_url" | grep -i "$VERSION" | awk -F'|' '{print $3}' | xargs)
  wget -O mc_server.jar "$url"
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
touch /config/done
