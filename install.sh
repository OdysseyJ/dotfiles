#!/bin/bash

cd ~

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install other packages
brew install git
brew install tmux
brew install zsh
brew install fzf
brew install ctags-exuberant
brew install wget
brew install httpie
brew install lsd
brew install neovim
brew install cask
brew install zsh-syntax-highlighting
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Set default shell to zsh
chsh -s $(which zsh)

# Apply plugin
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
    git clone https://github.com/Odysseyj/dotfiles.git .dotfiles
fi

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Backup old files
mkdir -p .old_dotfiles
[ -d ".config/nvim/init.vim" ] && mv .config/nvim/init.vim .old_dotfiles
[ -d ".zshrc" ] && mv .zshrc .old_dotfiles

# Link rc files
ln -s .dotfiles/init.vim .config/nvim/init.vim
ln -s .dotfiles/zshrc .zshrc
ln -s .dotfiles/tmux.conf .tmux.conf

# Install tpm
if [ -d ".tmux/plugins/tpm " ]; then
    cd .tmux/plugins/tpm && git pull origin master && cd ~
else
    git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm
fi

# Install dependencies.
vim +PluginInstall +qall
~/.tmux/plugins/tpm/scripts/install_plugins.sh
