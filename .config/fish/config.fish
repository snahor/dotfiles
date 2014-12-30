# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins tmux

# Path to your custom folder (default path is $FISH/custom)
 #set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# My aliases
. ~/.config/fish/aliases.fish

# My functions
. ~/.config/fish/functions.fish

# My env vars
. ~/.config/fish/environment.fish

# fuck you caps
setxkbmap -option caps:ctrl_modifier

# No message plz.
set fish_greeting ""
