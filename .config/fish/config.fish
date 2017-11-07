# No message plz.
set fish_greeting ""

source ~/.config/fish/environment.fish
source ~/.config/fish/functions.fish

# fuck you caps
setxkbmap -option caps:ctrl_modifier
# xcape -e 'Caps_Lock=Escape'

# reload this
alias ss='source ~/.config/fish/config.fish'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

abbr --add q exit
abbr --add c clear
abbr --add d deactivate
abbr --add v nvim
abbr --add ipy ipython

# abbr this?
alias incognito 'google-chrome --incognito'

alias h='history | less'
alias grep='grep --color=auto'

alias ls   'ls --color=auto'
alias ll   'ls -lhF'
alias la   'ls -lhaF'
alias l    'ls -CF'
alias df   'df -h'
alias ln   'ln -v'
alias dirs "ll | grep '^d' | awk '{ print $9 }'"

# utils
alias num_lines='awk "END {print NR}"'
alias psgrep='ps axu | grep -v grep | grep -i'
alias nakedvim='vim -u NONE -N -c "set backspace=2"'
alias sensors='watch -n3 sensors'
alias pwgen='tr -dc A-Za-z0-9_ < /dev/urandom | head -c8'
alias serve='python -m http.server'
alias prettyjson='python -m json.tool'

# git
alias gs 'git status'
abbr --add g   git
abbr --add ga  git add
abbr --add gp  git push
abbr --add gc  git commit
abbr --add gs  git status
abbr --add gca git commit --amend
abbr --add gd  git diff
abbr --add gcm git checkout master
abbr --add gl  git log
abbr --add gco git checkout

# poly/ml
alias poly 'rlwrap poly'

# smlnj
alias smlnj 'rlwrap sml'
