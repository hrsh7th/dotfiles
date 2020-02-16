# script dir.
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# common.
export XDG_CONFIG_HOME="$HOME/.config"
export GIT_EDITOR=$EDITOR

# Local bin
export PATH="$HOME/Local/bin:$PATH"

# brew.
export PATH="/usr/local/bin:$PATH"

# php (Append path for before of brew to use php7.3 isntead of php7.4)
export PATH="/usr/local/Cellar/php@7.3/7.3.13/bin:$PATH"

# ruby(from brew)
export PATH="/usr/local/Cellar/ruby/2.6.5/bin:$PATH"

# rubygems
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# nvim.
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export NVIM_PYTHON_LOG_FILE="/tmp/.log"
export NVIM_PYTHON_LOG_LEVEL=DEBUG
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# nvm.
. "$HOME/.nvm/nvm.sh" --no-use
nvm use default > /dev/null

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# local settings.
if [ -f $SCRIPT_DIR/.bash_profile.local ]; then
  source $SCRIPT_DIR/.bash_profile.local
fi

# alias
alias v=nvim


