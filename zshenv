# Configuration files base directory
export XDG_CONFIG_HOME="$HOME/.config"

# ZSH base directory
export ZDOTDIR="$HOME/.zsh"

# Alacritty with gnome topbar
export WINIT_UNIX_BACKEND="x11"

# Editor
export EDITOR="nvim"

# NVIM true colors
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# Nix
if [ -e /home/gg/.nix-profile/etc/profile.d/nix.sh ]; then
	. /home/gg/.nix-profile/etc/profile.d/nix.sh;
fi
