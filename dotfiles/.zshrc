# ----------------------------------------------------------------------------------------------------
#
# @file         .zshrc
# @description  Configuration file for zsh
# @author       David Lonjon
# @version      20120912
#
# ----------------------------------------------------------------------------------------------------

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

# Example aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh/oh-my-zsh.sh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
if [[ $('uname') == 'Linux' ]]; then
  plugins=(git autojump)
elif  [[ $('uname') == 'Darwin' ]]; then
  plugins=(git OSX)
fi

source $ZSH/oh-my-zsh.sh


# -------------------------------------------------------------------
# PATH
# -------------------------------------------------------------------

if [[ $('uname') == 'Linux' ]]; then
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
elif  [[ $('uname') == 'Darwin' ]]; then
  export PATH=/opt/local/bin:/opt/local/sbin:/library/PostgreSQL/9.1/bin:/Users/lucky/.rvm/gems/ruby-1.9.2-p290/bin:/Users/lucky/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/lucky/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/lucky/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin:/opt/local/binfi
fi


if [ -d $HOME/toolbox/scripts ]; then
    PATH=$PATH:$HOME/toolbox/scripts
fi

# -------------------------------------------------------------------
# PROMPT
# -------------------------------------------------------------------

RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
BLACK=$fg[black]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
BLACK_BOLD=$fg_bold[black]
RESET_COLOR=$reset_color

# On a mac with snow leopard, for nicer terminal colours:

# - Install SIMBL: http://www.culater.net/software/SIMBL/SIMBL.php
# - Download'Terminal-Colours': http://bwaht.net/code/TerminalColours.bundle.zip
# - Place that bundle in ~/Library/Application\ Support/SIMBL/Plugins (create that folder if it doesn't exist)
# - Open Terminal preferences. Go to Settings -> Text -> More
# - Change default colours to your liking.
#
# Here are the colours from Textmate's Monokai theme:
#
# Black: 0, 0, 0
# Red: 229, 34, 34
# Green: 166, 227, 45
# Yellow: 252, 149, 30
# Blue: 196, 141, 255
# Magenta: 250, 37, 115
# Cyan: 103, 217, 240
# White: 242, 242, 242

# Thanks to Steve Losh: http://stevelosh.com/blog/2009/03/candy-colored-terminal/

# The prompt

PROMPT='%{$fg[magenta]%}[%c] %{$reset_color%}'

# The right-hand prompt

RPROMPT='${time} %{$fg[magenta]%}$(git_prompt_info) $(git_prompt_short_sha) %{$reset_color%}$(git_prompt_status)%{$reset_color%}'

# Add this at the start of RPROMPT to include rvm info showing ruby-version@gemset-name
# %{$fg[yellow]%}$(~/.rvm/bin/rvm-prompt)%{$reset_color%}

# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

ZSH_THEME_GIT_PROMPT_PREFIX=" ☁  %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ☂" # Ⓓ
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭" # ⓣ
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ☀" # Ⓞ

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✚" # ⓐ ⑃
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ⚡"  # ⓜ ⑁
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖" # ⓧ ⑂
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➜" # ⓡ ⑄
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ♒" # ⓤ ⑊

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"


# More symbols to choose from:
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠
# ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ

