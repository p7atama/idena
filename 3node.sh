source <(curl -sL https://bit.ly/idena-manager-installer)
idena-manager add
idena-manager disable
cd datadir-node1
rm -r idenachain.db
mkdir idenachain.db
cd idenachain.db
sudo apt-get install unzip
wget "https://sync.idena-ar.com/idenachain.db.zip"
unzip idenachain.db.zip
rm idenachain.db.zip
cd ..
cd ..
idena-manager add
idena-manager disable
cd datadir-node2
rm -r idenachain.db
mkdir idenachain.db
cd idenachain.db
wget "https://sync.idena-ar.com/idenachain.db.zip"
unzip idenachain.db.zip
rm idenachain.db.zip
cd ..
cd ..
idena-manager add
idena-manager disable
cd datadir-node3
rm -r idenachain.db
mkdir idenachain.db
cd idenachain.db
wget "https://sync.idena-ar.com/idenachain.db.zip"
unzip idenachain.db.zip
rm idenachain.db.zip
cd ..
cd ..
sudo apt-get install -y sed
sed -i 's/"rpc_host":"localhost"/"rpc_host":"0.0.0.0"/g' .idena.config
idena-manager enable
idena-manager status
