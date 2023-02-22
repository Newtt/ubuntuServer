# Update the system to the latest version available
sudo apt update && sudo apt upgrade -y

# Enabling automated upgrades
sudo mv 50unattended-upgrades /etc/apt/apt.conf.d/
sudo mv 20auto-upgrades /etc/apt/apt.conf.d/

# Install basic packages
sudo apt install -y vim zsh wget tree language-pack-en tmux

# Required SSH configuration
sudo mv ca.pub /etc/ssh
echo TrustedUserCAKeys /etc/ssh/ca.pub | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd

# Remove password authentication
sudo sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# NTP Setup
echo 'Servers=0.debian.pool.ntp.org 1.debian.pool.ntp.org 2.debian.pool.ntp.org 3.debian.pool.ntp.org' | sudo tee -a /etc/systemd/timesyncd.conf
sudo systemctl restart systemd-timesyncd

echo 'done'
