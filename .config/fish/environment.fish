#!/usr/bin/env fish

set -gx EDITOR nvim
set -gx TERM "xterm-256color"
set -gx CDPATH . ~

# check tmux
if test $TMUX
  set -gx TERM "screen-256color"
end

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
begin
  set -lx TEXLIVE_PATH ~/.local/texlive/2015
  if test -d $TEXLIVE_PATH
    set -gx INFOPATH $TEXLIVE_PATH/texmf-dist/doc/info $INFOPATH
    # set -gx MANPATH "" $TEXLIVE_PATH/texmf-dist/doc/man
    set -gx PATH $TEXLIVE_PATH/bin/x86_64-linux $PATH
  end
end

# go {{{
#_add_to_path /usr/local/go/bin
set -gx GOROOT /usr/lib/go-1.7
_add_to_path $GOROOT/bin

if test -d $HOME/projects/go
  set -gx GOPATH $HOME/projects/go
  set -gx PATH $GOPATH/bin $PATH
end
# }}}

# cabal
_add_to_path $HOME/.cabal/bin $PATH

_add_to_path /opt/cabal/1.22/bin
_add_to_path /opt/ghc/7.10.3/bin

# rbenv
if test -d $HOME/.rbenv/bin
  set -gx PATH $HOME/.rbenv/bin $PATH
  . (rbenv init - | psub)
end

# nvm
#if test -f $HOME/.config/fish/nvm-fish/nvm.fish
if test -f $HOME/.config/fish/nvm.fish
  set -gx NVM_DIR $HOME/.nvm
  #. $HOME/.config/fish/nvm-fish/nvm.fish
  . $HOME/.config/fish/nvm.fish
end

# smlnj
_add_to_path $HOME/smlnj/bin

# racket
_add_to_path $HOME/racket/bin

# Heroku
_add_to_path /usr/local/heroku/bin

# app engine
_add_to_path $HOME/google_appengine

# elm
_add_to_path $HOME/Elm-Platform/0.15/bin

# coursera's algorithms course
_add_to_path $HOME/algs4/bin
