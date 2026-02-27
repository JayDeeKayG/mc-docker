#!/bin/bash

VERSION=$MC_VERSION
LOADER=$MC_LOADER

case $LOADER in
vanilla)
  # vanilla do something
  ;;
fabric)
  wget -O mc_server.jar https://meta.fabricmc.net/v2/versions/loader/$MC_VERSION/0.18.2/1.1.1/server/jar
  ;;
*)
  echo "Unknown loader: $LOADER"
  ;;
esac

echo "eula=true" >/minecraft/eula.txt
touch /scripts/ready
