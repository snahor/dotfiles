set -gx EDITOR nvim
set -gx TERM "xterm-256color"
set -gx CDPATH . ~

# check tmux
if test $TMUX
  # set -gx TERM "screen-256color"
  set -gx TERM "screen-256color-bce"
end

function __add_to_path --argument path
    if test -d "$path"; and not contains $path $PATH
        set -gx PATH $path $PATH
    end
end

# latex
begin
    set -lx TEXLIVE_PATH ~/.local/texlive/2015
    if test -d "$TEXLIVE_PATH"
        set -gx INFOPATH $TEXLIVE_PATH/texmf-dist/doc/info $INFOPATH
        # set -gx MANPATH "" $TEXLIVE_PATH/texmf-dist/doc/man
    end
    __add_to_path $TEXLIVE_PATH/bin/x86_64-linux
end

# go
set -gx GOROOT $HOME/.go
set -gx GOPATH $HOME/projects/go
__add_to_path $GOROOT/bin
__add_to_path $GOPATH/bin

# locals
__add_to_path $HOME/.local/bin

# sbt
__add_to_path $HOME/Applications/sbt/bin

# smlnj
__add_to_path $HOME/vendor/smlnj/bin

# racket
__add_to_path $HOME/vendor/racket/bin

# app engine
__add_to_path $HOME/google_appengine

# coursera's algorithms course
__add_to_path $HOME/algs4/bin

__add_to_path ~/Downloads/Popcorn-Time-0.3.10-Linux-64
