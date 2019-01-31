# Update the system to the latest version available
sudo apt update && sudo apt upgrade -y

# Install basic packages
sudo apt install -y glances vim zsh wget screenfetch tree

# Install oh-my-zsh and autocomplete themes
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting


# Remove old dotfiles and replace them with the new ones
rm ~/.zshrc
cp dotfiles/.vimrc ~/.vimrc
cp dotfiles/.zshrc ~/.zshrc
