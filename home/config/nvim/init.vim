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


" todo package this
" temporary auto save installation plugin
" toggle with :ASToggle
set rtp+=~/git/auto-save.nvim

" todo set titlestring=
"https://neovim.discourse.group/t/help-needed-customizing-nvim-terminal-title/721


"https://hot.griffinht.com/searx/search?t=ffab&q=nvim+autocomplete
"https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
"https://hot.griffinht.com/searx/search?t=ffab&q=neovim+solarized+

" terrible hack to add guix vim package to neovim
" this will probably break things frequently
set rtp+=~/.guix-home/profile/share/vim/vimfiles
" disable solarized double background
let g:solarized_termtrans=1
colorscheme solarized

" hledger vim
set rtp+=~/git/vim-ledger

lua require("init")
