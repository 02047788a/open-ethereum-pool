#!/bin/bash

process=$(ps aux | grep "[o]pen-ethereum-pool config.json")

if [ -z "$process" ]
then
        cd /media/data/open-ethereum-pool
        ./build/bin/open-ethereum-pool config.json
fi