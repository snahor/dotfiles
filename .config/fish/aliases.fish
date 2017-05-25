alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
#alias -="cd -"

alias q='exit'

alias c="clear"
alias h='history | less'
alias d='deactivate'
alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias ll="ls -lhF"
alias la="ls -lhaF"
alias l="ls -CF"
alias df='df -h'
alias ln='ln -v'
alias dirs="ll | grep '^d' | awk '{ print $9 }'"

alias xclip='xclip -selection cr'
alias ack='ack-grep'
alias v='nvim'
alias nakedvim='vim -u NONE -N -c "set backspace=2"'
alias g='gvim'
alias incognito='google-chrome --incognito'
alias nautilus='nautilus --no-desktop'
alias n='nautilus'
alias pbcopy="xclip -selection clipboard -i"
alias pbpaste="xclip -selection clipboard -o"
alias sensors='watch -n3 sensors'
# alias python='python3'

# utils
alias num_lines='awk "END {print NR}"'
alias psgrep='ps axu | grep -v grep | grep -i'
alias extract_ip='grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'
alias extract_email='grep -Eio "([[:alnum:]_.-\+\-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})"'

alias myip="ip r | tail -n1 | awk '{ print \$9 }'"
alias macs="ip -o link | awk '!/lo/ { print \$2, \$(NF-2) }'"

alias pwgen='tr -dc A-Za-z0-9_ < /dev/urandom | head -c8'
alias serve='python -m http.server'
alias prettyjson='python -m json.tool'
alias ss='source ~/.config/fish/config.fish'

alias restart-nm-applet='killall nm-applet; nohup nm-applet &'
alias restart-network-manager='sudo service network-manager restart'

# git
alias ga='git add'
alias gp='git push'
alias gs='git status'
alias gm='git commit -m'
alias gd='git diff'
alias gcm='git checkout master'
alias gl='git log'
alias gco='git checkout'

# poly/ml
alias poly='rlwrap poly'

# smlnj
alias smlnj='rlwrap sml'

complete -f -c apt-install -a '( apt-cache pkgnames $argv[1] )'
