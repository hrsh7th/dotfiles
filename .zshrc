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
export PATH="/usr/local/Cellar/php@7.2/7.2.34_2/bin:$PATH"

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

# java
export JAVA_HOME=/usr/local/opt/openjdk@11
export JAR="$HOME/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar"

# sumneko
export PATH="$HOME/Develop/Repos/lua-language-server/bin/macOS:$PATH"

# nvim.
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export NVIM_PYTHON_LOG_FILE="/tmp/.log"
export NVIM_PYTHON_LOG_LEVEL=DEBUG
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# nvm.
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# brew.
export PATH="$PATH:/usr/local/bin"

# deno
export DENO_INSTALL="/Users/hiroshi_shichita/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# alias
alias v=nvim
alias rg='rg -i'
alias ls='ls -al'

# config
bindkey -e

