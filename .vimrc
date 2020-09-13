set modeline
colorscheme industry
hi Normal guibg=NONE ctermbg=NONE

set number relativenumber
set numberwidth=2

" set mouse=a

set tabstop=4
"set expandtab
set smartindent
"set autoindent
set shiftwidth=4
set foldmethod=syntax
set linebreak

:map <F5> :w<return>:!tmux run-shell -t 2 "make"<return>:!tmux run-shell -t 2 "clear"<return><return>
:map <F9> !tmux run-shell -t 2 "clear"<return>
:map <c-k> <C-y>
:map <c-j> <C-e>
:map <c-h> zh
:map <c-l> zl

