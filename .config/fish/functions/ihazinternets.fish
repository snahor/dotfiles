function ihazinternets
    # ping -q -w 1 -c 1 (ip r | grep default | cut -d ' ' -f 3) > /dev/null ^&1; and echo Yup; or echo Nope
    ping -q -W 1 -c 1 8.8.8.8 > /dev/null ^&1; and echo Yup; or echo Nope
end
