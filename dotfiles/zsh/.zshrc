# source ~/toolbox/antigen.zsh

# antigen apply

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
   
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/toolbox/oh-my-zsh/custom
   
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
  
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
  
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
  
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
  
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
  
# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"
  
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
  
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
  
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
  
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
  
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
  
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
  
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
 # much, much faster.
 # DISABLE_UNTRACKED_FILES_DIRTY="true"
    
# Uncomment the following line if you want to change the command execution time
 # stamp shown in the history command output.
 # You can set one of the optional three formats:
 # "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 # or set a custom format using the strftime function format specifications,
 # see 'man strftime' for details.
 # HIST_STAMPS="mm/dd/yyyy"
    
# Would you like to use another custom folder than $ZSH/custom?
 # ZSH_CUSTOM=/path/to/new-custom-folder
    
# Which plugins would you like to load?
 # Standard plugins can be found in $ZSH/plugins/
 # Custom plugins may be added to $ZSH_CUSTOM/plugins/
 # Example format: plugins=(rails git textmate ruby lighthouse)
 # Add wisely, as too many plugins slow down shell startup.
 plugins=(git autojump wp-cli virtualenv git-extras history npm python pip composer docker brew kubectl zsh-autosuggestions)
    
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
    
# Set paths
 # source $HOME/toolbox/dotfiles/zsh/paths/.paths-common
 # source $HOME/toolbox/dotfiles/zsh/paths/.paths-projects
 [ -f "$HOME/toolbox/dotfiles/zsh/paths/.paths-local" ] && source $HOME/toolbox/dotfiles/zsh/paths/.paths-local
    
# Set aliases
 source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-common
 source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-common-vagrant
 source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-common-docker
    
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

# Set Paths
source $HOME/toolbox/dotfiles/zsh/paths/.paths-darwin
   
# Set aliases
source $HOME/toolbox/dotfiles/zsh/aliases/.aliases-darwin
   
# Set functions
source $HOME/toolbox/dotfiles/zsh/functions/.functions-darwin
   
# Activate addons
source $HOME/toolbox/dotfiles/zsh/addons/.addons-darwin
   
   
# User configuration
   
# export MANPATH="/usr/local/man:$MANPATH"
   
# You may need to manually set your language environment
export LANG=en_US.UTF-8
   
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='mvim'
fi
      
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
   
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
   
   
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
# export TERM=screen-256color       # for a tmux -2 session (also for screen)
   
# zsh-syntax-highlighting (see https://github.com/zsh-users/zsh-syntax-highlighting)
source $HOME/toolbox/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
   
if [ -x "$(command -v rbenv)" ]
then
    eval "$(rbenv init -)"
fi
   
   
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
export PATH="$HOME/.yarn/bin:$PATH"
   
# # Perl
if [[ -f $HOME/perl5/lib/perl5 ]]; then
  eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
fi
   
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
# TODO Remove or fix
# [[ -f /Users/davidlonjon/.nvm/versions/node/v10.8.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/davidlonjon/.nvm/versions/node/v10.8.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
   
   
   
# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/davidlonjon/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/davidlonjon/google-cloud-sdk/path.zsh.inc'; fi
   
# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/davidlonjon/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/davidlonjon/google-cloud-sdk/completion.zsh.inc'; fi
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# PHPBrew https://github.com/phpbrew/phpbrew
# [[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit

# # https://github.com/ajeetdsouza/zoxide
# [[ -e /usr/local/bin/zoxide ]] && eval "$(zoxide init bash)"
# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# see https://betterprogramming.pub/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
"

# fzf's command
export FZF_DEFAULT_COMMAND="fd"
source /Users/davidlonjon/.config/broot/launcher/bash/br
