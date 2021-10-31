#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install git unzip curl screen -y

# Node.js 14.18 instalation
wget https://github.com/rioda-org/idena/raw/main/node-v14.18.0-linux-x64.tar.xz
sudo mkdir -p /usr/local/lib/nodejs
sudo tar -xJvf node-v14.18.0-linux-x64.tar.xz -C /usr/local/lib/nodejs
rm node-v14.18.0-linux-x64.tar.xz
echo "export PATH=/usr/local/lib/nodejs/node-v14.18.0-linux-x64/bin:$PATH" >> ~/.profile
. ~/.profile

mkdir datadir && cd datadir
mkdir idenachain.db && cd idenachain.db
wget "https://sync.idena.site/idenachain.db.zip"
unzip idenachain.db.zip && rm idenachain.db.zip
cd ../..

curl -s https://api.github.com/repos/idena-network/idena-go/releases/latest \
| grep browser_download_url \
| grep idena-node-linux-0.* \
| cut -d '"' -f 4 \
| wget -qi -
mv idena-* idena-go && chmod +x idena-go
bash -c 'echo "{\"IpfsConf\":{\"Profile\": \"server\" ,\"FlipPinThreshold\":1},\"Sync\": {\"LoadAllFlips\": true, \"AllFlipsLoadingTime\":7200000000000}}" > config.json'

#this is conf for minimal test node
#bash -c 'echo "{\"P2P\":{\"MaxInboundPeers\":4,\"MaxOutboundPeers\":1},\"IpfsConf\":{\"Profile\":\"server\",\"BlockPinThreshold\":0.1,\"FlipPinThreshold\":0.1}}" > config.json'

touch node-restarted.log

tee update << 'EOF'
killall screen
rm idena-go
curl -s https://api.github.com/repos/idena-network/idena-go/releases/latest | grep browser_download_url | grep idena-node-linux-0.* | cut -d '"' -f 4 | wget -qi -
mv idena-node-linux* idena-go
chmod +x idena-go
screen -dmS node $PWD/start
echo Update was successfull
EOF
chmod +x update

tee version << 'EOF'
curl 'http://127.0.0.1:9009/' -H 'Content-Type: application/json' --data '{"method":"dna_version","params":[{}],"id":1,"key":"123"}'
EOF
chmod +x version

bash -c 'echo "while :
do
./idena-go --config=config.json --profile=shared --apikey=123
date >> node-restarted.log
done" > start'
chmod +x start
(crontab -l 2>/dev/null; echo "@reboot screen -dmS node $PWD/start") | crontab -

npm i npm@latest -g
git clone https://github.com/idena-network/idena-node-proxy
npm i -g pm2

cd idena-node-proxy
wget https://raw.githubusercontent.com/rioda-org/idena/main/index.html

