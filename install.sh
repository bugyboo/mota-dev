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
cd /home

# clone the repository
gcloud source repos clone mota-sb
gcloud source repos clone mota-lib-dao
gcloud source repos clone mota-executor
gcloud source repos clone ng-mota
gcloud source repos clone mota-docker

echo ""
echo "Finished installing the source code..."
echo ""