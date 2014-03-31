call pathogen#infect()
filetype plugin indent on
set nocompatible
set nofoldenable
set modelines=0 

set wildchar=<Tab> wildmenu wildmode=full

syntax on
set background=dark

set ruler

"colorscheme ir_black
" solarized options 
"let g:solarized_termcolors = 256
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
colorscheme solarized

" Turn off swap files
set nobackup
set nowritebackup
set noswapfile

" Switch tabs
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

set tabstop=2
set shiftwidth=2

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set incsearch

set backspace=indent,eol,start

" No more shift! :)
nnoremap ; :

" Shortcut for ESC
imap ;; <Esc>

" Spellchecker
nmap <leader>spell :setlocal spell spelllang=en_us<CR>
nmap <leader>nospell :set nospell<CR>

set smartindent

" Set ctrl-p shortcuts
let g:ctrlp_map = '<c-l>'
let g:ctrlp_cmd = 'CtrlP'

" Set relative line numbers if supported
if exists('+rnu')
  set number
  set relativenumber
  " Shortcut to rapidly toggle `set number`
  nmap <leader>n :set nu<CR>
  " Shortcut to rapidly toggle `set relative-number`
  nmap <leader>nn :set rnu<CR>
else
  set number
endif
" Shortcut to rapidly remove line numbers
nmap <leader>N :set nu!<CR>:set rnu!<CR>

filetype plugin on
"filetype on
set guifont=Monaco:h14

highlight OverLength ctermbg=52 ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set list!


" Shortcut to resize window
nmap <leader>> <C-W>>
nmap <leader>< <C-W><


highlight NonText ctermfg=59 guifg=#4a4a59
highlight SpecialKey ctermfg=59 guifg=#4a4a59

au! BufNewFile,BufRead *.todo setf todo
au BufRead,BufNewFile *.go set filetype=go

" Replace selected
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"
let Tlist_WinWidth = 50

nmap <leader>dd irequire 'ruby-debug'<CR>debugger<CR>
" Yank current file name
nmap cp :let @" = expand("%:p")<CR>

" Hide scrollbars
" http://thisblog.runsfreesoftware.com/?q=Remove+scrollbars+from+Gvim
set guioptions+=LlRrb
set guioptions-=LlRrb

" Operations such as yy, D, and P work with the system clipboard. No need to
" prefix them with + or *. 
"set clipboard=unnamed


" JSON formatter
map <leader>jt :%!python -m json.tool<CR>
" Copy current like to OSX clipboard
map <leader>yy :.w !pbcopy<CR><CR>
" Paste clipboard
map <leader>p :r !pbpaste<CR>

command -nargs=1 E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>
" create file from markdown link
map <leader>cf :E <cfile><cr>

" Agile stories when in Stories directory
autocmd BufRead,BufNewFile *Stories/* set syntax=agile

" Ruby on Rails related file types
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.json_builder setf ruby
au BufRead,BufNewFile *.jbuilder setf ruby
au BufRead,BufNewFile *.hbs setf handlebars

nmap <leader>fn :echo expand('%:p')<CR>

" PLUGIN RELATED
"
" yankring shortcut
nmap <leader>yr :YRShow<CR>
" Load ragtag (markup helper)
let g:ragtag_global_maps = 1 
" Shortcut to color picker
nmap <leader>c :ColorHEX<CR>
" Shortcut to NERDTree
nmap <leader>nt :NERDTree 
nmap <leader>ntt :NERDTreeToggle<CR>


let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'},
                    \ {'path': '~/vimwiki_old_syntax'}]

" Force rspec syntax on rspec files
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

" associate Vagrantfile with ruby filetype
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile Procfile set filetype=ruby

au FileType markdown set ft=pandoc

" Substituting ack with silver searcher.
let g:ackprg = 'ag --nogroup --nocolor --column'

function! RSpecFile()
  execute("!clear && rspec " . expand("%p"))
endfunction
map <leader>R :call RSpecFile() <CR>
command! RSpecFile call RSpecFile()

function! RSpecCurrent()
  execute("!clear && rspec " . expand("%p") . ":" . line("."))
endfunction
map <leader>r :call RSpecCurrent() <CR>
command! RSpecCurrent call RSpecCurrent()

let g:vim_markdown_folding_disabled=1
let g:gitgutter_realtime = 0

let headers_level_3 = ":%s/^===/###/ge:%s/\\s\\====$//ge"
let headers_level_2 = ":%s/^==/##/ge:%s/\\s\\===$//ge"
let headers_level_1 = ":%s/^=/#/ge:%s/\\s\\==$//ge"
let code_blocks = ":%s/{{{/```/ge:%s/}}}/```/ge"
let separators = ":%s/----//ge"
let regexp = headers_level_3 . headers_level_2 . headers_level_1 . code_blocks . separators
call setreg('w', regexp)

au BufRead,BufNewFile *.md set filetype=pandoc
