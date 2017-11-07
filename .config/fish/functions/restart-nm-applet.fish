function restart-nm-applet
    killall nm-applet ^ /dev/null
    nohup nm-applet > /dev/null 2>&1 &
    disown
end
