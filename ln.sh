#!/bin/bash
ln -s /root/MelonRC/vim/vimrc /root/.vimrc
ln -s /root/MelonRC/zsh/zshrc /root/.zshrc
ln -s /root/MelonRC/screen/screenrc /root/.screenrc
ln -s /root/MelonRC/git/gitconfig /root/.gitconfig
mkdir -p /root/.vim/colors/
cp /root/MelonRC/vim/melon.vim /root/.vim/colors/
touch /root/.alias.local
source /root/.zshrc
