#!/bin/bash

# Running Docker installation script for Mota project

# Check if Docker is installed
docker --version
if [ $? -eq 0 ]; then
    echo "Docker is already installed"
else
    echo "Docker is not installed"
    echo "Please install Docker before running this script!"
    exit 1
fi

# Check if Docker is running
docker ps -a
if [ $? -eq 0 ]; then
    echo "Docker is running"
else
    echo "Docker is not running"
    echo "Please start Docker before running this script!"
    exit 1
fi

# Run Docker Install Container
docker run -it --rm \
-v "$(pwd)":/usr/config \
-v mota-backend_gcloud-config:/root/.config \
-v mota-backend_maven-repo:/root/.m2 \
-v mota-backend_mota-source:/home/mota \
-v "$(pwd)/mota-docker":/home/mota/mota-docker \
-w /usr/config \
gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine \
/bin/bash install.sh

echo "Building Docker Image"
echo "Please wait..."

# Build Docker Image
cd mota-docker/docker-backend/
docker compose up
