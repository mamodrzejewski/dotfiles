# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/modrzejbook/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

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
plugins=(git colored-man-pages wd zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
# PURE PROMPT
autoload -U promptinit; promptinit
prompt pure

TERM=xterm-256color

# setup Broot
#source /Users/modrzejbook/Library/Preferences/org.dystroy.broot/launcher/bash/br

# set vim keybindings
bindkey -v

# setup recursive search to work with tmux
bindkey '^R' history-incremental-search-backward
# C-space to toggle autosuggestions
bindkey '^ ' autosuggest-toggle


# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# aliases here, but some day I will put them in ZSH_CUSTOM
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshreload="source ~/.zshrc"
alias vimconfig="nvim ~/.vimrc"
alias vim="nvim"
alias nvimdiff="nvim -d"
alias up='cd ..'
alias br="br --height 30"
alias exa='exa --group-directories-first'
alias ex='exa --group-directories-first -l --icons'
alias ext='exa --group-directories-first --tree --level=1 --icons'
alias tree="tree -C"
alias jl="jupyter-lab"
alias ipython="python3 -m IPython"
alias ls="exa"
eval "$(thefuck --alias fuck)"

# make sure git is in English
export LC_ALL=en_US.UTF-8

# Some cursor settings. Remove mode switching delay.
KEYTIMEOUT=2


# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]; then
            echo -ne '\e[1 q'

    elif [[ ${KEYMAP} == main ]] ||
	    [[ ${KEYMAP} == viins ]] ||
	    [[ ${KEYMAP} = '' ]] ||
	    [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
      fi
    }

zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Fixes some cursor issues introduced
# by the lines above. Fix this some day.
_fix_cursor() {
   echo -ne '\e[5 q'
}


precmd_functions+=(_fix_cursor)

# Turn on syntax highlighting
source /Users/modrzejbook/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Use fd for fzf because it's faster
export FZF_DEFAULT_COMMAND='fd  --hidden --follow --exclude "{node_modules/*,.git/*}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Display a nice welcome message when starting shell
pfetch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/modrzejbook/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/modrzejbook/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/modrzejbook/opt/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/modrzejbook/opt/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

