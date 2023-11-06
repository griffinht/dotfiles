lua require("init")

" line numbers
set number
" make them relative numbers
set relativenumber

" double tap j to escape
imap jj <Esc>

" set title of parent terminal to the file being edited
set title

" tabs -> 4 width spaces
set expandtab
set shiftwidth=4

" hide status bar
set laststatus=0
" hide -- INSERT -- mode stuff
set noshowmode


" todo set titlestring=
"https://neovim.discourse.group/t/help-needed-customizing-nvim-terminal-title/721


"https://hot.griffinht.com/searx/search?t=ffab&q=nvim+autocomplete
"https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
"https://hot.griffinht.com/searx/search?t=ffab&q=neovim+solarized+

" disable solarized double background
let g:solarized_termtrans=1
colorscheme solarized

" spellchecking
" disable with :nospell
set spell spelllang=en_us spellfile=~/git/guix/home/spell/english.utf-8.add
