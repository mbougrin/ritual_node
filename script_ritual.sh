sudo apt update && sudo apt upgrade -y

sudo apt -qy install curl git jq lz4 build-essential screen

sudo apt install docker.io

sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

git clone https://github.com/ritual-net/infernet-container-starter

cd infernet-container-starter

git checkout 2a11fd3953ed679b137dae574de9fbce3046a22e

screen -S ritual

sudo project=hello-world make deploy-container -d

# ctrl A + D for qui
# return on it (screen -ls) - (screen -x %d return on screen ls)

vi deploy/config.json

#add api key https alchemy (Base/Base Mainnet)

sudo docker restart anvil-node
sudo docker restart hello-world
sudo docker restart deploy-node-1
sudo docker restart deploy-fluentbit-1
sudo docker restart deploy-redis-1