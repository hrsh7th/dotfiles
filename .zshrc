[[ ! -f ~/powerlevel10k/powerlevel10k.zsh-theme ]] || source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# common.
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export GIT_EDITOR=$EDITOR

# Local bin
export PATH="$HOME/Local/bin:$PATH"

# redis
export PATH="/usr/local/Cellar/redis/5.0.7/bin:$PATH"

# php (Append path for before of brew to use php7.3 isntead of php7.4)
export PATH="/usr/local/Cellar/php@7.2/7.2.32/bin:$PATH"

# ruby
export PATH="/usr/local/Cellar/ruby/2.6.5/bin:$PATH"

# rubygems
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

# pytohn
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# go
export GO111MODULE=on
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# nvim.
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# nvm.
. "$HOME/.nvm/nvm.sh" --no-use
nvm use default > /dev/null

# rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# brew.
export PATH="$PATH:/usr/local/bin"

# alias
alias v=nvim
alias rg='rg -i'

bindkey "^?" backward-delete-char

