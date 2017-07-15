"╭───────────────────────────╮
"│ ╻ ╻╻┏┳┓┏━┓┏━╸   ┏━╸╻╻  ┏━╸│
"│ ┃┏┛┃┃┃┃┣┳┛┃     ┣╸ ┃┃  ┣╸ │
"│ ┗┛ ╹╹ ╹╹┗╸┗━╸   ╹  ╹┗━╸┗━╸│
"╰───────────────────────────╯
"
" Plugins ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/bundle')

Plug 'ervandew/supertab'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown', {'for' : 'markdown'}
Plug 'ctrlpvim/ctrlp.vim', {'on' : 'CtrlP'}
Plug 'notpratheek/vim-luna'
Plug 'notpratheek/vim-sol'
Plug 'rstacruz/sparkup', {'for' : 'html'}
" Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'maralla/completor.vim'
Plug 'google/vim-searchindex'
Plug 'w0rp/ale'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

call plug#end()
" }}}
" Preamble ---------------------------------------------------------------- {{{
"
" No explanation needed
set nocompatible
set shell=/bin/bash
" }}}
" Settings ---------------------------------------------------------- {{{
"
" Better than just /<search term>
" Also, `\v` enables use of Perl compatible regexes
nmap / /\v
syntax on
" enable loading the indent file for specific file types
filetype indent on
" enable loading the plugin files for specific file types
filetype plugin on
" switch on syntax highlighting
syntax enable
" set a light background

set hidden

set dictionary=/usr/share/dict/words

set textwidth=85

" augroup test_group
"     autocmd!
"     au Filetype * highlight ExtraWhiteSpace guibg=red
"     au Filetype * match ExtraWhiteSpace /\s\+$/
" augroup END

" Have a different colorscheme for GUI and console version of Vim
if has('gui_running')
    set background=light
    colorscheme sol
else
    set background=dark
    colorscheme sol-term
endif

" Use ag over grep
" set grepprg=ag\ --nogroup\ --nocolor
set grepprg=rg\ --color=never
" I'm going to try to put a comment above most of these `set` stuff,
" but if its not present, just do a `:h` for that

" Always have a status bar
set laststatus=2
" UTF-8 encoding
set encoding=utf-8
" Number of colors
set t_Co=256
" line number
set number
set autoindent
set smartindent
set incsearch
" set listchars=tab:∙∙,eol:¬,trail:·
set listchars=tab:∙∙,trail:·,
set list

" Can *NEVER* settle with one font ! :D
" set guifont=Menlo\ for\ Powerline\ 13
" set guifont=Monaco\ for\ Powerline\ 13
" set guifont=Inconsolata\ Medium\ 17
" set guifont=Source\ Code\ Pro\ 15
" set guifont=DejaVu\ Sans\ Mono\ 15
set guifont=Fira\ Mono\ 15

set hlsearch
set wildmenu
" only show the ColorColumn when the cursor is on the 80th char of that line
call matchadd('ColorColumn', '\%81v', 100)
set cursorline
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set foldlevel=99
set foldmethod=indent
set breakindent
set noswapfile

" swap files in a dir
set directory=~/.vim/swaps//

" set undofile and an undo dir
set undodir=~/.vim/undos//
set undofile

" Remember more previously used stuff
set history=1000

" Better term setting (read :h ttyfast for better understanding)
set ttyfast

" Stops screen from redrawing when macros are being executed
set lazyredraw

" NO WRAP ! EVER !
" This is especially usefull for `:vertical h <topic>`
set nowrap

" case insensitive commands
" Eg -- :start<Tab> ==> :Startify
set ignorecase smartcase

" Amount of time taken to show the matching paren
" (This is in tenths of a sec)
set matchtime=3

" Better completion
" do a `:h 'complete'`
set complete=.,w,b,u,t
" do a `:h 'completeopt'`
"set completeopt=longest,menuone,preview,menu
set completeopt=longest,menuone,menu

" I think all these guioptions should be in gvimrc,
" but since vimrc loads faster, I've added them here

" Empty string = No GUI features !
set guioptions=

" too many times :W ! Hence, the shortcut
ca W w
ca Qa qa
ca Wqa wqa
ca qa1 qa!
ca qA1 qa!
ca qA! qa!

" re-center the search results to the center of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Status line stuff {{{
" Begin Status line
"set statusline=\
" Show the mode
"set statusline+=%{toupper(mode())}\
" Buffer number
"set statusline+=[%n]\
" file name (full path of the file)
"set statusline+=%F\
" is file modified ?
"set statusline+=%m\
" shift stuff to right
"set statusline+=%=\
" is file READONLY?
"set statusline+=%r\
" Fugitive status
"set statusline+=%{fugitive#statusline()}\
" more to right
"set statusline+=%=\
" encoding
"set statusline+=%{(&fenc==\"\"?&enc:&fenc)}\
" fancy file format (first letteruppercase, rest of the letters lowercase)
" Eg -- html shown as Html
"set statusline+=%{toupper(strpart(&filetype,0,1)).strpart(&filetype,1)}\
" (current line:current column / total lines in file)
"set statusline+=%10(%l:%c/%L%)\
" percent position in the file
"set statusline+=%4(%p%%%)\

