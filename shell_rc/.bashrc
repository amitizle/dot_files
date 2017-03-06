
#cat "/Users/amit.goldberg/.motd/$(ls /Users/amit.goldberg/.motd/ | gshuf -n 1)"

#===========
#= Aliases =
#===========

# Multimedia
alias vlc="open -na /Applications/VLC.app/Contents/MacOS/VLC"
alias shrug='echo -n "¯\_(ツ)_/¯" | pbcopy'

# Development
alias sqlite='sqlite3 -column -header'
alias vim='vim -p'
alias vi='vim -p'
alias diff='colordiff'

# *nix shit
alias screen='TERM=xterm-256color screen'
alias bc='bc -l'
alias c='xclip -selection clipboard'
alias l='ls -lthFAr'
alias mkdir='mkdir -pv'
alias ll='ls -alF'
alias la='ls -A'
alias grep='grep --color'
alias info='info --vi-keys'
alias sl='ls'

# Docker
alias docker-cleanup-all='docker stop $(docker ps -q); docker rm -f $(docker ps -qa); docker rmi -f $(docker images -qa)'
alias docker-cleanup-containers='docker stop $(docker ps -q); docker rm -f $(docker ps -qa)'
alias docker-ps='docker ps -a --format "{{.Names}} ({{.Image}}): {{.Status}} (Running for {{.RunningFor}}, Created At: {{.CreatedAt}})"'
alias docker-run-command='docker inspect  --format "{{.Name}} {{.Config.Cmd}}" $(docker ps -a -q)'
alias docker-stop-all='docker stop $(docker ps -q)'
alias docker-ips='docker inspect -f "{{.Name}} - {{.NetworkSettings.IPAddress }}" $(docker ps -aq)'

# Erlang
alias erl_observer='erl -sname observer -run observer -detached'

# Vagrant functions

function vagrant-destroy-all(){
  CURR_PATH=`pwd`
  vagrant global-status --prune # Refresh vagrant global cache on ~/.vagrant.d
  for machine_path in $(vagrant global-status | grep virtualbox | awk '{ print $5 }'); do
    echo "destroying machine in $machine_path"
    cd $machine_path
    vagrant destroy -f
  done
  cd $CURR_PATH
}

function vagrant-halt-all(){
  CURR_PATH=`pwd`
  vagrant global-status --prune # Refresh vagrant global cache on ~/.vagrant.d
  for machine_path in $(vagrant global-status | grep virtualbox | awk '{ print $5 }'); do
    echo "halting machine in $machine_path"
    cd $machine_path
    vagrant halt -f
  done
  cd $CURR_PATH
}

#==================
#= *nix functions =
#==================

function decode_base64(){
  echo "$1" | base64 --decode ;
}

function ff(){ find . -type f -iname '*'"$*"'*' -ls ; }

function create_file(){
  dd if=/dev/zero of="$1"  bs=1M  count="$2" ;
}

function ssh_connections_linux(){
  sudo netstat -atp | grep 'ESTABLISHED.*ssh '
}

function ssh_connections_osx(){
  lsof -i tcp | grep "^ssh"
}

function pull_all_git(){
  for dir in $(find . -type d -depth 1); do
    echo "running git pull in $dir"
    cd $dir
    git pull
    cd ..
  done
}

function times(){
  for i in $(seq $1); do ${*:2}; done;
}

function beauty_title(){
  ruby -e 'args = ARGV.join(" "); sep = ("=" * (args.size + 4)); puts sep + "
= " + args + " =
" + sep' ${*:1}
}

function random_string(){
  date +%s | shasum -a 256 | base64 | head -c 32 ; echo
}

#===================
#= Media functions =
#===================

function pdfjoin(){
  OUTPUT_FILENAME="$(random_string).pdf";
  /System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py -o $OUTPUT_FILENAME ${*:1};
  echo "Merged to $OUTPUT_FILENAME"
}

wttr()
{
  curl -H "Accept-Language: en" wttr.in/"${1:-Dublin}"
}

#=================
#= Env variables =
#=================

export LESS=' -R '
export EDITOR='vim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export PATH="/usr/local/bin:$PATH"

# Golang
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# Ma' own thangs
export PATH="$PATH:$HOME/.apps/bin"
# export PATH="/usr/local/bin:$PATH"


#=============================
#= Some more tricks and shit =
#=============================

# Stop damn autocomplete for hidden files
bind 'set match-hidden-files off'

# Start upon terminal:
[[ -z "$TMUX" ]] && tmux

source ~/.bash_prompt
for f in ~/completions/*; do source $f; done;
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
