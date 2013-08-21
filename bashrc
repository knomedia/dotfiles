#PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/share/npm/bin

source ~/.profile

PS1='\[$(tput setaf 6)\][\W]\[$(tput sgr0)\]\[$(tput setaf 2)\]$(__git_ps1 "[git:%s]")\[$(tput sgr0)\]\[$(tput setaf 6)\]$ \[$(tput sgr0)\]'
PS2='\[$(tput setaf 6)\]> \[$(tput sgr0)\]'
#export EDITOR="/Applications/Sublime Text 2.app/Contents/MacOS/Sublime Text 2"
export EDITOR=vim
function server() {
  local port="${1:-8080}"
    open "http://localhost:${port}/" && python -m SimpleHTTPServer "$port"
}
function find_rails() {
  ps auxw | grep rails
}
function kill_help() {
  echo "kill -9 proc_id"
}
[[ -f ~/.autojump/etc/profile.d/autojump.bash ]] && source ~/.autojump/etc/profile.d/autojump.bash

alias ls="ls -G"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"
alias rc="rails console"

alias be="bundle exec"
alias readme="hubdown README.md -w | browser"

PATH=$PATH:/usr/local/rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
alias ctags='/usr/local/bin/ctags'

# use vi key mappings in bash
set keymap vi
set -o vi

# cd into whatever is the forfront Finder window
cdf(){
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# GREP OPTIONS
alias grep='grep --color -irn --exclude-dir={tmp,log}'
