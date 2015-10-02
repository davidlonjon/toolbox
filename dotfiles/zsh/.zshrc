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
# ZSH_THEME="lukerandall"
ZSH_THEME="risto"

# in Vagrant
#ZSH_THEME="amuse"

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
  plugins=(git autojump vagrant screen tmux sublime git-extras virtualenvwrapper virtualenv history npm bower python django pip composer cpv docker fabric gem laravel4 mosh rsync sudo wp-cli zsh_reload)
elif  [[ $OSTYPE == 'darwin' ]]; then
  plugins=(git OSX autojump vagrant screen tmux sublime git-extras brew virtualenvwrapper virtualenv history npm bower python django pip composer copydir copyfile cpv docker fabric gem laravel4 mosh rsync sudo wp-cli zsh_reload brew brew-cask)
fi

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# ALIASES
# -------------------------------------------------------------------
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-common" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-common
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-darwin" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-darwin
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux-services" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux-services
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-git" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-git
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-project" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-project
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-local" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-local


# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-common" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-common
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-common-path-helpers" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-common-path-helpers
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-darwin" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-darwin
[ -f "$HOME/toolbox/dotfiles/zsh/functions/.functions-linux" ] && source $HOME/toolbox/dotfiles/zsh/functions/.functions-linux


# -------------------------------------------------------------------
# PATH
# -------------------------------------------------------------------
if [[ $OSTYPE == 'linux' ]]; then
  export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/var/lib/gems/1.8/bin

  if [[ -d "/usr/local/aws/ec2" ]]; then
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
  fi

  export NODE_PATH=/usr/lib/node_modules

elif  [[ $OSTYPE == 'darwin' ]]; then
  export PATH=$PATH:/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin:/opt/local/binfi
  export PATH=/usr/local/sbin:$PATH
  export PATH=/usr/local/phpcs/scripts:$PATH
  export PATH=$PATH:/Users/davidlonjon/projects/xwp/news-quickstart-20150521/vip-quickstart-config
  export MANPATH="/opt/local/share/man:$MANPATH"
  # export DYLD_LIBRARY_PATH="$HOME/source/boost_install/lib:${DYLD_LIBRARY_PATH}"

  export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

  # Needed for Cairo which in turns is needed by css-sprite npm module
  export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig
fi

if [[ -e "/usr/local/bin/virtualenvwrapper.sh" ]]; then
  # virtualenvwrapper setup
  export WORKON_HOME=~/.virtualenvs
  # http://virtualenvwrapper.readthedocs.org/en/latest/tips.html
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  source /usr/local/bin/virtualenvwrapper.sh
fi

if [[ -d "$HOME/.rvm/bin" ]]; then
  export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi
# export PATH=$PATH:/opt/vagrant/bin

# Set extra path
[ -d "$HOME/toolbox/scripts" ] && export PATH=$PATH:$HOME/toolbox/scripts
[ -d "$HOME/toolbox/bin" ] && export PATH=$PATH:$HOME/toolbox/bin

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


# -------------------------------------------------------------------
# LINUX SPECIFIC
# -------------------------------------------------------------------
if [[ $OSTYPE == 'linux' ]]; then
fi

# -------------------------------------------------------------------
# MISC
# -------------------------------------------------------------------
# teamocil autocompletion
compctl -g '~/.teamocil/*(:t:r)' teamocil

# This is at the end to avoid messing up the color highlighting
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

# Fix a problem with slow prompt related to git.
# Taken from https://gist.github.com/msabramo/2355834
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Taken from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/mosh/mosh.plugin.zsh
# Allow SSH tab completion for mosh hostnames
compdef mosh=ssh

# https://news.ycombinator.com/item?id=3535600
# if there are no matches for globs, leave them alone and execute the command
setopt no_nomatch

# I am disabling this as it seems to be causing problem with ssh agent forwarding
# if [[ $OSTYPE == 'linux' ]]; then
#     # Run ssh-agent on login
#     # http://stackoverflow.com/questions/18880024/start-ssh-agent-on-login
#     SSH_ENV="$HOME/.ssh/environment"

#     function start_agent {
#         echo "Initialising new SSH agent..."
#         /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#         echo succeeded
#         chmod 600 "${SSH_ENV}"
#         . "${SSH_ENV}" > /dev/null
#         /usr/bin/ssh-add;
#     }

#     # Source SSH settings, if applicable

#     if [ -f "${SSH_ENV}" ]; then
#         . "${SSH_ENV}" > /dev/null
#         #ps ${SSH_AGENT_PID} doesn't work under cywgin
#         ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#             start_agent;
#         }
#     else
#         start_agent;
#     fi
# fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"
