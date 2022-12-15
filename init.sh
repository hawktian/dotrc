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

cp $root"dotrc/zsh/melon.zsh-theme" $root".oh-my-zsh/custom/themes/"

#git
if [ ! -d $root".oh-my-zsh/custom/plugins/git" ]
then
    mkdir $root".oh-my-zsh/custom/plugins/git"
fi
ln -s -f $root"dotrc/git/git.plugin.zsh" $root".oh-my-zsh/custom/plugins/git/git.plugin.zsh"

#screen
if [ ! -d $root".oh-my-zsh/custom/plugins/screen" ]
then
    mkdir $root".oh-my-zsh/custom/plugins/screen"
fi
ln -s -f $root"dotrc/screen/screen.plugin.zsh" $root".oh-my-zsh/custom/plugins/screen/screen.plugin.zsh"

#tmux
ln -s -f $root"/.tmux.conf" $root"dotrc/tmux/tmux.conf"

#tmux powerlinerc
ln -s -f $root"/.tmux-powerlinerc" $root"dotrc/tmux/tmux-powerlinerc"

#tmux powerline theme
ln -s -f $root"/tmux-powerline/themes/melon.sh" $root"dotrc/tmux/tmux-powerline-theme-melon.sh"

cp $root"dotrc/zsh/alias" $root".alias"

. $root".zshrc"
