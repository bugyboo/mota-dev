#!/bin/bash

# This is a simple bash script
echo ""
echo "****************************************************"
echo "Welcome to Nervelife install script for Mota Project"
echo "****************************************************"
echo ""
echo "Initializing... gcloud auth login"

gcloud init

echo ""
echo "pulling the latest code from the repository..."
echo ""

# change the directory to the project directory /home
mkdir -p /home/mota

cd /home/mota

# clone the repository
gcloud source repos clone mota-sb
gcloud source repos clone mota-lib-dao
gcloud source repos clone mota-executor
gcloud source repos clone ng-mota
gcloud source repos clone mota-docker
gcloud source repos clone mota-dn

echo ""
echo "Finished installing the source code..."
echo ""

echo ""
echo "Compiling Mota libs"
echo ""

cd /home/mota/mota-lib-dao

mvn install -DskipTests

echo ""
echo "Finished installing Java libs"
echo ""

echo ""
echo "Copying mota-docker builder"
echo ""

mkdir -p /home/builder

cp -r /home/mota/mota-docker /home/builder/