# Determine if we are using a gemset.
function rvm_gemset() {
    GEMSET=`rvm gemset list | grep '=>' | cut -b4-`
    if [[ -n $GEMSET ]]; then
        echo "%{$fg[yellow]%}$GEMSET%{$reset_color%}|"
    fi
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Only proceed if there is actually a commit.
        if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
            # Get the last commit.
            last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
            now=`date +%s`
            seconds_since_last_commit=$((now-last_commit))

            # Totals
            MINUTES=$((seconds_since_last_commit / 60))
            HOURS=$((seconds_since_last_commit/3600))

            # Sub-hours and sub-minutes
            DAYS=$((seconds_since_last_commit / 86400))
            SUB_HOURS=$((HOURS % 24))
            SUB_MINUTES=$((MINUTES % 60))

            if [[ -n $(git status -s 2> /dev/null) ]]; then
                if [ "$MINUTES" -gt 30 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
                elif [ "$MINUTES" -gt 10 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
                else
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
                fi
            else
                COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            fi

            if [ "$HOURS" -gt 24 ]; then
                echo "($(rvm_gemset)$COLOR${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m%{$reset_color%}|"
            elif [ "$MINUTES" -gt 60 ]; then
                echo "($(rvm_gemset)$COLOR${HOURS}h${SUB_MINUTES}m%{$reset_color%}|"
            else
                echo "($(rvm_gemset)$COLOR${MINUTES}m%{$reset_color%}|"
            fi
        else
            COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            echo "($(rvm_gemset)$COLOR~|"
        fi
    fi
}

# ALTERNATIVE PROMPT

## Format for git_prompt_info()
#ZSH_THEME_GIT_PROMPT_PREFIX=""
#ZSH_THEME_GIT_PROMPT_SUFFIX=""
#
## Format for parse_git_dirty()
#ZSH_THEME_GIT_PROMPT_DIRTY=" %{$RED%}✗"
#ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GREEN%}✓"
#
## Format for git_prompt_status()
#ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
#ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted"
#ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}renamed"
#ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}modified"
#ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added"
#ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"
#
## Format for git_prompt_ahead()
#ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"
#
## Format for git_prompt_long_sha() and git_prompt_short_sha()
#ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
#ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"
#
## Prompt format
#PROMPT='
#%{$BLACK_BOLD%}%n@%m%{$WHITE%}:%{$BLUE%}%~%u$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%}
#%{$BLUE%}>%{$RESET_COLOR%} '
#RPROMPT='%{$GREEN_BOLD%}$(current_branch)$(git_prompt_short_sha)$(git_prompt_status)%{$RESET_COLOR%}'

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

#Set Vim as the default editor
export EDITOR="vim"

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
# GLOBAL ALIASESi
# Some aliases found from http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
# -------------------------------------------------------------------
# global aliases, dont have to be at the beginning of # a line
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"


# -------------------------------------------------------------------
# TERM RESIZING ALIASES
# -------------------------------------------------------------------

alias hide='echo -en "\033]50;nil2\007"'
alias tiny='echo -en "\033]50;-misc-fixed-medium-r-normal--8-80-75-75-c-50-iso10646-1\007"'
alias small='echo -en "\033]50;6x10\007"'
alias default='echo -e "\033]50;-misc-fixed-medium-r-semicondensed--13-*-*-*-*-*-iso10646-1\007"'
alias medium='echo -en "\033]50;-misc-fixed-medium-r-normal--13-120-75-75-c-80-iso10646-1\007"'
alias large='echo -en "\033]50;-misc-fixed-medium-*-*-*-15-*-*-*-*-*-iso10646-1\007"'
# This is a large font that has a corresponding double-width font for
# CJK and other characters, useful for full-on utf-8 goodness.
alias larger='echo -en "\033]50;-misc-fixed-medium-r-normal--18-*-*-*-*-*-iso10646-1\007"'
alias huge='echo -en "\033]50;-misc-fixed-medium-r-normal--20-200-75-75-c-100-iso10646-1\007"'
alias normal=default
if [ "$TERM" = "xterm" ] && [ "$LINES" -ge 50 ] && [ "$COLUMNS" -ge 100 ]; then
  large
fi

# -------------------------------------------------------------------
# GENERAL ALIASES
# -------------------------------------------------------------------

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then

   # reboot / halt / poweroff
  alias reboot='sudo /sbin/reboot'
  alias poweroff='sudo /sbin/poweroff'
  alias halt='sudo /sbin/halt'
  alias shutdown='sudo /sbin/shutdown'
   # become root #
   alias root='sudo -i'
   alias su='sudo -i'
fi

#size,show type,human readable
alias l='ls --color=auto -lFh'

#long list,show almost all,show type,human readable
alias la='ls -lAFh'
alias ll='ls -lAFh'

#sorted by date,recursive,show type,human readable
alias lr='ls -tRFh'

#long list,sorted by date,show type,human readable
alias lt='ls -ltFh'

alias ldot='ls -ld .*'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

# Found on http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
dotSlash=""
for i in 1 2 3 4
do
    dotSlash=${dotSlash}'../';
    baseName=".${i}"
    alias $baseName="cd ${dotSlash}"
done

#alias .4='cd ../../../../'
#alias .5='cd ../../../../..'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# This is an enhance version of top
# alias htop="sudo htop d 1"

# Play safe!
# the nocorrect is inspired from
# http://dotfiles.org/~atom/.zshrc
alias 'rm=nocorrect rm -i --preserve-root'
alias 'mv=nocorrect mv -i'
alias 'cp=nocorrect cp -i'
alias 'cpd=cp -ri'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# For convenience
alias 'mkdir=nocorrect mkdir -pv'
alias 'dus=du -sckxh * | sort -nr'

# Remove directories
alias rmd='nocorrect rm -rfi'

# Typing errors...
alias 'cd..=cd ..'

alias df='df -h -x none'
alias free='free -m'
alias cls=clear

alias f='find . -name'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

## Other handy commands
alias h='history'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

# Show open ports
alias ports='netstat -tulanp'

# -------------------------------------------------------------------
# VIM  ALIASES
# -------------------------------------------------------------------
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'

# -------------------------------------------------------------------
# GIT ALIASES
# -------------------------------------------------------------------
alias g='git'
alias ga='git add'
alias gp='git push'
alias gl='git pull'
alias glg='git log'
alias glgs='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias gst='git status'
alias gss='git status -s'
alias gd='git diff'
alias gm='git merge'
alias gma='git commit -am'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias grhh='git reset HEAD --hard'
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'


# -------------------------------------------------------------------
# LINUX SPECIFIC
# -------------------------------------------------------------------
if [[ $('uname') == 'Linux' ]]; then

	# distro specific  - Debian / Ubuntu and friends #
	# install with apt-get
	alias apt-get="sudo apt-get"
	alias apt-get-y="sudo apt-get --yes"

	# update on one command
	alias update='sudo apt-get update && sudo apt-get upgrade'

	## shortcut  for iptables and pass it via sudo#
	alias ipt='sudo /sbin/iptables'

	# display all rules #
	alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
	alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
	alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
	alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
	alias firewall=iptlist

	alias iftop='sudo iftop -i eth0'
	alias tcpdump='sudo tcpdump -i eth0'

	## pass options to free ##
	alias meminfo='free -m -l -t'

	## get top process eating memory
	alias psmem='ps auxf | sort -nr -k 4'
	alias psmem10='ps auxf | sort -nr -k 4 | head -10'

	## get top process eating cpu ##
	alias pscpu='ps auxf | sort -nr -k 3'
	alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

	## Get server cpu info ##
	alias cpuinfo='lscpu'

	## older system use /proc/cpuinfo ##
	##alias cpuinfo='less /proc/cpuinfo' ##

	## get GPU ram on desktop / laptop##
	alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
fi

# get web server headers #
alias header='curl -I'

# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

## Resume wget ##
alias wget='wget -c'

## Memcached server status  ##
#alias mcdstats='/usr/bin/memcached-tool 10.10.27.11:11211 stats'
#alias mcdshow='/usr/bin/memcached-tool 10.10.27.11:11211 display'

## quickly flush out memcached server ##
#alias flushmcd='echo "flush_all" | nc 10.10.27.11 11211'

# Found on http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
alias nocomment='grep -Ev '\''^(#|$)'\'''

alias mount='mount |column -t'

#Grabs the disk usage in the current directory
alias hddusage='du -ch 2> /dev/null |tail -1'

#Gets the total disk usage on your machine
alias hddtotalusage='df -hl --total | grep total'

#Shows the individual partition usages without the temporary memory values
alias hddpartusage='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'

#Gives you what is using the most space. Both directories and files. Varies on
#current directory
alias hddmostspace='du -hsx * | sort -rh | head -10'

# -------------------------------------------------------------------
# SSH ALIASES
# -------------------------------------------------------------------

# SSH aliases - short cuts to ssh to a host
#alias -g shost='ssh -p 9999 user@host.com'

# Screen aliases - add a new screen , or entire session, name it, then ssh to the host
#alias sshost='screen -t HOST shost'

# Alias to AWS SSH tool
alias ec2ssh='ec2ssh.sh'

# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------

# cd + ls  ... and dont forget to add that to completion
cdl() { cd $@; l }
compdef _cd cdl

# Quick find
qf() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}

# Set Term title
precmd () {
  [[ -t 1 ]] || return
  case $TERM in
    *xterm*|rxvt|urxvt|rxvt-256color|rxvt-unicode|(dt|k|E|a)term) print -Pn "\e]2;%n@%m:%~\a"
    ;;
    screen*) print -Pn "\e\"%n@%m:%~\e\134"
  esac
}


