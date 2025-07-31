#!/bin/bash
set -e

echo "=== Waiting for node1 RPC to be ready ==="
until docker exec node1 bitcoin-cli -regtest -rpcuser=user -rpcpassword=pass getblockchaininfo > /dev/null 2>&1; do
  sleep 2
done

echo "=== Waiting for node2 RPC to be ready ==="
until docker exec node2 bitcoin-cli -regtest -rpcport=18444 -rpcuser=user -rpcpassword=pass getblockchaininfo > /dev/null 2>&1; do
  sleep 2
done

echo "=== Creating wallets on both nodes ==="
docker exec node1 bitcoin-cli -regtest -rpcuser=user -rpcpassword=pass createwallet "wallet1" || true
docker exec node2 bitcoin-cli -regtest -rpcport=18444 -rpcuser=user -rpcpassword=pass createwallet "wallet2" || true

echo "=== Getting new addresses ==="
ADDR1=$(docker exec node1 bitcoin-cli -regtest -rpcuser=user -rpcpassword=pass getnewaddress)
ADDR2=$(docker exec node2 bitcoin-cli -regtest -rpcport=18444 -rpcuser=user -rpcpassword=pass getnewaddress)

echo "=== Connecting nodes ==="
NODE2_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' node2)
docker exec node1 bitcoin-cli -regtest -rpcuser=user -rpcpassword=pass addnode $NODE2_IP:18445 add

echo "Node1 Address: $ADDR1"
echo "Node2 Address: $ADDR2"