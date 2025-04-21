" resize mode

" Define a function to leave resize mode
function! LeaveResizeMode()
    unmap <buffer> H
    unmap <buffer> J
    unmap <buffer> K
    unmap <buffer> L
    unmap <buffer> h
    unmap <buffer> j
    unmap <buffer> k
    unmap <buffer> l
    unmap <buffer> q
    echo "Exited Resize Mode."
endfunction
" Define a function to enter resize mode
function! EnterResizeMode()
    nnoremap <silent> <buffer> H :vertical resize -2<CR>
    nnoremap <silent> <buffer> J :resize +2<CR>
    nnoremap <silent> <buffer> K :resize -2<CR>
    nnoremap <silent> <buffer> L :vertical resize +2<CR>
    nnoremap <silent> <buffer> h <c-w>h
    nnoremap <silent> <buffer> j <c-w>j
    nnoremap <silent> <buffer> k <c-w>k
    nnoremap <silent> <buffer> l <c-w>l
    nnoremap <silent> <buffer> q :call LeaveResizeMode()<CR>
    echo "Entered Resize Mode. Use hjkl to resize, Esc to exit."
endfunction


" Create a command to enter resize mode
command! ResizeMode call EnterResizeMode()



let mapleader = "\<Space>"
map <Leader>R :ResizeMode<CR>
map <Leader>m :windo set nonumber! norelativenumber!<return>
map <Leader>M :windo set norelativenumber!<return>
"map <Leader>t :set expandtab!<return>
map <Leader>K :set list!<return>
map <Leader>L :ls<return>
map <Leader>r :so ~/.vimrc<return>
"map <Leader>c :cd %:p:h<return>
map <Leader>t :set expandtab<return>:retab<return>
map <Leader>T :set noexpandtab<return>
map <Leader>w :w<return>
map <Leader>q :q<return>
map <Leader>d :bd<return>
map <Leader>D :r!date "+\%d.\%m.\%Y"<return>
map <Leader>f :f<return>

map <Leader>, :set scrolloff=4<return>
map <Leader>; :set scrolloff=0<return>

map <Leader>b :bn<return>
map <Leader>n :bp<return>

map <Leader>p :set paste<return>
map <Leader>P :set nopaste<return>

map <Leader>g :vs<return>
map <Leader>v :sp<return>

map <Leader>S :set tabstop=
map <Leader>h <c-w>h
map <Leader>j <c-w>j
map <Leader>k <c-w>k
map <Leader>l <c-w>l
map <Leader>z :call writefile(getreg('"',1,1), "/tmp/vim.buffer")<return>
map <Leader>Z :let @" = join(readfile("/tmp/vim.buffer"), "\n")<return>

map <Leader>u i<return><ESC>
map <Leader>U kgJx
vnoremap <Leader>t @t
"yo<c-r>"<esc>'<ma'>mbj0v$:!rev<return>0d$'av'bpjdd'b
"vnoremap <Leader>t y'>aa<esc>'<ii<esc>

