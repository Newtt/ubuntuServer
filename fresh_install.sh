# Update the system to the latest version available
sudo apt update && sudo apt upgrade -y

# Enabling automated upgrades
sudo mv 50unattended-upgrades /etc/apt/apt.conf.d/
sudo mv 20auto-upgrades /etc/apt/apt.conf.d/

# Install basic packages
sudo apt install -y glances vim zsh wget screen screenfetch tree ranger language-pack-en

# Required SSH configuration
sudo mv ca.pub /etc/ssh
echo TrustedUserCAKeys /etc/ssh/ca.pub | sudo tee -a /etc/ssh/sshd_config
ssh-keygen -t ecdsa
sudo systemctl restart sshd

# Remove password authentication
sudo sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Installing zsh plugins
echo "Installing zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting

# Remove old dotfiles and replace them with the new ones
rm ~/.zshrc
cp dotfiles/.vimrc ~/.vimrc
cp dotfiles/.zshrc ~/.zshrc

# ZABBIX INSTALLATION
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

# NTP Setup
echo 'Servers=0.debian.pool.ntp.org 1.debian.pool.ntp.org 2.debian.pool.ntp.org 3.debian.pool.ntp.org' | sudo tee -a /etc/systemd/timesyncd.conf
sudo systemctl restart systemd-timesyncd

# Install special zsh plugins and themes
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo 'done'
