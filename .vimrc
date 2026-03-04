" Enable syntax highlighting
syntax on

" Enable hybrid line numbers
set number
set relativenumber

" Set line number column width (adds space between numbers and text)
set numberwidth=5

" Set line number color to white
highlight LineNr ctermfg=grey guifg=grey
highlight CursorLineNr ctermfg=grey guifg=grey

" Auto-toggle between hybrid and absolute line numbers based on mode
augroup numbertoggle
  autocmd!
  autocmd InsertEnter * set relativenumber!
  autocmd InsertLeave * set relativenumber
augroup END
