" use relativ path for sourcing? causes issues otherwise i think with my
" debug.sh script
" https://stackoverflow.com/questions/46964475/how-can-i-source-files-relative-to-file
"
" color scheme
"source solarized.vim

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


" temporary auto save installation plugin
" toggle with :ASToggle
set rtp+=/home/griffin/git/auto-save.nvim
