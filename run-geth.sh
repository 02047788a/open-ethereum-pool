#!/bin/bash

process=$(ps aux | grep "[g]eth --rpc")
if [ -z "$process" ]
then
        geth --rpc --rpcaddr 127.0.0.1 --rpcport 8545 --cache=1024 --datadir /media/data/eth-geth/ --rpcapi "eth,net,web3,debug,personal" --miner.notify 127.0.0.1:8888/notify  --miner.threads 0 --gcmode=archive --mine #--syncmode light
fi