"set statusline+=%#error#
"set statusline+=%{StatuslineTabWarning()}
"set statusline+=%{StatuslineTrailingSpaceWarning()}
"set statusline+=%*


set statusline=\ %{toupper(mode())}\ [%n]\ %F\ %m\ %=\ %r\ %{fugitive#statusline()}\ %=\ %{(&fenc==\"\"?&enc:&fenc)}\ %{toupper(strpart(&filetype,0,1)).strpart(&filetype,1)}\ %10(%l:%c/%L%)\ %4(%p%%%)\ %#error#%{StatuslineTabWarning()}%{StatuslineTrailingSpaceWarning()}%*


" scrooloose's whitespace warning {{{
" display a warning if &et is wrong, or we have mixed-indenting

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction
" }}}
" scrooloose's trailing whitespace warning {{{
"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction
" }}}
"
" }}}
"
" }}}
" Mind Hacks -------------------------------------------------------------- {{{
"
" Better <C-^> hack !
" nnoremap <C-Tab> :buffers<CR>:b<Space>
nnoremap <C-Tab> :CtrlPBuffer<CR>
" ---------------------------------------------------------------------------
" with the default `:e` I'll have to remember the path of the file (which is hard)
" So, remap `:e` to run `:CtrlPMRUFiles`
" Pros : No need to remember the path, CtrlP will find it for you.
" Cons : Requires CtrlP (dependency) and
"           commands that start with e will be hard to type.
"           (You'll have to hit `:` and wait about a half a sec or so
"           to start typing the command, starting with 'e')
nnoremap :e :CtrlPMRUFiles<CR>
" ---------------------------------------------------------------------------
" clear serached stuff
nnoremap <C-S-c> :let @/=""<CR>
" ---------------------------------------------------------------------------
" Show syntax highlighting groups for word under cursor
" Thanks to Drew Neil from vimcasts
nmap <A-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" ---------------------------------------------------------------------------
" Returns cursor to last position before quitting
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END
" ---------------------------------------------------------------------------
" Thanks to Steve Losh
" "Uppercase word" mapping.
"
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving
" back to the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it,
" but if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za
" ---------------------------------------------------------------------------
"}}}
" <F5> FileType Runners and Builders -------------------------------------- {{{
"
" Python {{{
augroup ft_python
    au!
    " Run the code in `%` (path/to/file) in python
    " Damn the <leader>r in python-mode for python3
    au Filetype python nnoremap <F5> :<C-u> ! python3 %<CR>
augroup END
"}}}
" LaTeX/Tex  {{{
augroup ft_tex
    au!
    au Filetype tex nnoremap <F5> :<C-u>!pdflatex %<CR>
    au Filetype tex nnoremap <F6> :<C-u>!xdg-open %:r."pdf"<CR>
augroup END
" }}}
" C {{{
augroup ft_c
    au!
    " Build the given .c file
    " by giving `%` as the arg (which is path/to/file)
    " and store the built binary file in the same path
    "
    " Best explained with example:
    " Let's say file name is foo_bar.c
    " Then, this makes it `:! gcc -Wall foo_bar.c -o foo_bar.c.o`
    " (Slightly bad in naming the bin file ! ;) )
    "
    " This also works in this case.
    " $ gvim ~/foo/bar/baz/dumb.c
    " Then, this runs as:
    " `:!gcc -Wall ~/foo/bar/baz/dumb.c -o ~/foo/bar/baz/dumb.c.o`
    "
    au Filetype c nnoremap <F5> :<C-u> ! gcc -Wall % -o %.o<CR>
augroup END
" }}}
" ---------------------------------------------------------------------------
" }}}
" Wild Ignore ------------------------------------------------------------- {{{
"
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.oo,*.obj,*.exe,*.dll       " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*.class                          " Java Class files
set wildignore+=$VIMRUNTIME/doc/*.txt            " Individual helpfiles
set wildignore+=$VIMRUNTIME/doc/*.tar.gz         " compressed helpfiles
" For the `**` meaning, do a `:h starstar-wildcard`
set wildignore+=**/doc/*.txt
" ---------------------------------------------------------------------------
"}}}
" Auto Commands ----------------------------------------------------------- {{{
" General filetype {{{
" ---------------------------------------------------------------------------
" Resize splits when the window is resized
au VimResized * :wincmd =
" ---------------------------------------------------------------------------
" }}}
" CSS {{{
au syntax css setlocal omnifunc=csscomplete#CompleteCSS
au syntax css setlocal completefunc=csscomplete#CompleteCSS
" }}}
" Python {{{
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType *.py set textwidth=79 shiftwidth=4 tabstop=4 expandtab softtabstop=4 shiftround autoindent
au FileType python syn keyword pythonDecorator True None False self
" }}}
" HTML {{{
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" }}}
" ---------------------------------------------------------------------------
" }}}
" Custom Functions and Other stuff ---------------------------------------- {{{
" Template stuff {{{
" http://got-ravings.blogspot.in/2008/08/vim-pr0n-simple-template-engine.html
"
" define the Template command
command! -complete=customlist,AvailableTemplates -n=1 Template :call InsertTemplate('<args>')

function! InsertTemplate(name)
    " read a template
    execute 'read ~/.vim/templates/' . &filetype . '/' . a:name
    " if cursor was on a blankline, delete it
    if getline(line(".")-1) =~ '^\s*$'
        exec line(".")-1 . 'd'
    endif
endfunction

function! AvailableTemplates(lead, cmdline, cursorpos)
    let templateDir = expand('~/.vim/templates' . &filetype . '/')
    let files = split(globpath(templateDir, a:lead . '*'), '\n')
    return map(files, 'strpart(v:val,strlen(templateDir))')
endfunction
" }}}
" Nyan cat {{{
command! NyanMe call NyanMe()
" ---------------------------------------------------------------------------
function! NyanMe()
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
endfunction
" }}}
" Spell Checker ----------------------------------------------------------- {{{

if has("spell")
  " turn spelling on by default
  " set spell

  " toggle spelling with F4 key
  nnoremap <F7> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

  " they were using white on white
  highlight PmenuSel ctermfg=black ctermbg=lightgray

  " limit it to just the top 10 items
  set sps=best,10
endif
" }}}
" ---------------------------------------------------------------------------
" }}}
" Plugin Settings --------------------------------------------------------- {{{
" Startify {{{

let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_session_dir = '~/.vim/session'
let g:startify_bookmarks = [
            \ '~/.Xresources',
            \ '~/.vim/vimrc',
            \ '~/.config/i3/config',
            \ '~/.config/i3/i3status.conf'
            \ ]
let g:startify_files_number = 8
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_skiplist = [
            \ '.git/COMMIT_EDITMSG',
            \ '.gtkrc-2.0',
            \ '/usr/share/vim/vim74/doc',
            \ '/etc/*',
            \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') . 'doc',
            \ 'bundle/.*/doc'
            \ ]

