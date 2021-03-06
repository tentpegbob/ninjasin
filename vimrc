" In order for this file to be useful you have to complete installation:
" apt-get upgrade && apt-get update && \
" apt-get install -y vim git build-essential cmake wget python-dev python3-dev clang
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" wget https://raw.githubusercontent.com/tentpegbob/ninjasin/master/vimrc -O ~/.vimrc
" vim +PluginInstall +qall
" cd ~/.vim/bundle/YouCompleteMe/; ./install.py --clang-completer;
" mkdir ~/.vim/bundle/YouCompleteMe/ycm_build; cd ~/.vim/bundle/YouCompleteMe/ycm_build; cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp; cmake --build . --target ycm_core --config Release

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Valloric/YouCompleteMe'
" plugin from https://github.com/Valloric/YouCompleteMe#full-installation-guide

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"" General
set encoding=utf-8
set number        " Show line numbers
set linebreak     " Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	    " Highlight matching brace
set visualbell	   " Use visual bell (no beeping)
colorscheme desert
set background=dark
 
"" Better Searching
set hlsearch	     " Highlight all search results
set smartcase	    " Enable smart-case search
set ignorecase	   " Always case-insensitive
set incsearch	    " Searches for strings incrementally

"" Programming Help
syntax enable     " Set syntax highlighting 
set autoindent	   " Auto-indent new lines
set cindent	      " Use 'C' style program indenting

"" Spaces/Tabs
set shiftwidth=4	 " Number of auto-indent spaces
set smartindent	  " Enable smart-indent
set smarttab	     " Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
set list listchars=trail:.
set linebreak
set showbreak=+++
 
"" Advanced
set ruler	        " Show row and column ruler information
set comments=sr:/*,mb:*,ex:*/   "auto create block comments
set formatoptions+=r
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
