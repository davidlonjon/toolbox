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

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
#CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
#DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
#DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
if [[ $OSTYPE == 'linux' ]]; then
  plugins=(git autojump vagrant screen tmux tmuxinator sublime git-extras virtualenvwrapper virtualenv)
elif  [[ $OSTYPE == 'darwin' ]]; then
  plugins=(git OSX vagrant screen tmux tmuxinator sublime git-extras brew virtualenvwrapper virtualenv)
fi

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# ALIASES
# -------------------------------------------------------------------

[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-common" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-common
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-darwin" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-darwin
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-git" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-git


# -------------------------------------------------------------------
# PATH
# -------------------------------------------------------------------

if [[ $OSTYPE == 'linux' ]]; then
  export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/var/lib/gems/1.8/bin
  # AMAZON AWS TOOL PATH AND VARIABLE DEFINITION
  # This assumes that Java > 1.6 is installed
  # Also that the AWS tool are installed in /usr/local/aws
  # and that the credentials are set in $HOME/.aws-default
  export JAVA_HOME=/usr
  export EC2_HOME=/usr/local/aws/ec2
  export PATH=$PATH:$EC2_HOME/bin
  export AWS_CREDENTIAL_FILE=$HOME/.aws-default/aws-credential-file.txt
  # Example taken from https://gist.github.com/4177779
  export AWS_ACCESS_KEY=$( awk -F= '/AccessKey/ {print $2}' $AWS_CREDENTIAL_FILE )
  export AWS_SECRET_KEY=$( awk -F= '/SecretKey/ {print $2}' $AWS_CREDENTIAL_FILE )
elif  [[ $OSTYPE == 'darwin' ]]; then
  export PATH=$PATH:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin:/opt/local/binfi
  export MANPATH="/opt/local/share/man:$MANPATH"
fi

# virtualenvwrapper setup
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# set extra path:
# check whether the Haskell binary directory exists and if so add it to the PATH
[ -d "$HOME/toolbox/scripts" ] && export PATH=$PATH:$HOME/toolbox/scripts
[ -d "$HOME/toolbox/bin" ] && export PATH=$PATH:$HOME/toolbox/bin

# -------------------------------------------------------------------
# MAC SPECIFIC
# -------------------------------------------------------------------
if [[ $OSTYPE == 'darwin' ]]; then
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

# Path for Vagrant
if [[ $OSTYPE == 'darwin' ]]; then
  PATH=$PATH:/opt/vagrant/bin
fi

# -------------------------------------------------------------------
# PROMPT
# -------------------------------------------------------------------

[ -f "$HOME/toolbox/dotfiles/zsh/.prompt" ] && source $HOME/toolbox/dotfiles/zsh/.prompt

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

# https://github.com/skwp/dotfiles/blob/master/zsh/vi-mode.zsh
# Set Vim as the default editor
set -o vi
export EDITOR="vim"
export VISUAL='vim'
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

# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER


# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------

[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-common" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-common
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-darwin" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-darwin


# -------------------------------------------------------------------
# KEYS BINDING
# -------------------------------------------------------------------

[ -f "$HOME/toolbox/dotfiles/zsh/.keys_binding" ] && source $HOME/toolbox/dotfiles/zsh/.keys_binding


# -------------------------------------------------------------------
# COMPLETION
# -------------------------------------------------------------------

[ -f "$HOME/toolbox/dotfiles/zsh/.completion" ] && source $HOME/toolbox/dotfiles/zsh/.completion


# -------------------------------------------------------------------
# LINUX SPECIFIC
# -------------------------------------------------------------------
if [[ $OSTYPE == 'linux' ]]; then
  # Archey
  archey
fi

# -------------------------------------------------------------------
# MISC
# -------------------------------------------------------------------


# This is at the end to avoid messing up the color highligting
# Taken from https://github.com/matijs/dotfiles/blob/master/.bash_profile
# remove duplicates from the path
export PATH=`awk -F: '{for(i=1;i<=NF;i++){if(!($i in a)){a[$i];printf s$i;s=":"}}}'<<<$PATH`;

# https://github.com/chrishunt/dot-files/blob/master/.zshrc
# Always work in a tmux session if tmux is installed
# if which tmux 2>&1 >/dev/null; then
#   if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#     tmux attach -t hack || tmux new -s hack; exit
#   fi
# fi

# https://wiki.archlinux.org/index.php/Tmux#Changing_the_configuration_with_tmux_started
# if which tmux 2>&1 >/dev/null; then
#     # if no session is started, start a new session
#     test -z ${TMUX} && tmux

#     # when quitting tmux, try to attach
#     while test -z ${TMUX}; do
#         tmux attach || break
#     done
# fi

