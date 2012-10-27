" Vim color file
"
" Author: Pratheek <github.com/pychimp>
" Version: 1.6.0
" Port of the LightTwist theme I had 
" created for 256 Terminal, to Gui Vim interface.
"
hi clear

set background=light

let g:colors_name="hexlt"

" First, The Normal

hi Normal guifg=#262626 guibg=#dadada gui=none

" --------------------------------------------------------------------
" Languages Stuff

hi Comment       guifg=#60bdf4 guibg=NONE    gui=NONE     
hi Constant      guifg=#0000d7 guibg=NONE    gui=NONE        
hi String        guifg=#008700 guibg=NONE    gui=NONE      
hi Character     guifg=#8700af guibg=NONE    gui=NONE    
hi Number        guifg=#5f00ff guibg=NONE    gui=NONE        
hi Boolean       guifg=#875faf guibg=NONE    gui=NONE       
hi Float         guifg=#5f00ff guibg=NONE    gui=NONE         
hi Identifier    guifg=#00af5f guibg=NONE    gui=NONE    
hi Function      guifg=#af005f guibg=NONE    gui=NONE      
hi Statement     guifg=#005fd7 guibg=NONE    gui=NONE     
hi Keyword       guifg=#005fff guibg=NONE    gui=NONE      
hi Exception     guifg=#af5f00 guibg=NONE    gui=NONE     
hi Conditional   guifg=#af8700 guibg=NONE    gui=NONE
hi PreProc       guifg=#5faf00 guibg=NONE    gui=NONE
hi Include       guifg=#00875f guibg=NONE    gui=NONE
hi Type          guifg=#870000 guibg=NONE    gui=NONE
hi StorageClass  guifg=#875f00 guibg=NONE    gui=NONE
hi Special       guifg=#d75f5f guibg=NONE    gui=NONE
hi Tag           guifg=#ff87d7 guibg=NONE    gui=NONE
hi Underlined    guifg=#af87ff guibg=NONE    gui=NONE
hi Ignore        guifg=#808080 guibg=NONE    gui=NONE
hi Error         guifg=#870000 guibg=#ffa40b gui=NONE
hi TODO          guifg=#ff0087 guibg=#ffff87 gui=NONE

" --------------------------------------------------------------------
" Extended Highlighting

hi NonText       guifg=#838383 guibg=NONE    gui=NONE       
hi Visual        guifg=#262626 guibg=#ffff4d gui=NONE
hi ErrorMsg      guifg=#870000 guibg=#ffa40b gui=NONE
hi IncSearch     guifg=#262626 guibg=#ff9933 gui=NONE
hi Search        guifg=#262626 guibg=#ff9933 gui=NONE
hi MoreMsg       guifg=#262626 guibg=NONE    gui=NONE
hi ModeMsg       guifg=#262626 guibg=NONE    gui=NONE
hi LineNr        guifg=#838383 guibg=NONE    gui=NONE
hi VertSplit     guifg=#eeeeee guibg=#eeeeee gui=NONE
hi VisualNOS     guifg=#262626 guibg=#ffff4d gui=NONE
hi Folded        guifg=#008080 guibg=#c1cdc1 gui=NONE
hi DiffAdd       guifg=#ffffff guibg=#00cc00 gui=NONE
hi DiffChange    guifg=#ffffff guibg=#b300b3 gui=NONE
hi DiffDelete    guifg=#ffffff guibg=#cd0000 gui=NONE
hi DiffText      guifg=#ffffff guibg=#008040 gui=NONE
hi SpellBad      guifg=#d80000 guibg=#ffff9a gui=NONE
hi SpellCap      guifg=#8b4600 guibg=#ffff9a gui=NONE
hi SpellRare     guifg=#ff0000 guibg=#ffff9a gui=NONE
hi SpellLocal    guifg=#008b00 guibg=#ffff9a gui=NONE
hi StatusLine    guifg=#000000 guibg=#8d8d8d gui=NONE
hi StatusLineNC  guifg=#ffffff guibg=#b3b3b3 gui=NONE
hi Pmenu         guifg=#586e75 guibg=#002b36 gui=NONE
hi PmenuSel      guifg=#cb4b16 guibg=#002b36 gui=NONE
hi PmenuSbar     guifg=#002b36 guibg=#002b36 gui=NONE
hi PmenuThumb    guifg=#002b36 guibg=#002b36 gui=NONE
hi MatchParen    guifg=#000000 guibg=#ff4040 gui=NONE
hi CursorLine    guifg=NONE    guibg=#b4b4b4 gui=NONE
hi CursorColumn  guifg=NONE    guibg=#a4c639 gui=NONE
