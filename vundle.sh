mkdir ~/.vim
mkdir ~/.vim/bundle
cd ~/.vim/bundle
git clone git://github.com/VundleVim/Vundle.vim.git
echo "
set nocompatible          
filetype off             
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()   
filetype plugin indent on" >> ~/.vimrc
vim +PluginInstall +qal