bash -c 'echo "AVAILABLE_KEYS=[\"apikey26817\",\"apikey14\",\"apikey566\",\"apikey39\",\"apikey599\",\"apikey2156\",\"apikey99741\",\"apikey352\",\"apikey0831\",\"apikey08\",\"apikey96934\",\"apikey09530\",\"apikey58\",\"apikey036\",\"apikey140\",\"apikey1923\",\"apikey16157\",\"apikey644\",\"apikey70683\",\"apikey94\",\"apikey09\",\"apikey8747\",\"apikey8\",\"apikey92\",\"apikey979\",\"apikey7722\",\"apikey48\",\"apikey2\",\"apikey7\",\"apikey45\",\"apikey977\",\"apikey072\",\"apikey523\",\"apikey9945\",\"apikey28902\",\"apikey02845\",\"apikey5862\",\"apikey63\",\"apikey72\",\"apikey08525\",\"apikey489\",\"apikey4277\",\"apikey413\",\"apikey22\",\"apikey64417\",\"apikey095\",\"apikey028\",\"apikey74\",\"apikey26\",\"apikey5\",\"apikey5742\",\"apikey082\",\"apikey51759\",\"apikey04\",\"apikey35\",\"apikey4\",\"apikey3\",\"apikey0119\",\"apikey130\",\"apikey6\",\"apikey6113\",\"apikey902\",\"apikey04946\",\"apikey097\",\"apikey34880\",\"apikey82\",\"apikey226\",\"apikey227\",\"apikey77\",\"apikey78\",\"apikey7468\",\"apikey3304\",\"apikey4968\",\"apikey37362\",\"apikey57\",\"apikey10\",\"apikey686\",\"apikey27\",\"apikey28\",\"apikey412\",\"apikey8423\",\"apikey23929\",\"apikey90997\",\"apikey12802\",\"apikey61108\",\"apikey22971\",\"apikey55213\",\"apikey92994\",\"apikey15461\",\"apikey30103\",\"apikey27466\",\"apikey38097\",\"apikey05169\",\"apikey99458\",\"apikey42932\",\"apikey20120\",\"apikey03871\",\"apikey58805\",\"apikey26100\",\"apikey70970\",\"apikey92404\",\"apikey88019\",\"apikey56629\",\"apikey47069\",\"apikey54382\",\"apikey63333\",\"apikey29489\",\"apikey13724\",\"apikey48825\",\"apikey10817\",\"apikey21214\",\"apikey89215\",\"apikey70933\",\"apikey43375\",\"apikey74630\",\"apikey39382\",\"apikey78244\",\"apikey49413\",\"apikey61840\",\"apikey26907\",\"apikey81902\",\"apikey21050\",\"apikey05670\",\"apikey09636\",\"apikey89751\",\"apikey41129\",\"apikey32861\",\"apikey34225\",\"apikey08978\",\"apikey24530\",\"apikey02288\",\"apikey313684\",\"apikey542340\",\"apikey620433\",\"apikey674593\",\"apikey066147\",\"apikey935757\",\"apikey548834\",\"apikey980287\",\"apikey586196\",\"apikey526655\",\"apikey819242\",\"apikey692053\",\"apikey628174\",\"apikey641863\",\"apikey663971\",\"apikey848969\",\"apikey593328\",\"apikey005761\",\"apikey001360\",\"apikey812088\",\"apikey204489\",\"apikey244335\",\"apikey805514\",\"apikey635018\",\"apikey871108\",\"apikey154468\",\"apikey735014\",\"apikey966052\",\"apikey591424\",\"apikey346139\",\"apikey630125\",\"apikey995302\",\"apikey853866\",\"apikey144365\",\"apikey815034\",\"apikey137556\",\"apikey401852\",\"apikey866180\",\"apikey487174\",\"apikey675257\",\"apikey860341\",\"apikey411909\",\"apikey656258\",\"apikey745565\",\"apikey878381\",\"apikey988042\",\"apikey356448\",\"apikey159174\",\"apikey204162\",\"apikey031016\",\"apikey849327\",\"apikey167224\",\"apikey868182\",\"apikey970395\",\"apikey456041\",\"apikey572527\",\"apikey668791\",\"apikey983779\",\"apikey665889\",\"apikey466968\",\"apikey622654\",\"apikey097141\",\"apikey539850\",\"apikey749962\",\"apikey236782\",\"apikey997470\",\"apikey859102\",\"apikey980782\",\"apikey769304\",\"apikey173564\",\"apikey664863\",\"apikey112986\",\"apikey878641\",\"apikey040964\",\"apikey881389\",\"apikey045198\",\"apikey166561\",\"apikey570738\",\"apikey151729\",\"apikey379356\",\"apikey181182\",\"apikey252980\",\"apikey725406\",\"apikey784859\",\"apikey775050\",\"apikey609942\",\"apikey127352\",\"apikey810082\",\"apikey185712\",\"apikey286281\",\"apikey472508\",\"apikey244744\",\"apikey379788\",\"apikey760337\",\"apikey182870\",\"apikey192728\",\"apikey136191\",\"apikey655444\",\"apikey790560\",\"apikey841712\"]
IDENA_URL=\"http://localhost:9009\"
IDENA_KEY=\"123\"
PORT=80" > .env'
#GOD_API_KEY=\"test\"
#REMOTE_KEYS_ENABLED=0

npm install
sed -i 's/stdout/file/g' config_default.json
npm start
pm2 startup
sudo reboot
