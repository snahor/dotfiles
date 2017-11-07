function s -d "Activates a virtualenv"
    set -l depth 4
    set -l path bin/activate.fish

    for i in ( seq $depth )
        if test -f $path
            source $path
            return 0
        end
        set path ../$path
    end
end


function __workon_py -a project
    set -l target $HOME/projects/$project

    if test -f "$target/bin/activate.fish"
        source $target/bin/activate.fish
    end

    if test -d "$target/src"
        cd $target/src
    else
        cd $target
    end
end


function workon -a project
    if test -d "$HOME/projects/$project"
        __workon_py $project
    else if test -d "$GOPATH/src/github.com/snahor/$project"
        cd $GOPATH/src/github.com/snahor/$project
    end
end


function mkvenv -a project
    if not test -d "$HOME/projects/$project"
        virtualenv $HOME/projects/$project
    end
    __workon_py $project
end


function rmvenv -a project -a hard
    # NOTE should it fail silently?
    not test -f "$HOME/projects/$project/bin/activate.fish"; and return

    if test $hard = "--hard"; or test $hard = "-h"
        rm -rf ~/projects/$project
    else
        rm -rf ~/projects/$project/{lib,bin,include,local}
    end
end


function __list_virtualenvs
    for d in ( find ~/projects/* -maxdepth 0 -type d )
        test -f "$d/bin/activate.fish"; and echo ( basename $d )
    end
end


function __list_projects
    ls -l $HOME/projects/ | grep '^d' | awk '{ print $9 }'
    ls -l $GOPATH/src/github.com/snahor | grep '^d' | awk '{ print $9 }'
end

complete -x -c workon -a "( __list_projects )"
complete -x -c rmvenv -a "( __list_virtualenvs )"
