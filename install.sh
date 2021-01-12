#!/bin/bash

cd ~

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install other packages
brew install git
brew install the_silver_searcher
brew install tmux
brew install zsh
brew install fzf
brew install ctags-exuberant
brew install wget
brew install httpie
brew install lsd

# Install python packages
sudo easy_install pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper --ignore-installed

# Install Oh My Zsh
if [ -d ".oh-my-zsh" ]; then
    cd .oh-my-zsh && git pull origin master && cd ~
else
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

# Clone dotfiles repo
if [ -d ".dotfiles" ]; then
    cd .dotfiles && git pull origin master && cd ~
else
    git clone https://github.com/scubedoo187/dotfiles.git .dotfiles
fi

# Vim related
mkdir ~/.tmp
mkdir ~/.tmp/vim
mkdir ~/.tmp/vim/backup
mkdir ~/.tmp/vim/swap
mkdir ~/.tmp/vim/undo

# Backup old files
mkdir -p .old_dotfiles
[ -d ".vim" ] && mv .vim .old_dotfiles
[ -d ".vimrc" ] && mv .vimrc .old_dotfiles
[ -d ".zshrc" ] && mv .zshrc .old_dotfiles

# Link rc files
ln -s .dotfiles/vimrc .vimrc
ln -s .dotfiles/vim .vim
ln -s .dotfiles/zshrc .zshrc
ln -s .dotfiles/tmux.conf .tmux.conf

# Install tpm
if [ -d ".tmux/plugins/tpm " ]; then
    cd .tmux/plugins/tpm && git pull origin master && cd ~
else
    git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm
fi

# Install Vundle
if [ -d ".vim/bundle/Vundle.vim" ]; then
    cd .vim/bundle/Vundle.vim && git pull origin master && cd ~
else
    git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
~/.tmux/plugins/tpm/scripts/install_plugins.sh
