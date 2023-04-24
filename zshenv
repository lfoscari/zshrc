# Configuration files base directory and Flatpak
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/gg/.local/share/flatpak/exports/share"

# JetBrains scripts
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# ZSH base directory
export ZDOTDIR="$HOME/.zsh"

# Nix shell
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi

# Opam
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
