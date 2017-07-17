" Some more automating stuff
"
" Thanks to @mhinz
" Make a fugitive status for the statusline
"
function! prat#fugitive_status()
    let gitstat = ''
    if exists('b:git_dir')
        let branch = fugitive#head(8)
        let branch_val = (branch == 'master') ? 'master' : branch
        let gitstat = 'G:' . branch_val
    endif
    return gitstat
endfunction

" Taken from ale's README
" Show ALE status
"
function! prat#ale_status() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '[OK]' : printf(
    \   '[%dW %dE]',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

" Taken from scrooloose's blogpost
" return '[&et]' if &et is set wrong
" return '[mixed-indenting]' if spaces and tabs are used to indent
" return an empty string if everything is fine
function! prat#stl_tab_warning()
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

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! prat#stl_trailing_space_warning()
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

