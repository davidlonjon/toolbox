## ----------------------------------------------------------------------------------------------------
##
## @file         .zshrc
## @description  Configuration file for zsh
## @author       David Lonjon
## @version      20120124
##
## ----------------------------------------------------------------------------------------------------

## Get the OS
OSTYPE=$( uname | tr '[:upper:]' '[:lower:]')

## Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

## Set name of the theme to load.
## Look in ~/.oh-my-zsh/themes/
## Optionally, if you set this to "random", it'll load a random theme each
## time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

## Set to this to use case-sensitive completion
#CASE_SENSITIVE="true"

## Comment this out to disable weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

## Uncomment following line if you want to disable colors in ls
#DISABLE_LS_COLORS="true"

## Uncomment following line if you want to disable autosetting terminal title.
#DISABLE_AUTO_TITLE="true"

## Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
if [[ $OSTYPE == 'linux' ]]; then
  plugins=(git autojump vagrant screen gem tmux tmuxinator sublime git-extras)
elif  [[ $OSTYPE == 'darwin' ]]; then
  plugins=(git OSX vagrant screen gem tmux tmuxinator sublime git-extras)
fi

source $ZSH/oh-my-zsh.sh

## -------------------------------------------------------------------
## ALIASES
## -------------------------------------------------------------------

[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-common" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-common
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-darwin" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-darwin
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-linux
[ -f "$HOME/toolbox/dotfiles/zsh/aliases/.aliases-git" ] && source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-git


#. $HOME/.environment_variables-${OS}

## -------------------------------------------------------------------
## PATH
## -------------------------------------------------------------------

if [[ $OSTYPE == 'linux' ]]; then
  export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/var/lib/gems/1.8/bin
  ## AMAZON AWS TOOL PATH AND VARIABLE DEFINITION
  ## This assumes that Java > 1.6 is installed
  ## Also that the AWS tool are installed in /usr/local/aws
  ## and that the credentials are set in $HOME/.aws-default
  export JAVA_HOME=/usr
  export EC2_HOME=/usr/local/aws/ec2
  export PATH=$PATH:$EC2_HOME/bin
  export AWS_CREDENTIAL_FILE=$HOME/.aws-default/aws-credential-file.txt
  ## Example taken from https://gist.github.com/4177779
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

## -------------------------------------------------------------------
## PROMPT
## -------------------------------------------------------------------

[ -f "$HOME/toolbox/dotfiles/zsh/.prompt" ] && source $HOME/toolbox/dotfiles/zsh/.prompt

## -------------------------------------------------------------------
## GENERAL OPTIONS
## -------------------------------------------------------------------

## Set less options
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

## Set Vim as the default editor
export EDITOR="vim"

## Say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

## Prompts for confirmation after 'rm *' etc
## Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

## Background processes aren't killed on exit of shell
setopt AUTO_CONTINUE

## Disable beeps
unsetopt beep

## Extended globbing
setopt extendedglob

## Remove RPS1 after <enter>
setopt transient_rprompt

## Watch for login/logout
watch=all

## Zsh settings for history
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

## Don’t write over existing files with >, use >! instead
setopt NOCLOBBER


## -------------------------------------------------------------------
## FUNCTIONS
## -------------------------------------------------------------------

## cd + ls  ... and dont forget to add that to completion
cdl() { cd $@; ls -lha }
compdef _cd cdl

## Quick find
qf() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}

## Set Term title
precmd () {
  [[ -t 1 ]] || return
  case $TERM in
    *xterm*|rxvt|urxvt|rxvt-256color|rxvt-unicode|(dt|k|E|a)term) print -Pn "\e]2;%n@%m:%~\a"
    ;;
    screen*) print -Pn "\e\"%n@%m:%~\e\134"
  esac
}

## Allow eaiser navigation
## e.g., up -> go up 1 directory
## up 4 -> go up 4 directories
up()
{
    dir=""
    if [[ $1 =~ ^[0-9]+$ ]]; then
        x=0
        while [ $x -lt ${1:-1} ]; do
            dir=${dir}../
            x=$(($x+1))
        done
    else
         dir=..
    fi
    cd "$dir";
}

function mkdircd () {
  mkdir -p "$@" && eval cd "\"\$$#\"";
}


## -------------------------------------------------------------------
## MAC SPECIFIC FUNCTIONS
## -------------------------------------------------------------------

