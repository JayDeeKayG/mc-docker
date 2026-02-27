#!/bin/bash

chmod +x /scripts/Prep.sh
bash /scripts/Prep.sh

while true; do
  if [ -f "/scripts/ready" ]; then
    java -jar /minecraft/mc_server.jar
    break
  else
    sleep 0.1
  fi
done

# still a basic script
