#!/bin/bash

if ! sudo iptables -t nat -C PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080 &> /dev/null
then
    sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
fi

java -jar /app/webgoat-2023.8-SNAPSHOT.jar --server.address=0.0.0.0
