# ----------------------------------------------------------------------------------------------------
#
# @file         .zshrc
# @description  Configuration file for zsh
# @author       David Lonjon
# @version      20120124
#
# ----------------------------------------------------------------------------------------------------

# Get the OS
OSTYPE=$( uname | tr '[:upper:]' '[:lower:]')

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/toolbox/oh-my-zsh/custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="lukerandall"
ZSH_THEME="custom_agnoster"
DEFAULT_USER="$USER"

# Set to this to use case-sensitive completion
#CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
#DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
if [[ $OSTYPE == 'linux' ]]; then
  # plugins=(git autojump vagrant screen tmux sublime git-extras virtualenvwrapper virtualenv history npm bower python django pip composer cpv docker fabric gem laravel4 mosh rsync sudo wp-cli zsh_reload)
  plugins=(git autojump)
elif  [[ $OSTYPE == 'darwin' ]]; then
  # plugins=(git OSX autojump vagrant screen tmux sublime git-extras brew virtualenvwrapper virtualenv history npm bower python django pip composer copydir copyfile cpv docker fabric gem laravel4 mosh rsync sudo wp-cli zsh_reload brew brew-cask)
  plugins=(git autojump)
fi

source $ZSH/oh-my-zsh.sh

# Setup dir colors for solarized theme
# See https://github.com/seebi/dircolors-solarized#installation
# See http://qiita.com/yoshi-naoyuki/items/68f65032dde46edf89fa
if [[ $OSTYPE == 'darwin' ]]; then
  eval "$(gdircolors ~/.dir_colors)"
  alias ls='gls --color=auto'

  # Tell ls to be colourful
  export CLICOLOR=1
  export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
  # Tell grep to highlight matches
  export GREP_OPTIONS='--color=auto'
fi


# -------------------------------------------------------------------
# ALIASES
# -------------------------------------------------------------------
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-common" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-common
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-common-vagrant" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-common-vagrant
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-darwin" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-darwin
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux-services" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux-services
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-git" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-git
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-projects" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-projects
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-local" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-local


# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-common" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-common
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-common-path-helpers" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-common-path-helpers
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-darwin" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-darwin
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-linux" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-linux
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-projects" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-projects
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-local" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-local


# -------------------------------------------------------------------
# PATHS
# -------------------------------------------------------------------
[ -f "$HOME/toolbox/dotfiles/zsh/paths/.paths-common" ] && source $HOME/toolbox/dotfiles/zsh/paths/.paths-common
[ -f "$HOME/toolbox/dotfiles/zsh/paths/.paths-darwin" ] && source $HOME/toolbox/dotfiles/zsh/paths/.paths-darwin
[ -f "$HOME/toolbox/dotfiles/zsh/paths/.paths-linux" ] && source $HOME/toolbox/dotfiles/zsh/paths/.paths-linux
[ -f "$HOME/toolbox/dotfiles/zsh/paths/.paths-projects" ] && source $HOME/toolbox/dotfiles/zsh/paths/.paths-projects


# -------------------------------------------------------------------
# ADDONS
# -------------------------------------------------------------------
[ -f "$HOME/toolbox/dotfiles/zsh/addons/.addons-darwin" ] && source $HOME/toolbox/dotfiles/zsh/addons/.addons-darwin



# Symaps related environment variable
export SYMAPS_AWS_PEM_FILE=/Users/davidlonjon/.ssh/tokyo.pem

# set -o vi

# -------------------------------------------------------------------
# SET EDITOR
# -------------------------------------------------------------------
if [[ $OSTYPE == 'darwin' ]]; then
  export EDITOR='subl'
fi

if [[ $OSTYPE == 'linux' ]]; then
  # https://github.com/skwp/dotfiles/blob/master/zsh/vi-mode.zsh
  # Set Vim as the default editor
  # set -o vi # Disabling as causing an error in ssh session for some reasons
  export EDITOR="vim"
  export VISUAL='vim'
fi

# -------------------------------------------------------------------
# PROMPT
# -------------------------------------------------------------------
# Disabling prompt and use a theme instead
# [ -f "$HOME/toolbox/dotfiles/zsh/.prompt" ] && source $HOME/toolbox/dotfiles/zsh/.prompt

# -------------------------------------------------------------------
# GENERAL OPTIONS
# -------------------------------------------------------------------
# Set less options
if [[ -x $(which less) ]]
then
    export PAGER="less"
    export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"
    if [[ -x $(which lesspipe.sh) ]]
    then
  LESSOPEN="| lesspipe.sh %s"
  export LESSOPEN
    fi
fi

# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

# Background processes aren't killed on exit of shell
setopt AUTO_CONTINUE

# Disable beeps
unsetopt beep

# Extended globbing
setopt extendedglob

# Remove RPS1 after <enter>
setopt transient_rprompt

# Watch for login/logout
watch=all

# Zsh settings for history
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Allow to browse history from up and down arrow keys
# Taken from https://coderwall.com/p/jpj_6q
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER

# -------------------------------------------------------------------
# KEYS BINDING
# -------------------------------------------------------------------
[ -f "$HOME/toolbox/dotfiles/zsh/.keys_binding" ] && source $HOME/toolbox/dotfiles/zsh/.keys_binding


# -------------------------------------------------------------------
# COMPLETION
# -------------------------------------------------------------------
[ -f "$HOME/toolbox/dotfiles/zsh/.completion" ] && source $HOME/toolbox/dotfiles/zsh/.completion

# This is at the end to avoid messing up the color highlighting
# Taken from https://github.com/matijs/dotfiles/blob/master/.bash_profile
# remove duplicates from the path
export PATH=`awk -F: '{for(i=1;i<=NF;i++){if(!($i in a)){a[$i];printf s$i;s=":"}}}'<<<$PATH`;

# Taken from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/mosh/mosh.plugin.zsh
# Allow SSH tab completion for mosh hostnames
compdef mosh=ssh

# https://news.ycombinator.com/item?id=3535600
# if there are no matches for globs, leave them alone and execute the command
setopt no_nomatch
