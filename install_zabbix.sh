#!/bin/bash

# Update packet repo
wget http://repo.zabbix.com/zabbix/4.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.4-1%2Bbionic_all.deb
sudo dpkg -i zabbix-release_4.4-1+bionic_all.deb

# Install the agent
sudo apt update && sudo apt install zabbix-agent -y

# Remove the downloaded deb file
rm zabbix-release_4.4-1+bionic_all.deb

# Modify the configuration
read -p 'Zabbix server IP : ' server_ip
sudo sed -i "s/127.0.0.1/$server_ip/g" /etc/zabbix/zabbix_agentd.conf

# Enable the service
sudo systemctl enable zabbix-agent
sudo systemctl start zabbix-agent

echo 'done'
