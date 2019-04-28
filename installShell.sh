#!/bin/bash
# Update the repos
apt update
apt upgrade

# Install zsh
apt install zsh -y

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install Powerlevel9K
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install autojump
apt install autojump

# Change Shell to zsh
chsh -s /bin/zsh

# Ask user if they want to reboot
read -p 'Do you want to restart now? [y/N]: ' response
if ["$response" == "y"]; then
    shutdown -r +1 "System will restart in one minute, please save all work."
else
    echo "zsh has been installed and is now the default shell.
          The system will need to be rebooted in order to make the change permanent."
fi

