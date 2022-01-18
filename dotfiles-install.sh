#!/bin/bash

set -e

# * Update apt and install git and zsh.
# * commands must be run as root.
sudo apt update
sudo apt install -y git zsh wget

DOTFILES_DIR=$HOME/dotfiles
if [ -d "$DOTFILES_DIR" ]; then
    printf '%s\n' "Removing Lock ($DOTFILES_DIR)"
    rm -rf "$DOTFILES_DIR"
fi

GITHUB_USERNAME=nicolas-cho
# * Download dotfiles repo via HTTPS
git clone --bare https://github.com/$GITHUB_USERNAME/dotfiles.git $DOTFILES_DIR

# * For SSH use the following command
#git clone --bare git@github.com:devnicolasc/dotfiles.git $DOTFILES_DIR

# * Checkout the dotfiles repo
/usr/bin/git --git-dir=$DOTFILES_DIR --work-tree=$HOME config --local status.showUntrackedFiles no
/usr/bin/git --git-dir=$DOTFILES_DIR --work-tree=$HOME checkout

# * Download and install OH-MY-ZSH with --unattended and --keep-zshrc flags.
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O ohmyzsh-setup.sh

unset ZSH
sh ohmyzsh-setup.sh --unattended --keep-zshrc

# * Download powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# * Download plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# * Change the defalt shell
sudo chsh -s $(which zsh) $(whoami)

echo '\e[93mDone! run zsh command to enter the shell'