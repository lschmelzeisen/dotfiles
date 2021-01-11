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
set termguicolors               " Enable 24-bit color support.
set mouse=a                     " Enable mouse support in all modes.

" --- Mappings -----------------------------------------------------------------
" Bind copy/paste to Alt+C/V.
noremap <A-c> "+y
noremap <A-v> "+p
inoremap <A-v> <C-r>*
