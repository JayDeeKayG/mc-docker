# Minecraft Docker Images and Scripts

This repository contains Docker images and scripts for running Minecraft servers.

## Prerequisites

Ensure you have the following installed:
- Docker
- Docker Compose

## Setup Instructions

1. Clone the repository:

    ```bash
    git clone https://github.com/JayDeeKayG/mc-docker.git
    ```

2. Navigate into the project directory:

    ```bash
    cd ./mc-docker
    ```

3. Build the Docker image:

    ```bash
    docker build -t mc-server ./testimage
    ```

## Example Docker Compose Configuration

Here is an example Docker Compose configuration for a Minecraft Vanilla server:

```yaml
services:
  vanilla:
    image: mc-server  # Image name (adjust if you changed the Docker build command)
    container_name: vanilla-mc-server  # Container name
    environment:
      - MC_VERSION=latest  # Currently, 'latest' works only for Vanilla
      - MC_LOADER=vanilla  # Minecraft loader type
    restart: unless-stopped
    ports:
      - "25565:25565"  # Host -- Container (don't change the container port)
    mem_limit: 2G  # RAM usage limit
    mem_reservation: 2G  # RAM reservation for container
    memswap_limit: 2560m  # Allows the container to use swap (e.g., 512MB over the RAM limit)
    volumes:
      - ./data/minecraft-vanilla:/data  # Change directory if needed. It will create a 'minecraft' folder containing server files
