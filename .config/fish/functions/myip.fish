function myip
    ip r | tail -n1 | awk '{ print \$9 }'
end
