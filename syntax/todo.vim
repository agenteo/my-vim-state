  " Vim syntax file

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "todo"

set nocompatible
set background=dark
syntax on
colorscheme ir_black
set tabstop=4
set shiftwidth=4
set number 
set autoindent
set smartindent
"filetype plugin on
set guifont=Monaco:h20
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

syn match todoDone "\[x\]"
syn match todoTODO "\[_\]"
syn match todoWIP "\[\/\]"
syn match clientName "////"

hi todoDone guibg=lightgreen guifg=darkgreen
hi todoTODO guibg=yellow guifg=black 
hi todoWIP guibg=orange guifg=black
hi clientName guibg=purple4 guifg=white

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
nmap <leader>o i[_]<CR>
