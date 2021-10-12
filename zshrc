# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/seongwoon/.oh-my-zsh"

export PATH="$PATH:/Users/seongwoon/flutter/bin"

ZSH_THEME="agnoster"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh
[ -f "$HOME/.zshrc.local" ] && source ~/.zshrc.local

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

prompt_context() { 
  # Custom (Random emoji) 
  prompt_segment black default "seongwoon "🐸"" 
}

# lsd
alias ls='lsd'
alias ll='ls -alhF'

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export ES_HOME=/usr/local/opt/elasticsearch@2.4
export PATH="$ES_HOME/bin:$PATH"

export PATH="/Users/seongwoon/Library/Python/2.7/bin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"

alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
export EDITOR=/usr/local/bin/nvim

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

deploy-lambda() {
  if [ -n "$1" ] ; then
    function_name=$1
  else
    function_name=${PWD##*/}
  fi
  zip -r deploy.zip * && aws lambda update-function-code --function-name $function_name --zip-file fileb://./deploy.zip && rm deploy.zip
}

eval "$(direnv hook zsh)"

export PATH="/usr/local/opt/node@12/bin:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
