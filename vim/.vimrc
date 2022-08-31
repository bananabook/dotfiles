set autoread
set modeline
"colorscheme industry
hi Normal guibg=NONE ctermbg=NONE

set number relativenumber
set numberwidth=2

" set mouse=a

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

":map <F5> :w<return>:!tmux run-shell "make"<return>:!tmux run-shell -t 2 "clear"<return><return>
:map <F5> :w<return>:!make<return><return>
:map <F9> !tmux run-shell -t 2 "clear"<return>
:map <c-k> <C-y>
:map <c-j> <C-e>
:map <c-h> zh
:map <c-l> zl
:map <F2> :set number! relativenumber!<return>
:map <F3> :set wrap!<return>
:map <F4> :set cursorline!<return>
:noremap ' `
:inoremap kj x<BS><ESC>

":let searchbak=@/<CR>
":let @/=searchbak<CR>
"nnoremap gd /\%<C-R>=virtcol(".")<CR>v\S<CR>
"
"nnoremap gu ?\%<C-R>=virtcol(".")<CR>v\S<CR>


"" tab visualization
:set list
":set listchars=tab:\ \|     " > is shown at the beginning, - throughout
:set listchars=tab:\|\     " > is shown at the beginning, - throughout
:set listchars+=eol:\€     " > is shown at the beginning, - throughout
":set listchars+=space:·     " > is shown at the beginning, - throughout


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
digraph fs 9733 "★
digraph es 9734 "☆

"" hide status
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

"nnoremap <F5> :call ToggleHiddenAll()<CR>
"" hide status -end-
set background=dark
"autopaste
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"autopaste end

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" make it possible to leave edited and unstored buffers
set hidden

"" indent backjump
"set indentexpr=GetIndent()
"
"function GetIndent()
"   let lnum = prevnonblank(v:lnum - 1)
"   let ind = indent(lnum)
"   return ind
"endfunction
