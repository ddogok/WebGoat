#!/bin/bash

sudo apt-get update -y

if ! java -version &> /dev/null
then
    sudo apt-get install -y openjdk-17-jdk
fi

sudo pkill -f 'webgoat' || true

echo "Checking if /app directory exists"
if [ ! -d "/app" ]; then
  sudo mkdir /app
  echo "/app directory created"
else
  echo "/app directory already exists"
fi

sudo chmod -R 755 /app

echo "Before install script completed."
