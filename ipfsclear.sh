idena-manager status
idena-manager disable
rm log*
cd datadir-node1
rm -r ipfs
rm -r logs
cd ..
cd datadir-node2
rm -r ipfs
rm -r logs
cd ..
cd datadir-node3
rm -r ipfs
rm -r logs
cd ..
cd datadir-node4
rm -r ipfs
rm -r logs
cd ..
idena-manager enable
idena-manager status
