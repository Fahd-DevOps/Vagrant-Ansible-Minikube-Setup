#!/bin/bash

# Create new user
sudo useradd -m -s /bin/bash fahd

# Set password for new user
echo 'fahd:123@fk' | sudo chpasswd

# Add new user to sudoers
echo 'fahd ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers

# Update SSH configuration to use new user
# sudo sed -i 's/^.*[Dd]efaultUser.*$/DefaultUser fahd/' /etc/ssh/sshd_config
# sudo systemctl restart sshd

# Disable vagrant user
# sudo usermod --lock vagrant