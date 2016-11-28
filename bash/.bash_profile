# script dir.
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# common.
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export GIT_EDITOR=$EDITOR

# nvim.
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export NVIM_PYTHON_LOG_FILE="/tmp/.log"
export NVIM_PYTHON_LOG_LEVEL=DEBUG

# pyenv.
export PATH=$HOME/.pyenv/bin:$PATH
eval "$(pyenv init -)"
pyenv global 2.7.12
pyenv rehash

# nvm.
source $HOME/.nvm/nvm.sh
nvm use v5.4.1 > /dev/null

# phpbrew.
export PHPBREW_RC_ENABLE=1
source $HOME/.phpbrew/bashrc
phpbrew use php-7.0.12

# local settings.
if [ -d $SCRIPT_DIR/.bash_profile.local ]; then
  source $SCRIPT_DIR/.bash_profile.local
fi

# alias.
alias vim=nvim

