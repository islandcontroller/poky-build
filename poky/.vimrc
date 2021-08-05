so ~/.vim/plugins.vim

syntax on

set t_Co=256

set mouse=a
set ttymouse=xterm2

nnoremap <S-Up>	:m .-2<CR>==
nnoremap <S-Down> :m .+1<CR>==
inoremap <S-Up> <Esc>:m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

map <C-o> :NERDTreeToggle<CR>

set number
set relativenumber
set linespace=12

set title
set titlestring=%F\ -\ vim

set expandtab
set smarttab
set linebreak
set breakindent
set nostartofline

set backspace=indent,eol,start

set shiftwidth=2
set tabstop=2

colorscheme gruvbox
set background=dark    

set laststatus=2

let g:gruvbox_vert_split = 'bg1'
let g:gruvbox_sign_column = 'bg0'

if &term =~ '^screen'
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif

let g:lightline = {
			\ 'colorscheme': 'wombat',
      \ }