if [[ $OSTYPE == 'darwin' ]]; then

  ## Turn hidden files on/off in Finder
  function hiddenOn() { defaults write com.apple.Finder AppleShowAllFiles YES ; }
  function hiddenOff() { defaults write com.apple.Finder AppleShowAllFiles NO ; }

  ## myIP address
  function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
    ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  }

  ## Nice mount (http://catonmat.net/blog/another-ten-one-liners-from-commandlingfu-explained)
  ## Displays mounted drive information in a nicely formatted manner
  function nicemount() { (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1') | column -t ; }

  function chromecanary () {
    /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary -disable-prompt-on-repost 2>&1 &
  # /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $* 2>&1 &
  }
fi

## -------------------------------------------------------------------
## KEYS BINDING
## -------------------------------------------------------------------

bindkey '\e[A'  up-line-or-history
bindkey '\e[B'  down-line-or-history
bindkey '\e[C'  forward-char
bindkey '\e[D'  backward-char
bindkey '\eOA'  up-line-or-history
bindkey '\eOB'  down-line-or-history
bindkey '\eOC'  forward-char
bindkey '\eOD'  backward-char

bindkey "^?" backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand


## -------------------------------------------------------------------
## COMPLETION
## -------------------------------------------------------------------

LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:';
export LS_COLORS


## The big tab completion game:
## Completion, color
#zstyle ':completion:*' completer _complete
autoload -U compinit
compinit
ZLS_COLORS=$LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


zstyle ':completion:*' list-colors no=00 fi=00 di=01\;34 pi=33 so=01\;35 bd=00\;35 cd=00\;34 or=00\;41 mi=00\;45 ex=01\;32

### Enable advanced completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

### General completion technique
zstyle ':completion:*' completer _complete _correct _approximate _prefix
#zstyle ':completion:*' completer _complete _prefix
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:predict:*' completer _complete

## Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

## Expand partial paths
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'
## Don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

## Separate matches into groups
zstyle ':completion:*:matches' group 'yes'

## Describe each match group.
zstyle ':completion:*:descriptions' format "%B---- %d%b"

## Messages/warnings format
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
zstyle ':completion:*:warnings' format '%B%U---- no match for: %d%u%b'

## Describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

## Kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

## Menu for kill
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

## Kill menu extension!
zstyle ':completion:*:processes' command 'ps --forest -U $(whoami) | sed "/ps/d"'
#zstyle ':completion:*:processes' command 'ps -U $(whoami) | sed "/ps/d"'

#zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes' insert-ids menu yes select
## Case insensitivity, partial matching, substitution
zstyle ':completion:*' matcher-list 'm:{A-Z}={a-z}' 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'

## Remove uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
   adm alias apache at bin cron cyrus daemon ftp games gdm guest \
   haldaemon halt mail man messagebus mysql named news nobody nut \
   lp operator portage postfix postgres postmaster qmaild qmaill \
   qmailp qmailq qmailr qmails shutdown smmsp squid sshd sync \
   uucp vpopmail xfs

zstyle ':completion:*' hosts $ssh_hosts

zstyle ':completion:*:my-accounts' users-hosts $my_accounts
zstyle ':completion:*:other-accounts' users-hosts $other_accounts



## -------------------------------------------------------------------
## Add host/domain specific zshrc
## -------------------------------------------------------------------
#to investigate further

#if [ -f $HOME/.zshrc-$HOST ]
#then
#    . $HOME/.zshrc-$HOST
#fi

#if [ -f $HOME/.zshrc-$(hostname -f) ]
#then
#    . $HOME/.zshrc-$(hostname -f)
#fi

#if [ -f $HOME/.zshrc-$(hostname -d) ]
#then
#    . $HOME/.zshrc-$(hostname -d)
#fi

## -------------------------------------------------------------------
## LINUX SPECIFIC
## -------------------------------------------------------------------
if [[ $OSTYPE == 'linux' ]]; then
  ## Archey
  archey
fi

## -------------------------------------------------------------------
## MAC SPECIFIC
## -------------------------------------------------------------------
if [[ $OSTYPE == 'darwin' ]]; then
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

# Path for Vagrant
if [[ $OSTYPE == 'darwin' ]]; then
  PATH=$PATH:/opt/vagrant/bin
fi

## -------------------------------------------------------------------
## MISC
## -------------------------------------------------------------------

# This is at the end to avoid messing up the color highligting
# Taken from https://github.com/matijs/dotfiles/blob/master/.bash_profile
# remove duplicates from the path
export PATH=`awk -F: '{for(i=1;i<=NF;i++){if(!($i in a)){a[$i];printf s$i;s=":"}}}'<<<$PATH`;

