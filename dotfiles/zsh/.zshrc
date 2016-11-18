# ----------------------------------------------------------------------------------------------------
#
# @file         .zshrc
# @description  Configuration file for zsh
# @author       David Lonjon
# @version      20161114
#
# ----------------------------------------------------------------------------------------------------

# Get the OS
OSTYPE=$( uname | tr '[:upper:]' '[:lower:]')

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/toolbox/oh-my-zsh/custom

# Set oh-my-zsh theme & plugins
if [[ $OSTYPE == 'darwin' ]]; then
  # ZSH_THEME="pure"
  ZSH_THEME="robbyrussell"
  plugins=(git autojump wp-cli virtualenvwrapper virtualenv git-extras history npm bower python django pip composer cpv docker zsh_reload brew brew-cask)
elif [[ $OSTYPE == 'linux' ]]; then
  ZSH_THEME="robbyrussell"
  plugins=(git autojump wp-cli virtualenvwrapper virtualenv git-extras history npm bower python django pip composer cpv docker zsh_reload)
fi

# Boostrap oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set paths
source $HOME/toolbox/dotfiles/zsh/paths/.paths-common
source $HOME/toolbox/dotfiles/zsh/paths/.paths-projects
[ -f "$HOME/toolbox/dotfiles/zsh/paths/.paths-local" ] && source $HOME/toolbox/dotfiles/zsh/paths/.paths-local

# Set aliases
source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-common
source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-common-vagrant
source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-git
source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-projects
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-local" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-local

# Set functions
source $HOME/toolbox/dotfiles/zsh/functions/.functions-common
source $HOME/toolbox/dotfiles/zsh/functions/.functions-common-path-helpers
source $HOME/toolbox/dotfiles/zsh/functions/.functions-projects
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-local" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-local

# Set key bindings
source $HOME/toolbox/dotfiles/zsh/.keys-binding

# Set completion
source $HOME/toolbox/dotfiles/zsh/.completion

# -------------------------------------------------------------------
# OS SPECIFIC SETTINGS
# -------------------------------------------------------------------
if [[ $OSTYPE == 'darwin' ]]; then

  # Set Editor
  export EDITOR='subl'

  # Set Paths
  source $HOME/toolbox/dotfiles/zsh/paths/.paths-darwin

  # Set aliases
  source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-darwin

  # Set functions
  source $HOME/toolbox/dotfiles/zsh/functions/.functions-darwin

  # Activate addons
  source $HOME/toolbox/dotfiles/zsh/addons/.addons-darwin

elif [[ $OSTYPE == 'linux' ]]; then

  # Set Editor
  export EDITOR="vim"
  export VISUAL='vim'

  # Set Paths
  source $HOME/toolbox/dotfiles/zsh/paths/.paths-linux

  # Set aliases
  source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux
  source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux-services

  # Set functions
  source $HOME/toolbox/dotfiles/zsh/functions/.functions-linux
fi

# -------------------------------------------------------------------
# GENERAL OPTIONS
# -------------------------------------------------------------------

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

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
# setopt NOCLOBBER

# set -o vi
# export TERM=screen-256color       # for a tmux -2 session (also for screen)

# https://news.ycombinator.com/item?id=3535600
# if there are no matches for globs, leave them alone and execute the command
setopt no_nomatch

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

# set -o vi
export TERM=screen-256color       # for a tmux -2 session (also for screen)

# zsh-syntax-highlighting (see https://github.com/zsh-users/zsh-syntax-highlighting)
source $HOME/toolbox/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
