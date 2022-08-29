source <(curl -sL https://bit.ly/idena-manager-installer)
sudo fallocate -l 1G /swapfile2 && sudo chmod 600 /swapfile2 && sudo mkswap /swapfile2 && sudo swapon /swapfile2 && echo '/swapfile2 none swap sw 0 0' | sudo tee -a /etc/fstab
idena-manager add
idena-manager disable
cd datadir-node1
rm -r idenachain.db
rm -r ipfs
mkdir idenachain.db
cd idenachain.db
sudo apt-get install unzip
wget "https://pool.idena.site/idenachain.db.zip"
unzip idenachain.db.zip
rm idenachain.db.zip
cd ..
cd ..
sudo apt-get install -y sed
sed -i 's/"rpc_host":"localhost"/"rpc_host":"0.0.0.0"/g' .idena.config
idena-manager enable
idena-manager status
