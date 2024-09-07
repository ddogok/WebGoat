#!/bin/bash

sudo apt-get update -y

if ! java -version &> /dev/null
then
    sudo apt-get install -y openjdk-17-jdk
fi

sudo pkill -f 'webgoat' || true

if [ ! -d "/app" ]; then
  sudo mkdir /app
fi

sudo chmod -R 755 /app

echo "Before install script completed."
