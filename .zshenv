
export CLICOLOR=1
export LESS=' -R '

# Golang
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec

# My own compiled things:Golang:brew things
EXTRA_PATHS="$HOME/.apps/bin:$HOME/.cargo/bin:$GOPATH/bin:$GOROOT/bin:/usr/local/bin"
export PATH="$EXTRA_PATHS:$PATH"
