#!/bin/bash

docker build -t mc-server ./testimage

docker compose up -d

docker ps -a

# this will be a script to automatically
# 1. run build on image
#
# 2. create a container for each loader
#
# 3. log any errors or warns it will get from running these containers in debug mode
#
# 4. test functionality for each defined case in Daemon.sh
