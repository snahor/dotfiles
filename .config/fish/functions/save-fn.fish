function save-fn --argument fn
    funcsave $fn
    nvim --headless -c 'bufdo norm ggVGgq' -c 'wq' ~/.config/fish/functions/$fn.fish >/dev/null ^/dev/null
end
