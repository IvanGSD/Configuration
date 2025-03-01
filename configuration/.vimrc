" Theme
colorscheme slate     " 'ls /usr/share/vim/vimXX/colors | grep .vim' for more schemes (XX = version)
set background=light  " Background either dark or light

" General Purpose
set number            " Line numbers
set relativenumber    " Relative line numbers.
set hlsearch          " Highlight search results
set wrap              " Enable line/text wrapping
set wildmenu          " Enable wildmenu (pressing Tab to trigger the command-line completion)
set cursorline        " Highlight the current line
set mouse=i           " Enable mouse in insert mode

" Coding/Programming
syntax on             " Syntax highlighting
set showmatch         " Show matching parenthesis/bracket/brace

set tabstop=4         " Number of spaces for a tab
set expandtab         " Use spaces instead of tabs

set autoindent        " Automatically indent when starting a new line
set shiftwidth=4      " Number of spaces for an indent