:inoremap <c-g>{ {<CR>}<c-o>O

set autoread
set autochdir
set modeline
"colorscheme industry
hi Normal guibg=NONE ctermbg=NONE

set number relativenumber
set numberwidth=2

set mouse=

"set tabstop=4
set tabstop=2
"set expandtab
set smartindent
"set autoindent
"set shiftwidth=4
set shiftwidth=2
set foldmethod=manual
set linebreak
set ignorecase
set smartcase

" keep output after leaving vi
"set t_te=

:noremap J <c-e>
:noremap gJ J
:noremap K <c-y>
":map <F5> :w<return>:!tmux run-shell "make"<return>:!tmux run-shell -t 2 "clear"<return><return>
:map <F5> :w<return>:!make -i<return><return>
":map <F6> :!make -i<return><return>
:map <F9> !tmux run-shell -t 2 "clear"<return>
":map <c-i> <C-e>
":map <c-o> <C-y>
:map <c-h> <c-w>h
:map <c-j> <c-w>j
:map <c-k> <c-w>k
:map <c-l> <c-w>l
:inoremap <Esc> x<BS><ESC>
:inoremap <c-b> x<BS><ESC>

":map <c-h> zh
":map <c-l> zl
:map <F2> :set number! relativenumber!<return>
:map <F3> :set wrap!<return>
:map <F4> :set cursorline!<return>
:noremap j gj
:noremap gj j
:noremap k gk
:noremap gk k
":noremap <c-s> :w<cr>
":noremap <c-q> :q<cr>
":noremap <c-z> <c-y>
:noremap ' `
:inoremap kj x<BS><ESC>
" map ctrl-backspace to delete the word in front of cursor
":inoremap  <c-w>

":let searchbak=@/<CR>
":let @/=searchbak<CR>
"nnoremap gd /\%<C-R>=virtcol(".")<CR>v\S<CR>
"
"nnoremap gu ?\%<C-R>=virtcol(".")<CR>v\S<CR>


"" tab visualization
:set nolist
" make it possible to leave edited and unstored buffers
:set hidden
":set listchars=tab:\ \|     " > is shown at the beginning, - throughout
:set listchars=tab:\|\     " > is shown at the beginning, - throughout
:set listchars+=eol:\€     " > is shown at the beginning, - throughout
:set listchars+=space:·     " > is shown at the beginning, - throughout


execute "set <M-j>=\ej"
nnoremap <M-j> gj
execute "set <M-k>=\ek"
nnoremap <M-k> gk

"""""""""""""""""""""
":set expandtab
":set tabstop=3
":set shiftwidth=3
"""""""""""""""""""""
digraph bp 8226 "•
digraph <3 10084 "❤️
digraph :) 128516 "😄
digraph ;) 128521 "😉
digraph :D 128517 "😅
digraph ;P 128540 "😜
digraph :x 128584 "🙈
digraph :] 129302 "🤖
digraph :o 128559 "😯
digraph 0: 128519 "😇
digraph :\ 129300 "🤔
digraph :( 128577 "🙁
digraph :} 128524 "😌
digraph :> 128514 "😂
digraph fs 9733 "★
digraph es 9734 "☆
digraph ?! 8253 "‽
digraph !? 11800 "⸘
" tmux colour
set background=dark


""" "" hide status
""" let s:hidden_all = 0
""" function! ToggleHiddenAll()
"""     if s:hidden_all  == 0
"""         let s:hidden_all = 1
"""         set noshowmode
"""         set noruler
"""         set laststatus=0
"""         set noshowcmd
"""     else
"""         let s:hidden_all = 0
"""         set showmode
"""         set ruler
"""         set laststatus=2
"""         set showcmd
"""     endif
""" endfunction
""" 
""" "nnoremap <F5> :call ToggleHiddenAll()<CR>
""" "" hide status -end-
""" set background=dark
""" "autopaste
""" function! WrapForTmux(s)
"""   if !exists('$TMUX')
"""     return a:s
"""   endif
""" 
"""   let tmux_start = "\<Esc>Ptmux;"
"""   let tmux_end = "\<Esc>\\"
""" 
"""   return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
""" endfunction
""" 
""" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
""" let &t_EI .= WrapForTmux("\<Esc>[?2004l")
""" 
""" function! XTermPasteBegin()
"""   set pastetoggle=<Esc>[201~
"""   set paste
"""   return ""
""" endfunction
""" 
""" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
""" "autopaste end
""" 
""" " Don't screw up folds when inserting text that might affect them, until
""" " leaving insert mode. Foldmethod is local to the window. Protect against
""" " screwing up folding when switching between windows.
""" autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
""" autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
""" 
""" " make it possible to leave edited and unstored buffers
""" set hidden
""" 
""" "" indent backjump
""" "set indentexpr=GetIndent()
""" "
""" "function GetIndent()
""" "   let lnum = prevnonblank(v:lnum - 1)
""" "   let ind = indent(lnum)
""" "   return ind
""" "endfunction
