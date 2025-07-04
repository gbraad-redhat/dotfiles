#!/bin/zsh
# check if powerline-local
if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
# pip install --user powerline (nix)
elif [[ -r ~/.local/lib/python3.11/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python3.11/site-packages/powerline/bindings/zsh/powerline.zsh
# installed on bluefin (need a better solution) !
elif [[ -r ~/.local/lib/python3.13/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    export POWERLINE_CONFIG_COMMAND=${HOME}/.local/bin/powerline-config
    source ~/.local/lib/python3.13/site-packages/powerline/bindings/zsh/powerline.zsh

# else use distro installed powerline
elif [[ -f `which powerline-daemon` ]]; then
    #powerline-daemon -q
    POWERLINE_ZSH_CONTINUATION=1
    POWERLINE_ZSH_SELECT=1

    # fedora
    if [[ -f "/usr/share/powerline/zsh/powerline.zsh" ]]; then
        . /usr/share/powerline/zsh/powerline.zsh
    fi
    # debian
    if [[ -f "/usr/share/powerline/bindings/zsh/powerline.zsh" ]]; then
        . /usr/share/powerline/bindings/zsh/powerline.zsh
    fi


    # powerline-local
    if [[ -f ".dotfiles/powerline-local/.local/share/powerline/zsh/powerline.zsh" ]]; then
        . .dotfiles/powerline-local/.local/share/powerline/zsh/powerline.zsh
    fi
fi

