set nocompatible

call pathogen#infect()

set t_Co=256
set number
set ai
set si
syntax on
filetype indent plugin on
syntax enable
set background=light
set guifont=Monaco\ for\ Powerline\ 13
set guioptions-=T "removes toolbar
set guioptions-=r "removes right scroll bar
set guioptions-=m "removes menubar
set hlsearch
set cursorline
set wildmenu
set colorcolumn=80

let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

if has('gui_running')
    colorscheme solarized
else
    colorscheme LightTwist
endif

set statusline=
set statusline+=(%t)\ 
set statusline+=%m\ 
set statusline+=%=\ 
set statusline+=%r\ 
set statusline+=%Y\ 
set statusline+=(%l/%L)\ 
set statusline+=(%p%%)\ 

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4    
filetype indent on

set foldmethod=indent
set foldlevel=99

autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class 

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "<c-p>"

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

set nocompatible 
set laststatus=2 
set encoding=utf-8

let g:Powerline_symbols = 'compatible'

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Key mapping for tab switching 
:nmap <C-t> :tabnew<CR>
:map <C-x> :tabclose<CR>
:map <C-h> :tabprevious<CR>
:map <C-l> :tabnext<CR> 
