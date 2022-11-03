#!/bin/bash

arg=$1

if [ "$arg" = "start" ]; then
    echo "Starting Redis cluster..."
    
    # check data dir exists
    if [ ! -d "./data" ]; then
        echo "Creating data directory..."
        
        mkdir ./data && cd ./data
        mkdir 9000 9001 9002 9003 9004 9005 9006 && cd ..
    fi
    
    cd ./9000 && redis-server redis.conf
    
    cd ../9001 && redis-server redis.conf
    
    cd ../9002 && redis-server redis.conf
    
    cd ../9003 && redis-server redis.conf
    
    cd ../9004 && redis-server redis.conf
    
    cd ../9005 && redis-server redis.conf
    
    cd ../9006 && redis-server redis.conf
    
    cd ../ && redis-cli --cluster create 127.0.0.1:9000 127.0.0.1:9001 127.0.0.1:9002 127.0.0.1:9003 127.0.0.1:9004 127.0.0.1:9005 127.0.0.1:9006 --cluster-replicas 1
fi

if [ "$arg" = "stop" ]; then
    echo "Stopping Redis cluster..."
    redis-cli -p 9000 shutdown force
    redis-cli -p 9001 shutdown force
    redis-cli -p 9002 shutdown force
    redis-cli -p 9003 shutdown force
    redis-cli -p 9004 shutdown force
    redis-cli -p 9005 shutdown force
    redis-cli -p 9006 shutdown force
    echo "Redis cluster stopped"
    
    exit 0
fi

if [ "$arg" = "reset" ]; then
    echo "Removing previous cluster data..."
    
    # check data dir exists
    if [ -d "./data" ]; then
        rm -rf ./data
    fi
    
    exit 0
fi

# if no argument is passed, start the cluster
if [ -z "$arg" ]; then
    echo "Usage: redis [start|stop|reset]"
    exit 1
fi