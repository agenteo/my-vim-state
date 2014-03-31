" Vim syntax file

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "agile"

syn keyword agileFeature Feature
syn keyword agileScenario Scenario
syn keyword agileGiven Given
syn keyword agileWhen When
syn keyword agileThen Then
syn keyword agileAnd And
syn keyword agilePending pending
syn keyword agileBlocked BLOCKED

syn region agileVariable start=/"/ skip=/\./ end=/"/
syn region agilePoints start=/PT/ end=/$/
syn region agileTags start=/@/ end=/$/


" Colors taken from:
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
hi def agileFeature term=underline ctermfg=107 guifg=#87af5f
hi def agileScenario term=bold ctermfg=115 guifg=#87d7af
hi def agileGiven ctermfg=27 guifg=#005fff
hi def agileAnd ctermfg=117 guifg=#87d7ff
hi def agileWhen ctermfg=160 guifg=#d70000
hi def agileThen ctermfg=172 guifg=#d78700

hi def agileVariable ctermfg=White
hi def agilePoints ctermfg=59 guifg=#5f5f5f ctermbg=223 guibg=#ffd7af
hi def agileTags ctermfg=59 guifg=#5f5f5f ctermbg=215 guibg=#ffaf5f
hi def agilePending ctermfg=White guifg=White ctermbg=Red guibg=Red
hi def agileBlocked ctermfg=White guifg=White ctermbg=Red guibg=Red

imap <C-a> Feature:
imap <C-d> Scenario:
imap <C-g> pending
imap <C-h> BLOCKED
