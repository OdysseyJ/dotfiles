#!/bin/bash
set -e
set -o pipefail

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
    rsync --exclude ".git/" --exclude "bootstrap.sh" \
        --exclude "README.md" -avh --no-perms . ~;
    source ~/.bashrc;
    source ~/.bash_profile;

    # Install Vundle first
    rm -rf ~/.vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    # Install Vundle plugins
    vim +PluginInstall +qall
    cd ~
    tar xvf grc.tar.gz
    cd ~/grc-1.5
    sudo ./install.sh
    rm -rf ~/grc-1.5
    rm -rf ~/grc.tar.gz
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you
    sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
