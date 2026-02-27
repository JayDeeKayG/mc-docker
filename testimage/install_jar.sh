#!/bin/bash

# Ensure required environment variables are set
if [ -z "$MINECRAFT_VERSION" ] || [ -z "$FORGE_VERSION" ] || [ -z "$SERVER_TYPE" ]; then
  echo "ERROR: MINECRAFT_VERSION, FORGE_VERSION, and SERVER_TYPE must be set."
  exit 1
fi

# Construct the URL for the Forge installer jar
FORGE_INSTALLER_URL="https://maven.minecraftforge.net/net/minecraftforge/forge/${MINECRAFT_VERSION}-${FORGE_VERSION}/forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar"

echo "Fetching Forge installer from: $FORGE_INSTALLER_URL"

# Download the installer jar if the server type is 'forge'
if [ "$SERVER_TYPE" = "forge" ]; then
  wget -O forge_installer.jar "$FORGE_INSTALLER_URL"
  if [ $? -eq 0 ]; then
    echo "Forge installer downloaded successfully."
    # Run the installer to set up the forge server
    java -jar forge_installer.jar --installServer
    if [ $? -eq 0 ]; then
      echo "Forge server setup completed."
    else
      echo "Forge server setup failed."
      exit 1
    fi
  else
    echo "Failed to download the Forge installer."
    exit 1
  fi
else
  echo "Server type is not 'forge', skipping download."
fi
