" Plugin setup using vim-plug
so ~/.vim/plugins.vim

" 256-color support
set t_Co=256

" Mouse support
set mouse=a
set ttymouse=xterm2

" Keyboard mappings
" - Shift+Up/Dn for moving lines or vblocks
nnoremap <S-Up>	:m .-2<CR>==
nnoremap <S-Down> :m .+1<CR>==
inoremap <S-Up> <Esc>:m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv
" - Ctrl+o for NERDtree pane
map <C-o> :NERDTreeToggle<CR>

" Syntax highlighting
syntax on

" Line numbering
set number
set relativenumber
set linespace=12

" Window title
set title
set titlestring=%F\ -\ vim

" Indentation settings
set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set nostartofline
set expandtab
set smarttab

" Line breaks
set linebreak
set breakindent

" Lightline setup
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

" Gruvbox color scheme 
let g:gruvbox_italic=1
let g:gruvbox_bold=1
colorscheme gruvbox
set background=dark    
let g:gruvbox_vert_split = 'bg1'
let g:gruvbox_sign_column = 'bg0'

" Arrow key forwarding for screen-* terminals (e.g. tmux)
if &term =~ '^screen'
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif

