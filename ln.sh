#!/bin/zsh

root="/root/"

rm -i $root".vimrc"
ln -s $root"MelonRC/vim/vimrc" $root".vimrc"

mkdir -p $root".vim/colors/"
cp $root"MelonRC/vim/melon.vim" $root".vim/colors/"

rm -i $root".zshrc"
ln -s $root"MelonRC/zsh/zshrc" $root".zshrc"

rm $root".screenrc"
ln -s $root"MelonRC/screen/screenrc" $root".screenrc"

rm -i $root".gitconfig"
ln -s $root"MelonRC/git/gitconfig" $root".gitconfig"

cp $root"MelonRC/grep/exclude" $root".grep-exclude"
cp $root"MelonRC/grep/exclude-dir" $root".grep-exclude-dir"

cp $root"MelonRC/zsh/alias" $root".alias"

source $root".zshrc"
