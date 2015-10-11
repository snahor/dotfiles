# vim: ft=sh

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias q='exit'

alias c="clear"
alias h='history'
alias d='deactivate'
alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias ll="ls -lhF"
alias la="ls -lhaF"
alias l="ls -CF"
alias df='df -h'
alias ln='ln -v'

alias xclip='xclip -selection cr'
alias ack='ack-grep'
alias v='nvim'
alias nakedvim='vim -u NONE -N -c "set backspace=2"'
#alias simplevim='vim -u ~/.config/vim/base.vim'
alias g='gvim'
alias incognito='google-chrome --incognito'
alias nautilus='nautilus --no-desktop'
alias n='nautilus'
alias pbcopy="xclip -selection clipboard -i"
alias pbpaste="xclip -selection clipboard -o"

# utils
alias num_lines='awk "END {print NR}"'
alias pgrep='ps axu | grep -v grep | grep -i'
#alias hgrep='history | grep -v grep | grep -i | sort | uniq'
alias extract_ip='grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'
alias extract_email='grep -Eio "([[:alnum:]_.-\+\-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})"'

alias myip="ip r | tail -n1 | awk '{ print \$9 }'"
alias macs="ip -o link | awk '!/lo/ { print \$2, \$(NF-2) }'"

alias pwgen='tr -dc A-Za-z0-9_ < /dev/urandom | head -c8'
alias serve='python -m SimpleHTTPServer ^ /dev/null'
alias prettyjson='python -m json.tool'
alias ss='source ~/.config/fish/config.fish'

# git
alias ga='git add'
alias gp='git push'
alias gs='git status'
alias gm='git commit -m'
alias gd='git diff'
alias gcm='git checkout master'
alias gl='git log'

# apt
alias apt-update='sudo apt-get update'
alias apt-install='sudo apt-get install'
alias apt-search='apt-cache search'
alias service='sudo service'

complete -f -c apt-install -a '( apt-cache pkgnames $argv[1] )'
