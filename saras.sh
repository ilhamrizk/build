#!bin/bash
# build.sh

# install mesh network
sudo apt-get update
sudo apt-get install libnl-3-dev libnl-genl-3-dev pkg-config net-tools -y 
cd /usr/local/bin
sudo rm -r saras
sudo git clone https://github.com/ilhamrizk/saras.git
sudo chmod 777 saras
cd saras/batctl
sudo make install
sudo cp /usr/local/bin/saras/mesh/mesh.sh /mesh.sh
sudo chmod 700 /mesh.sh
sudo cp /usr/local/bin/saras/mesh/sysctl.conf sysctl.conf
sudo apt-get -y install hostapd dnsmasq

sudo cp /usr/local/bin/saras/mesh/mesh.service /etc/systemd/system/mesh.service
sudo systemctl daemonreload
sudo systemctl enable mesh.service
sudo systemctl disable dhclient
sudo systemctl disable NetworkManager
sudo systemctl disable networking
sudo systemctl disable wpa_supplicant

#install influx
cd /usr/local/bin/saras/
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.7.6_amd64.deb
sudo dpkg -i influxdb_1.7.6_amd64.deb
sudo systemctl enable influxdb
sudo systemctl start influxdb

influx -execute "create user 'action' with password 'action' with all privileges"
influx -execute "create database PETS1"
influx -execute "create database RESPACK1"
influx -execute "create database RESPACK2"
influx -execute "create database RESPACK3"

#install saras
sudo apt-get install python-pip python-pandas python-influxdb -y
sudo pip install flask
cp /usr/local/bin/saras/saras.service /etc/systemd/system/saras.service
sudo chmod 700 /etc/systemd/system/saras.service
sudo systemctl daemon-reload
sudo systemctl enable saras.service

sudo reboot
