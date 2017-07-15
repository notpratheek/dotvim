" Thanks to mhinz for this !
"
" Original file from mhinz
" located here: https://github.com/mhinz/dotfiles/blob/master/.vim/autoload/mhi.vim
"
" This file is only a subset of that file.
"------------------------------------------------------------------------------
"
"
" Showing [+1 -2 ~3] in statusline.
"
function! mhi#sy_stats_wrapper()
  let symbols = ['+', '-', '~']
  let [added, modified, removed] = sy#repo#get_stats()
  let stats = [added, removed, modified]  " reorder
  let hunkline = ''
  for i in range(3)
    if stats[i] > 0
      let hunkline .= printf('%s%s ', symbols[i], stats[i])
    endif
  endfor
  if !empty(hunkline)
    " let hunkline = '%3*[%5*'. hunkline[:-2] .'%3*]%*'
    let hunkline = '['. hunkline[:-2] .']'
  endif
  return hunkline
endfunction