# -------------------------------------------------------------------
# MAC SPECIFIC FUNCTIONS
# -------------------------------------------------------------------

if [[ $('uname') == 'Darwin' ]]; then

  # turn hidden files on/off in Finder
  function hiddenOn() { defaults write com.apple.Finder AppleShowAllFiles YES ; }
  function hiddenOff() { defaults write com.apple.Finder AppleShowAllFiles NO ; }

  # myIP address
  function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
    ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  }

  # nice mount (http://catonmat.net/blog/another-ten-one-liners-from-commandlingfu-explained)
  # displays mounted drive information in a nicely formatted manner
  function nicemount() { (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1') | column -t ; }

fi

# -------------------------------------------------------------------
# KEYS BINDING
# -------------------------------------------------------------------

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


# -------------------------------------------------------------------
# COMPLETION
# -------------------------------------------------------------------

LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:';
export LS_COLORS


# the big tab completion game:
# Completion, color
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

# Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Expand partial paths
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'
# Don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

# Separate matches into groups
zstyle ':completion:*:matches' group 'yes'

# Describe each match group.
zstyle ':completion:*:descriptions' format "%B---- %d%b"

# Messages/warnings format
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
zstyle ':completion:*:warnings' format '%B%U---- no match for: %d%u%b'

# Describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# menu for kill
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# kill menu extension!
zstyle ':completion:*:processes' command 'ps --forest -U $(whoami) | sed "/ps/d"'
#zstyle ':completion:*:processes' command 'ps -U $(whoami) | sed "/ps/d"'

#zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes' insert-ids menu yes select
# case insensitivity, partial matching, substitution
zstyle ':completion:*' matcher-list 'm:{A-Z}={a-z}' 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'

# remove uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
   adm alias apache at bin cron cyrus daemon ftp games gdm guest \
   haldaemon halt mail man messagebus mysql named news nobody nut \
   lp operator portage postfix postgres postmaster qmaild qmaill \
   qmailp qmailq qmailr qmails shutdown smmsp squid sshd sync \
   uucp vpopmail xfs

zstyle ':completion:*' hosts $ssh_hosts

zstyle ':completion:*:my-accounts' users-hosts $my_accounts
zstyle ':completion:*:other-accounts' users-hosts $other_accounts



# -------------------------------------------------------------------
# Add host/domain specific zshrc
# -------------------------------------------------------------------
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

# -------------------------------------------------------------------
# LINUX SPECIFIC
# -------------------------------------------------------------------
if [[ $('uname') == 'Linux' ]]; then
	# Archey
	archey
fi