let g:startify_relative_path = 1
let g:startify_update_oldfiles = 1
autocmd User Startified let &l:stl = ' Startify'
let g:startify_custom_header = []
let g:startify_list_order = [
            \ ['   MRU:'],
            \ 'files',
            \ ['   Sess:'],
            \ 'sessions',
            \ ['   Markers:'],
            \ 'bookmarks'
            \ ]
" Startify Custom Header
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
" }}}
" CtrlP {{{

" make CtrlP exclude these type of files from adding to MRUFiles cache
" let g:ctrlp_custom_ignore = '~/bin'

""let g:ctrlp_custom_ignore = {
""            \ 'dir':  '\v[\/](bin|Torrents|Music|Pictures)$',
""            \ 'file': '\v(\.cpp|\.h|\.hh|\.cxx|\.srt|\.part)@<!$'
""            \ }
""let g:ctrlp_custom_ignore = {
""            \ 'dir':  '\v[\/]\.(git|hg|svn|)$',
""            \ 'file': '\v\.(exe|so|dll|srt|txt|part)$',
""            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
""            \ }
let g:ctrlp_mruf_exclude = '*.tar.gz\|bin|.git|*.srt|*.part|*.txt'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_show_hidden = 1

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
" let g:ctrlp_user_command = 'ag %s -p /home/pratheek/.agignore -l --nocolor --hidden -g \""'
let g:ctrlp_user_command = 'rg %s --files -g ""'

" reuse startify window
let g:ctrlp_reuse_window = 'startify'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
" }}}
" SuperTab {{{

" let g:SuperTabDefaultCompletionType = \"<c-p>"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrMapping = 1
" }}}
" Indent Guides {{{

let g:indent_guides_guide_size = 1
" let g:indent_guides_enable_on_vim_startup = 1
" }}}
" Vim-G (Search Google from G/Vim itself !) {{{

let g:vim_g_open_command = "xdg-open"
let g:vim_g_perl_command = "perl"
let g:vim_g_query_url = "http://google.co.in/search?q="
" }}}
" Signify {{{
let g:signify_sign_show_text = 0
" }}}
" Completor {{{
let g:completor_python_binary = '/usr/bin/python3'
let g:completor_completion_delay = 20
let g:completor_min_chars = 1
"}}}
" ALE {{{
" !!! Requires `autopep8`, `isort` to be installed
" !!! (might as well also have `flake8` installed)
let g:ale_fixers = {'python' : ['isort','autopep8']}
let g:ale_python_autopep8_options = '--aggressive'
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
"}}}
" ---------------------------------------------------------------------------
"}}}
"
" vim:foldmethod=marker:foldlevel=0:textwidth=79
