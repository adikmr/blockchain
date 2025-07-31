#!/bin/bash
ADDR1=$(docker exec node1 bitcoin-cli -regtest -rpcuser=user -rpcpassword=pass getnewaddress)
docker exec node1 bitcoin-cli -regtest -rpcuser=user -rpcpassword=pass generatetoaddress 101 $ADDR1