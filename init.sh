#!/bin/zsh

root="/root/"

rm -i $root".vimrc"
ln -s $root"dotrc/vim/vimrc" $root".vimrc"

mkdir -p $root".vim/colors/"
cp $root"dotrc/vim/melon.vim" $root".vim/colors/"

rm -i $root".zshrc"
ln -s $root"dotrc/zsh/zshrc" $root".zshrc"

rm $root".screenrc"
ln -s $root"dotrc/screen/screenrc" $root".screenrc"

rm -i $root".gitconfig"
ln -s $root"dotrc/git/gitconfig" $root".gitconfig"

cp $root"dotrc/grep/exclude" $root".grep-exclude"
cp $root"dotrc/grep/exclude-dir" $root".grep-exclude-dir"

cp $root"dotrc/zsh/melon.zsh-theme" $root".oh-my-zsh/themes/"

cp $root"dotrc/zsh/alias" $root".alias"

. $root".zshrc"
