#!/bin/bash

process=$(ps aux | grep "[g]eth --rpc")
if [ -z "$process" ]
then
        # --gcmode=archive 
        #--syncmode light
        #geth --rpc --rpcaddr 127.0.0.1 --rpcport 8545 --cache=1024 --datadir /media/data/eth-geth/ --rpcapi "eth,net,web3,debug,personal" --miner.notify 127.0.0.1:8888/notify  --mine --miner.threads 0  --etherbase "0x2669ffcf90ed47ea9c8fbf741340d8594e62694c" --mine --unlock "0x2669ffcf90ed47ea9c8fbf741340d8594e62694c" --allow-insecure-unlock --password /mnt/ethpool/pwd
        geth --rpc --rpcaddr 127.0.0.1 --rpcport 8545 --cache=1024 --datadir eth-geth/ --rpcapi "eth,net,web3,debu g,personal" --miner.notify 127.0.0.1:8888/notify --mine --miner.threads 0
        #https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.10.3-991384a7.tar.gz
fi