# Required SSH configuration
sudo mv ca.pub /etc/ssh
echo TrustedUserCAKeys /etc/ssh/ca.pub | sudo tee -a /etc/ssh/sshd_config
ssh-keygen -t ecdsa
sudo systemctl restart sshd
