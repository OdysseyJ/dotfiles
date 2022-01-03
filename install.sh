#!/bin/bash

cd ~

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Core
brew install git
brew install tmux
brew install zsh
brew install ctags-exuberant
brew install wget
brew install httpie
brew install lsd
brew install cask
brew install ripgrep
brew install the_silver_searcher
brew install direnv

# Visual
brew install lsd
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# vim
brew install neovim
brew install fzf

# vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Set default shell to zsh
chsh -s $(which zsh)

# pyenv
brew install openssl readline sqlite3 xz zlib
curl https://pyenv.run | zsh
brew install pyenv-virtualenv

# Install Oh My Zsh
if [ -d ".oh-my-zsh" ]; then
    cd .oh-my-zsh && git pull origin master && cd ~
else
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

# Backup old files
mkdir -p .old_dotfiles
[ -d ".config/nvim/init.vim" ] && mv .config/nvim/init.vim .old_dotfiles
[ -d ".zshrc" ] && mv .zshrc .old_dotfiles
[ -d ".tmux.conf" ] && mv .tumx.conf .old_dotfiles

# Install tpm
if [ -d ".tmux/plugins/tpm " ]; then
    cd .tmux/plugins/tpm && git pull origin master && cd ~
else
    git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm
fi

# Link rc files
mkdir ~/.config/nvim/
ln -s -f ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -s -f ~/.dotfiles/zshrc ~/.zshrc
ln -s -f ~/.dotfiles/.tmux/tmux.conf ~/.tmux.conf
ln -s -f ~/.dotfiles/.tmux/tmux.conf.local ~/.tmux.conf.local
ln -s -f ~/.dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json

# Install vim dependencies.
vim +PlugInstall +qall
vim +"CocInstall coc-python" +qall
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# Remove outdated versions from the cellar.
brew cleanup
