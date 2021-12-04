SRC_DIR=$(pwd)

deploy_all(){
    dotfiles=".bash_profile .bashrc"
    dotfiles="$dotfiles .config/conky/conky.conf"
    dotfiles="$dotfiles .config/kitty/kitty.conf"
    dotfiles="$dotfiles .emacs.d/init.el"
    dotfiles="$dotfiles .vnc/config .vnc/xstartup"
    dotfiles="$dotfiles .tmux.conf"
    mkdir -p $HOME/.config/conky
    mkdir -p $HOME/.config/kitty
    mkdir -p $HOME/.emacs.d
    mkdir -p $HOME/.vnc
    for f in $dotfiles; do
        ln -sf $SRC_DIR/$f $HOME/$f
    done
}
