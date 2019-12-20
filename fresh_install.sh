# Update the system to the latest version available
sudo apt update && sudo apt upgrade -y

# Enabling automated upgrades
sudo mv 50unattended-upgrades /etc/apt/apt.conf.d/
sudo mv 20auto-upgrades /etc/apt/apt.conf.d/

# Install basic packages
sudo apt install -y glances vim zsh wget screenfetch tree ranger language-pack-en

# Required SSH configuration
sudo mv ca.pub /etc/ssh
echo TrustedUserCAKeys /etc/ssh/ca.pub | sudo tee -a /etc/ssh/sshd_config
ssh-keygen -t ecdsa
sudo systemctl restart sshd

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Installing zsh plugins
echo "Installing zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# Remove old dotfiles and replace them with the new ones
rm ~/.zshrc
cp dotfiles/.vimrc ~/.vimrc
cp dotfiles/.zshrc ~/.zshrc
