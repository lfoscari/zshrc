# zshrc — gg
#  ___ ___
# | . | . |
# |_  |_  |
# |___|___|


# ---------------------------------
# Prompt

export PROMPT="%F{cyan}%2~%f %(#.#.→) "
export RPROMPT=""
	
if [[ ${SSH_TTY} ]]; then
	export RPROMPT="$RPROMPT %F{green}<$(hostname)>%f"
elif [[ ${IN_NIX_SHELL} ]]; then
	export RPROMPT="$RPROMPT %F{blue}(nix)%f"
fi


# ---------------------------------
# Command History

# History file
HISTFILE=$ZDOTDIR/zsh_history

# Number of lines the shell remembers
HISTSIZE=5000

# Number of lines the history file stores
SAVEHIST=20000

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
# source $ZDOTDIR/zsh-colored-man-pages/colored-man-pages.plugin.zsh

# Syntax highlight
# source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ZSH_HIGHLIGHT_STYLES[command]="none"

# History substring search
source $ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh

# Starts Nix environments with zsh instead of bash
source $ZDOTDIR/nix-shell/nix-shell.plugin.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=green,fg=white,bold,underline"


# Fuzzy find tab completion
source $ZDOTDIR/fzf-tab/fzf-tab.plugin.zsh

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
# zstyle ':fzf-tab:*' switch-group '<' '>'

# ---------------------------------
# MISC

# Editor
alias hx="helix"
export EDITOR="helix"

# Automagically clone a repository
alias -s git="git clone"

# cd on steroids
eval "$(zoxide init zsh)"
alias cd="z"

# ls for people with ADHD
alias ls="eza"

# Utils
alias open="xdg-open"
alias zshrc="$EDITOR $ZDOTDIR/.zshrc"
alias unimi="cd ~/Dropbox/Unimi/Dottorato/"

# Load Nix environment automatically upon changing directory
chpwd() {
	if [[ -f shell.nix ]]; then
		nix-shell
	fi
}
