# Inform what desktop we use
export XDG_CURRENT_DESKTOP=kde

# Path to the oh-my-zsh installation.
export ZSH=/home/newt/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

####################################################################################
# DISABLED CONFIGURATIONS
####################################################################################

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Export the path of man pages
# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

####################################################################################
# ENABLED CONFIGURATIONS
####################################################################################

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-z git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Key configuration for zsh autosuggest
bindkey '^ ' autosuggest-execute
bindkey '^[x' autosuggest-execute

####################################################################################
# EXPORTS
####################################################################################

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# ssh key location
export SSH_KEY_PATH="~/.ssh/id_rsa"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

####################################################################################
# ALIASES
####################################################################################

# Alias for ls command
alias ll='ls -lh --color=always'
alias lla='ls -lah --color=always'
alias la='ls -A --color=always'
alias lk='ls -1F --color=always'
alias l='ls -CF --color=always'
alias ls='ls --color=always'

# More verbose and clever rm, cp and mv
alias rm='rm -vR'
alias mv='mv -vi'
alias cp='cp -ir'

# Retard correcter
alias cim='vim'
alias vi='vim -p'

# Lazy shortcuts
alias egrep='egrep --color=auto'
alias cl='clear'
alias o.='open .'
alias x='exit'
alias open='xdg-open'
alias desk='cd ~/Desktop'
alias dl='cd ~/Downloads/'
alias gdb='gdb -q'

alias sls='screen -ls'
alias sr='screen -r'

# Alias pour rsync
alias rsync='rsync -avzhP '

# Alias docker
alias dcu='docker-compose up'
alias dcd='docker-compose down'

# Alias for process grabbing
alias pg='ps aux | grep'

####################################################################################
# SCREENFETCH
####################################################################################
screenfetch

####################################################################################
# SOURCE FILES
####################################################################################
source /home/newt/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Style for zsh autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
