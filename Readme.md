1) Create a Dockerfile file , you can pick your base image as per your convinence i have taken slim version as its light weight compared to original base image 
2) build the image by downloading binares and extracting the content 
3) tag the image which is build on your local 
4) build the docker compose file using the image you build locally it runs two nodes with bitcoin core v26.0 in regtest mode 
5) create new address once the nodes are up using wallet.sh as by default  bitcoin Core doesn’t create a wallet automatically in regtest mode
6) once we create the wallet address we need to run mine.sh script as it will mine some dummy block and post this we will have around 50 BTC in node 1 and mining 101 blocks ensures the first mined reward is matured and spendable wallet now has spendable BTC for transactions 
7) lastly we need to run transact.sh this send 1 BTC from node1 to node2