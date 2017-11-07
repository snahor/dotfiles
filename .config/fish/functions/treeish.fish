function treeish
    set -l depth 1
    set -l dir
    set -l num_args (count $argv)

    if test $num_args = 1
        set depth $argv[1]
    end

    #if math "$num_args > 0" > /dev/null
        #set depth $argv[1]
    #end

    tree --dirsfirst -ChFLQ  $depth $dir
end

