#!/bin/bash

VERSION=$MC_VERSION
LOADER=$MC_LOADER
LOADER_VERSION=$MC_LOADER_VERSION

case $LOADER in
vanilla)
  # vanilla do something
  ;;
fabric)
  wget -O mc_server.jar https://meta.fabricmc.net/v2/versions/loader/$VERSION/$LOADER_VERSION/1.1.1/server/jar
  ;;
*)
  echo "Unknown loader: $LOADER"
  ;;
esac

echo "eula=true" >/minecraft/eula.txt
touch /scripts/ready
