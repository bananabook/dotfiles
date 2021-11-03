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

":map <F5> :w<return>:!tmux run-shell -t 2 "make"<return>:!tmux run-shell -t 2 "clear"<return><return>
:map <F9> !tmux run-shell -t 2 "clear"<return>
:map <c-k> <C-y>
:map <c-j> <C-e>
:map <c-h> zh
:map <c-l> zl
:map <F2> :set number! relativenumber!<return>
:map <F3> :set wrap!<return>
:map <F4> :set cursorline!<return>
:noremap ' `
:inoremap jk <ESC>

"" tab visualization
:set list
":set listchars=tab:\ \|     " > is shown at the beginning, - throughout
:set listchars=tab:\|\     " > is shown at the beginning, - throughout

execute "set <M-j>=\ej"
nnoremap <M-j> gj
execute "set <M-k>=\ek"
nnoremap <M-k> gk

"""""""""""""""""""""
":set expandtab
":set tabstop=3
":set shiftwidth=3
"""""""""""""""""""""
digraph bp 8226
