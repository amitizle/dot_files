
export CLICOLOR=1
export LESS=' -R '
export EDITOR='vim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Golang
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec

# My own compiled things:Golang:brew things
EXTRA_PATHS="$HOME/.apps/bin:$GOPATH/bin:$GOROOT/bin:/usr/local/bin"
export PATH="$EXTRA_PATHS:$PATH"
