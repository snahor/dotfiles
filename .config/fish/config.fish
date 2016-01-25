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
#. $fish_path/oh-my-fish.fish

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

# OPAM configuration
#. /home/hans/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
#. ~/.opam/opam-init/variables.fish

function _is_xterm
  test -n $XTERM_VERSION
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  set -l show_untracked (git config --bool bash.showUntrackedFiles)
  set untracked ''
  if [ "$theme_display_git_untracked" = 'no' -o "$show_untracked" = 'false' ]
    set untracked '--untracked-files=no'
  end
  echo (command git status -s --ignore-submodules=dirty $untracked ^/dev/null)
end

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)
  #set -l prompt "➜"
  set -l prompt "𝝺"
  #set -l prompt "😀 "

  if test $last_status = 0
      set arrow "$green$prompt"
  else
      set arrow "$red$propmt"
  end
  set -l cwd $cyan(basename (prompt_pwd))

  if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue git:($git_branch$blue)"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗ "
      set git_info "$git_info$dirty"
    end
  end

  echo -n -s $arrow ' ' $cwd $git_info $normal ' '
end
