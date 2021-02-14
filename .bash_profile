# script dir.
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# common.
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export GIT_EDITOR=$EDITOR

# Local bin
export PATH="$HOME/Local/bin:$PATH"

# .local/bin
export PATH="$HOME/.local/bin:$PATH"

# redis
export PATH="/usr/local/Cellar/redis/5.0.7/bin:$PATH"

# php (Append path for before of brew to use php7.3 isntead of php7.4)
export PATH="/usr/local/Cellar/php@7.4/7.4.15/bin:$PATH"

# ruby
export PATH="/usr/local/Cellar/ruby/2.6.5/bin:$PATH"

# rubygems
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

# pytohn
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# openjdk
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# Rust
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# go
export GO111MODULE=on
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# llvm
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# nvim.
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export NVIM_PYTHON_LOG_FILE="/tmp/.log"
export NVIM_PYTHON_LOG_LEVEL=DEBUG
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# nvm.
. "$HOME/.nvm/nvm.sh" --no-use
nvm use default > /dev/null

# brew.
export PATH="$PATH:/usr/local/bin"

# local deno
export PATH="$PATH:~/Develop/Repos/deno/target/debug"

# local settings.
if [ -f $SCRIPT_DIR/.bash_profile.local ]; then
  source $SCRIPT_DIR/.bash_profile.local
fi

# alias
alias v=nvim
alias rg='rg -i'

source "$HOME/.cargo/env"
