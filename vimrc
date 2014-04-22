""""" GENERAL
set nocompatible               " We're running Vim, not Vi!
syntax on                      " Enable syntax highlighting
filetype on                    " Enable filetype detection
filetype indent on             " Enable filetype-specific indenting
filetype plugin on             " Enable filetype-specific plugins
set viminfo='10,\"100,:20,%,n~/.viminfo  " Save practically everything session to session.
set history=1000               " How many lines of history to remember.
set ruler                      " Always show current positions along the bottom.
set nohlsearch                 " Do not highlight search terms.
set showmatch                  " When a bracket is inserted, briefly jump to the matching one.
set hid                        " Allow switching between buffers w/o saving.
set lz                         " Do not redraw while running macros.
set backspace=2                " Make backspace work normal.
set incsearch                  " Search as you type.
set number                     " Turn on line numbers.
set wildmode=longest,list      " Tab completion with list instead of cycling.
noremap <C-J> <C-W>j           " Easy window switching
noremap <C-K> <C-W>k           " Easy window switching
noremap <C-H> <C-W>h           " Easy window switching
noremap <C-L> <C-W>l           " Easy window switching
map <Leader>ww :b#<CR>:bd#<CR> " Close buffer w/o closing a window.
setlocal omnifunc=syntaxcomplete#Complete " Autocomplete for everything.

""""" TABS
set tabstop=4               " Tabs only.
set shiftwidth=4            " Tabs are four spaces each.
function! BenIndent()       " Function for tabbing whole file
	let oldLine=line('.')
	normal(gg=G)
	execute ':' . oldLine
endf
map -- :call BenIndent()<cr>


""""" MINIBUFEXPL
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

""""" DEBUGGER                                                                                                                                                                                                                                                          [4/9774]
let g:debuggerMiniBufExpl = 1
let g:debuggerMaxChildren = 128
let g:debuggerMaxData = 131072
let g:debuggerMaxDepth = 30

let g:debuggerPort = 9000

""""" PHP
set makeprg=php\ -l\ %
set autowrite
set errorformat=%m\ in\ %f\ on\ line\ %l
set tags=tags;/
if has("autocmd")
	" Make $ a word character for php.
	autocmd FileType php set iskeyword+=$
endif

set path=.,modules,templates

""""" SYNTASTIC
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

""""" FOLDING
set foldenable
set foldmethod=indent
set foldlevel=100

function! RemoveWhite()
	exec "%s/\s*$//g"
endfunc

"""" Highlight Unwanted Whitespace
highlight RedundantWhitespace ctermbg=blue guibg=blue
match RedundantWhitespace /\s\+$\| \+\ze\t/
