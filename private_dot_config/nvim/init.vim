" Behave like a windows programm, i.e. gives the expected functionality i.a. to
" Ctrl-X, Ctrl-C, Ctrl-V, Ctrl-S, Ctrl-Z, Ctrl-Y, Ctrl-A, Ctrl-F, and Ctrl-H.
source $VIMRUNTIME/mswin.vim
behave mswin

" --- Search -------------------------------------------------------------------
set ignorecase                  " Ignore case when searching.
set smartcase                   " When searching try to be smart about cases.

" --- Indentation --------------------------------------------------------------
set expandtab                   " Indent with spaces (instead of tabs).
set shiftwidth=4                " Number of spaces to use per indent.
set tabstop=4                   " Number of spaces to visualize tabs with.
set smartindent

" --- Miscellaneous ------------------------------------------------------------
set number                      " Show line numbers.
set colorcolumn=81              " Highlight 81st column.
set nowrap                      " Dont wrap overlong lines.
set showmatch                   " Highlight matching brackets.
set spelllang=en,de             " Spell checking in English and German.
set undofile                    " Persist undo history.
set termguicolors
