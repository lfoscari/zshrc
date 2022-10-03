# zshrc — gg
#  ___ ___
# | . | . |
# |_  |_  |
# |___|___|
#

# ---------------------------------
# Prompt

if [[ ${SSH_TTY} ]] ; then
	export PROMPT="(ssh) %F{cyan}%2~%f %(#.#.→) "
else
	export PROMPT="%F{cyan}%2~%f %(#.#.→) "
	export RPROMPT="%F{red}%(?..ಠ_ಠ)%f"
fi

# ---------------------------------
# Shell options

# Enable command correction
# setopt CORRECT

# Enable argument correction
# setopt CORRECT_ALL


# ---------------------------------
# Command History

# History file
HISTFILE=$ZDOTDIR/zsh_history

# Number of lines the shell remembers
HISTSIZE=5000

# Number of lines the history file stores
SAVEHIST=2000

# Share history across multiple zsh sessions
setopt SHARE_HISTORY

# Append to history
setopt APPEND_HISTORY

# Adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# Do not store duplications
setopt HIST_IGNORE_DUPS

# Expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST

# Ignore duplicates when searching
setopt HIST_FIND_NO_DUPS

# Removes blank lines from history
setopt HIST_REDUCE_BLANKS


# ---------------------------------
# Directory history

# Do not store duplicates in the stack
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after pushd or popd
setopt PUSHD_SILENT

# Push the current directory visited on the stack
setopt AUTO_PUSHD

# Directory history
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index


# ---------------------------------
# Autocompletion

# Instead of listing completions, fill with first too
setopt MENU_COMPLETE

# Completion styles used
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate

# Completion composition
zstyle ':completion:*' menu select matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*' 'r:|[._-]=** r:|=**'

# Find compinstall
zstyle :compinstall filename '${ZDOTDIR}/.zshrc'

# Load function
autoload -Uz compinit

# Start autocompletion
compinit


# ---------------------------------
# Plugins

# Autosuggestions
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# Colorized man pages
source $ZDOTDIR/zsh-colored-man-pages/colored-man-pages.plugin.zsh

# Syntax highlight
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[command]="none"

# History substring search
source $ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=green,fg=white,bold,underline"


# ---------------------------------
# MISC

# Editor
export EDITOR="nvim"
alias vim="$EDITOR"

# Open with
alias -s ."*"=open

# Automagically clone a repository
alias -s git="git clone"

# ls settings
export CLICOLOR=1
alias ls="exa"
alias l="ls -la"

# Utils
alias open="xdg-open"
alias tree="exa -T"
alias :q="exit"
alias zshrc="vim $ZDOTDIR/.zshrc"
alias unimi="cd /home/gg/Dropbox/Unimi/Appunti/Magistrale"
