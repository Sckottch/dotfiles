function fish_user_key_bindings
    bind tab accept-autosuggestion
    bind right complete
    bind \ef 'clear; fastfetch; commandline -f repaint'
    bind \eh 'cd ~; clear; commandline -f repaint'
    bind \ek 'clear; commandline -f repaint'
end
