#!/bin/bash

JVM_ARGS=$(</config/jvm_args.txt)
MAX_RAM=$(cat /sys/fs/cgroup/memory.max)
MAX_RAM_MB=$((MAX_RAM / 1024 / 1024))

JVM_ARGS="$JVM_ARGS -Xmx${MAX_RAM_MB}m -Xms${MAX_RAM_MB}m"

Debug=$DEBUG

mode=$(</config/init)

runServer() {

  if [ Debug ]; then
    echo "Starting Server"
  fi

  jar_file=$(find /minecraft -maxdepth 1 -type f -name "*.jar" -print -quit)
  if [ -f "$jar_file" ]; then
    java $JVM_ARGS -jar "$jar_file" nogui
  else
    echo "No jar file found!"
  fi
}

case $mode in
"0")
  # initial server installer run and then server
  if [ Debug ]; then
    echo "Starting Install script"
  fi

  bash /scripts/Install.sh

  while [ ! -f /config/done ]; do
    sleep 0.1
  done

  rm /config/done

  runServer
  ;;
"1")
  # normal run
  runServer

  ;;
"2")
  # something placeholder

  if [ Debug ]; then
    echo "Running Reinstall"
  fi

  rm -fr /minecraft/
  echo "0" >/config/init

  ;;
*)
  # doing nothing makes the container to be in restart loop so
  sleep 5s
  ;;
esac

# still a basic script
