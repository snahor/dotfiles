function hgrep
    history | grep -v grep | grep -i $argv[1] | sort | uniq | less
end
