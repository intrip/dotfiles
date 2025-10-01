# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=it_IT.UTF-8

# EDITOR
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
 else
  export EDITOR='/usr/local/bin/nvim'
fi
# vim mode with jk so that can get to prev command with jkk
bindkey jk vi-cmd-mode

# GIT
# auto push to all remotes branches
git_push_all() {
  for i in $(git remote -v | cut -f1 | sort -u)
  do
      eval "git push $i $1"
  done
}
alias gpa=git_push_all
# pull current branch
alias glh='git pull origin $(git rev-parse --abbrev-ref HEAD)'
# git fetch origin
function git_fetch_origin() {
  git fetch origin $1:$1
}
alias gfo=git_fetch_origin
# push current branch
alias gph='git push origin HEAD'
# push current branch in fork
alias gphf='git push fork $(gbp)'
# Print current branch name
alias gbp='git rev-parse --abbrev-ref HEAD | tr -d "\n"'
# Copy current branch name
alias gbc='gbp | pbcopy'
# open with vi changes files
alias vigst='gst -s | grep -v "??" | awk '"'"'{ print $2}'"'"' | xargs -o nvim'

# Rubocop on last commit files. Ignores `db/schema.rb` as Rubocop normally does.
alias rubocop-head='git diff-tree --no-commit-id --name-only -r HEAD | grep -v "db/schema.rb" | xargs -o bundle exec rubocop -a'
# Rubocop on all the changed files between the current branch and master. Ignores `db/schema.rb` as Rubocop normally does.
alias rubocop-master='git diff --name-only master | grep -v "db/schema.rb" | xargs -o bundle exec rubocop -a'

# RUBY
alias b=bundle

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# to build icu4d
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"

# Serve HTML page with WebRick
alias served="ruby -r webrick -e \"s = WEBrick::HTTPServer.new(:Port => 9090, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start\""

# MYSQL
MYSQL=/usr/local/Cellar/mysql/5.7.19/bin
export PATH=$PATH:$MYSQL

# Homebrew
export PATH=/usr/local/bin:$PATH
# Disable analytics
export HOMEBREW_NO_ANALYTICS=1

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PIP binary paths
export PATH=/Users/jbeschi/Library/Python/3.7/bin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Dotfiles bin path
export PATH=$PATH:~/.bin

# Local .bin/ folder for path
export PATH=$PATH:./bin

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Used for docker-compose and SSH key
export ssh_prv_key="$(cat ~/.ssh/id_rsa)"
export ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)"

# DNS flush
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# Fzf
# Colors
local base03="234"
local base02="235"
local base01="240"
local base00="241"
local base0="244"
local base1="245"
local base2="254"
local base3="230"
local yellow="136"
local orange="166"
local red="160"
local magenta="125"
local violet="61"
local blue="33"
local cyan="37"
local green="64"

# Colors
# Solarized Dark color scheme for fzf
export FZF_DEFAULT_OPTS="
--color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
--color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
"
# Solarized Light color scheme for fzf
#export FZF_DEFAULT_OPTS="
#  --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
#  --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
#"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Bat
export BAT_THEME="Solarized (dark)"


# GOLANG

# load gvm
[[ -s "/Users/jbeschi/.gvm/scripts/gvm" ]] && source "/Users/jbeschi/.gvm/scripts/gvm"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

export PATH="/usr/local/opt/libiconv/bin:$PATH"
