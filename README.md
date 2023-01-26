Linux shell configs for vim zsh tmux screen git etc.

## new ubuntu host initialize steps

apt install  curl
apt install  screen
apt install  git
apt install  cmake

# ohmyzsh
apt install  zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# vim plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall

# tmux
apt install  tmux

# tmux powerline
cd ~
git clone https://github.com/erikw/tmux-powerline.git

# tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux new -s S1
tmux a -t S1

# neovim
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.8
apt install gcc
apt install cmake
apt install pkg-config
make CMAKE_BUILD_TYPE=Release
sudo make install

# neovim config
git clone https://github.com/Tonvin/nvim-basic-ide.git ~/.config/nvim
nvim
:PackerSync
