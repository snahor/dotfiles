#!/usr/bin/env fish

set -gx EDITOR vim
set -gx TERM "xterm-256color"

# locals
if test -d ~/.local/bin
  set -gx PATH ~/.local/bin $PATH
end

# sbt
if test -d ~/Applications/sbt/bin
  set -gx PATH $HOME/Applications/sbt/bin $PATH
end

# LightTable
if test -d ~/Applications/LightTable
  set -gx PATH $HOME/Applications/LightTable $PATH
end

# latex
if test -d ~/texlive/2013
  set -gx INFOPATH $HOME/texlive/2013/texmf-dist/doc/info $INFOPATH
  set -gx MANPATH "" $HOME/texlive/2013/texmf-dist/doc/man
  set -gx PATH $HOME/texlive/2013/bin/x86_64-linux $PATH
end

# go
if test -d $HOME/go
  set -gx GOPATH $HOME/go
  set -gx PATH $GOPATH/bin $PATH
end

# cabal
if test -d $HOME/.cabal/bin
  set -gx PATH $HOME/.cabal/bin $PATH
end

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
if test -d $HOME/smlnj/bin
  set -gx PATH $HOME/smlnj/bin $PATH
end

# racket
if test -d $HOME/racket/bin
  set -gx PATH $HOME/racket/bin $PATH
end

# Heroku
if test -d /usr/local/heroku/bin
  set -gx PATH /usr/local/heroku/bin $PATH
end
