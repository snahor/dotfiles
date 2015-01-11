#!/usr/bin/env fish

set -gx EDITOR vim
set -gx TERM "xterm-256color"

function _add_to_path
  if test -d $argv[1]
    set -gx PATH $argv[1] $PATH
  end
end

# locals
_add_to_path $HOME/.local/bin

# sbt
_add_to_path $HOME/Applications/sbt/bin

# LightTable
_add_to_path $HOME/Applications/LightTable

# latex
if test -d ~/texlive/2013
  set -gx INFOPATH $HOME/texlive/2013/texmf-dist/doc/info $INFOPATH
  set -gx MANPATH "" $HOME/texlive/2013/texmf-dist/doc/man
  set -gx PATH $HOME/texlive/2013/bin/x86_64-linux $PATH
end

# go
_add_to_path /usr/local/go/bin
if test -d $HOME/go
  set -gx GOPATH $HOME/go
  set -gx PATH $GOPATH/bin $PATH
end

# cabal
_add_to_path $HOME/.cabal/bin $PATH

# rbenv
if test -d $HOME/.rbenv/bin
  set -gx PATH $HOME/.rbenv/bin $PATH
  . (rbenv init - | psub)
end

# nvm
if test -f $HOME/.config/fish/nvm.fish
  set -gx NVM_DIR $HOME/.nvm
  . $HOME/.config/fish/nvm.fish
end

# smlnj
_add_to_path $HOME/smlnj/bin

# racket
_add_to_path $HOME/racket/bin

# Heroku
_add_to_path /usr/local/heroku/bin
