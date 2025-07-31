#!/bin/bash
ADDR2=$(docker exec node2 bitcoin-cli -regtest -rpcuser=user -rpcpassword=pass getnewaddress)
docker exec node1 bitcoin-cli -regtest -rpcuser=user -rpcpassword=pass sendtoaddress $ADDR2 1
docker exec node1 bitcoin-cli -regtest -rpcuser=user -rpcpassword=pass generatetoaddress 1 $(docker exec node1 bitcoin-cli -regtest -rpcuser=user -rpcpassword=pass getnewaddress)
echo "Transaction sent and confirmed!"