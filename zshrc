# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="cloud-custom"
#ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"

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
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git rails bundler)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=it_IT.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='/usr/local/bin/vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# vim mode with jk so that can get to prev command with jkk

bindkey jk vi-cmd-mode

###
# GIT
###

# push current branch
alias gph='git push origin HEAD'
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
# Copy current branch name
alias gbc='git rev-parse --abbrev-ref HEAD | pbcopy'
# git fetch origin
function git_fetch_origin() {
  git fetch origin $1:$1
}
alias gfo=git_fetch_origin

# Gitlab
alias gl-install='spring stop && bundle && rdm && yarn install'

# Rubocop on last commit files. Ignores `db/schema.rb` as Rubocop normally does.
alias rubocop-head='git diff-tree --no-commit-id --name-only -r HEAD | grep -v "db/schema.rb" | xargs -o bundle exec rubocop -a'

###
# RUBY
###

alias b=bundle

###
# RVM
###

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

###
# SPRING
###

export ENABLE_SPRING='1'

###
# GOLANG
####

export GOPATH=$HOME/gocode:$HOME/gitlab-development-kit/gitaly
export PATH="$HOME/gocode/bin:$PATH"

###
# Vim and Tmux intergration
###

alias tmux="TERM=screen-256color-bce tmux"

#####
# MYSQL
#####

#MYSQL=/usr/local/Cellar/mysql@5.5/5.5.57/bin
MYSQL=/usr/local/Cellar/mysql/5.7.19/bin
export PATH=$PATH:$MYSQL

###
# Homebrew
###

export PATH=/usr/local/bin:$PATH

###
# High sierra forking fix: https://github.com/puma/puma/issues/1421
###

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Dotfiles bin path
export PATH=$PATH:~/.bin

# Local .bin/ folder for path
export PATH=$PATH:./bin

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# iubenda development-kit
set -a
source ~/iubendacode/iubenda_utils/docker_utils.sh
set +a

# Fzf
_gen_fzf_default_opts() {

local color00='#002b36'
local color01='#073642'
local color02='#586e75'
local color03='#657b83'
local color04='#839496'
local color05='#93a1a1'
local color06='#eee8d5'
local color07='#fdf6e3'
local color08='#dc322f'
local color09='#cb4b16'
local color0A='#b58900'
local color0B='#859900'
local color0C='#2aa198'
local color0D='#268bd2'
local color0E='#6c71c4'
local color0F='#d33682'

export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
}

_gen_fzf_default_opts

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
