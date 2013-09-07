" I promise to clean up my vimrc one day !

set nocompatible

execute pathogen#infect()

set laststatus=2

set encoding=utf-8

set t_Co=256
set number
set ai
set si
set incsearch
nmap / /\v
syntax on
filetype indent plugin on
syntax enable
set background=light
" set guifont=Menlo\ for\ Powerline\ 13
set guifont=Monaco\ for\ Powerline\ 13
set guioptions-=T "removes toolbar
set guioptions-=r "removes left, right, bottom(for :sp) scroll bar
set guioptions-=R "removes left, right, bottom(for :sp) scroll bar
set guioptions-=l "removes left, right, bottom(for :sp) scroll bar
set guioptions-=L "removes left, right, bottom(for :sp) scroll bar
set guioptions-=m "removes menubar
set hlsearch
set wildmenu
set colorcolumn=80
set cursorline

let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':~:.'
" let g:airline#extensions#tabline#fnamemod = ':t:~'
" let g:airline#extensions#tabline#fnamemod = ':p:~'

let g:indent_guides_guide_size = 1
" let g:indent_guides_enable_on_vim_startup = 1

if has('gui_running')
    colorscheme luna
else
    colorscheme luna-term
endif


" set statusline=
" set statusline+=(%t)
" set statusline+=%m\
" set statusline+=%=\
" set statusline+=%r\
" set statusline+=%{fugitive#statusline()}
" set statusline+=%=\
" set statusline+=%Y\
" set statusline+=(%l/%L)\
" set statusline+=(%p%%)\

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on

set foldmethod=indent
set foldlevel=99

" Better <C-^> hack !
" :nnoremap <C-^> :buffers<CR>:b<Space>

" using tabline (built-in with airline)
nnoremap <C-Tab> :tabnext<CR>

" Damn the <leader>r in python-mode for python3
nnoremap <F5> :<C-u> ! python3 %<CR>

autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "<c-p>"

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self


" Show syntax highlighting groups for word under cursor
nmap <A-S-P> :call <SID>SynStack()<CR>
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

" Returns cursor to last position before quitting
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Nyan cat
function! NyanMe() " {{{
    hi NyanFur guifg=#BBBBBB
    hi NyanPoptartEdge guifg=#ffd0ac
    hi NyanPoptartFrosting guifg=#fd3699 guibg=#fe98ff
    hi NyanRainbow1 guifg=#6831f8
    hi NyanRainbow2 guifg=#0099fc
    hi NyanRainbow3 guifg=#3cfa04
    hi NyanRainbow4 guifg=#fdfe00
    hi NyanRainbow5 guifg=#fc9d00
    hi NyanRainbow6 guifg=#fe0000


    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanFur
    echon "╰"
    echohl NyanPoptartEdge
    echon "⟨"
    echohl NyanPoptartFrosting
    echon "⣮⣯⡿"
    echohl NyanPoptartEdge
    echon "⟩"
    echohl NyanFur
    echon "⩾^ω^⩽"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echon " "
    echohl NyanFur
    echon "” ‟"
    echohl None

    sleep 1
    redraw
    echo " "
    echo " "
    echo "Noms?"
    redraw
endfunction " }}}
command! NyanMe call NyanMe()


" unicode symbols
let g:airline_branch_prefix = '⎇  '
let g:airline_paste_symbol = 'ρ'

" Reducing mode strings to a single chars
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

"function! AirlineInit()
"    let g:airline_section_a = airline#section#create(['mode'])
"    let g:airline_section_b = airline#section#create_left(['hunks'])
"    let g:airline_section_c = airline#section#create(['%f'])
"    let g:airline_section_y = airline#section#create_right(['branch', 'ffenc'])
"endfunction
"autocmd VimEnter * call AirlineInit()

let g:startify_bookmarks = [ '~/.vimrc' ]
let g:startify_files_number = 12
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_skiplist = [
                \ '.git/COMMIT_EDITMSG',
                \ '.gtkrc-2.0',
                \ '/usr/share/vim/vim74/doc'
                \ ]


"let g:startify_custom_header = [
            "\ '  .____---^^     ^^---____.                                                      ',
            "\ '  TI      *       *      IT  Three Rings for the Elvin-Kings under the sky.      ',
            "\ '  !I          *          I!  Seven for the DwarfLords in their halls of stone.   ',
            "\ '   X                     X       Nine for the Mortal Men doomed to die.          ',
            "\ '   XL                   JX       One for the Dark Lord on his dark throne.       ',
            "\ '   II        / \        II   In the Land of Mordor where the Shadow Lies.        ',
            "\ '   II   / \ /   \ / \   II                                                       ',
            "\ '    X  /   v     v   \  X       One Ring to rule them all,One Ring to find them, ',
            "\ '    ``/    _     _    \''     One Ring to bring them all and in the Darkness     ',
            "\ '     \\- _-_ -_- _-_ -//         Bind Them                                       ',
            "\ '       \\_-  -_-  -_//          In the Land of Mordor where the Shadows Lie.     ',
            "\ '         ``       ''                                                             ',
            "\ '           ``-_-''                                                               ',
            "\ '                                                    "Lord Of THe Rings"          ',
            "\ '                                                          by J.R.R. Tolkien      ',
            "\ '',
            "\ ]
