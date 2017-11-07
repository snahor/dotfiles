function macs
    ip -o link | awk "!/lo/ { print \$2, \$(NF-2) }"
end
