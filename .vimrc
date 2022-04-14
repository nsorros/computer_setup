set shell=/bin/bash

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Add line numbers
:set number

" Insert 4 spaces when tab is pressed 
:set expandtab
:set tabstop=4

" Syntax on
:syntax on
:colorscheme slate
