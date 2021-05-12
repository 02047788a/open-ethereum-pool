#!/bin/bash
geth console --http --http.addr 127.0.0.1 --http.port 8545 --allow-insecure-unlock --maxpeers 50 --http.api "eth,net,web3,debug,personal" --miner.threads 1 --mine --datadir "/mnt/ethpool/.ethereum" --syncmode fast

#--cache=1024 (default 4096)
#--miner.threads 0