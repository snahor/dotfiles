function sound
    mpv $argv[1] -vo null > /dev/null ^ /dev/null
end
