function wifi-password --argument ssid
    # if empty set the current SSID
    if not test -n "$ssid"
        set ssid (iwgetid -r)
    else
        if not test -e "/etc/NetworkManager/system-connections/$ssid"
            echo "Unknown SSID '$ssid'"
            return
        end
    end
    
    set pass (sudo cat /etc/NetworkManager/system-connections/$ssid | perl -ne '/^psk\=(.*)/ && print $1')
    
    echo "SSID:     $ssid"
    echo "Password: $pass"
end
