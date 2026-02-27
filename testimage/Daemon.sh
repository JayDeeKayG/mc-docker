#!/bin/bash

chmod +x /scripts/Prep.sh
bash /scripts/Prep.sh

while true; do
  if [ -f "/scripts/ready" ]; then
    jar_file=$(find /minecraft -maxdepth 1 -type f -name "*.jar" -print -quit)
    if [ -f "$jar_file" ]; then
      java -jar "$jar_file" nogui
    else
      echo "no jar to peknonc"
    fi
    break
  else
    sleep 0.1
  fi
done

# still a basic script
