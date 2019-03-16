 set nocompatible
 filetype off

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'scrooloose/nerdtree'
 Plugin 'tpope/vim-surround'
 Plugin 'SirVer/ultisnips'
 Plugin 'honza/vim-snippets'

call vundle#end()
set t_Co=256
syntax on
autocmd VimEnter * wincmd p
set number
set rnu
filetype plugin indent on
filetype plugin on

let mapleader = " "
"git grep for work under cursor
nnoremap <Leader>g yiw:!git grep <C-R>" <CR>
"open filename in current buffer (contained in system clipboard)
nnoremap <Leader>ob :e <C-R>+ <CR>
"open filename in vertical split (contained in system clipboard)
nnoremap <Leader>ov :vsp <C-R>+ <CR>
"open filename in horizontal split (contained in system clipboard)
nnoremap <Leader>os :sp <C-R>+ <CR>
"open filename in new tab (contained in system clipboard)
nnoremap <Leader>ot :tabnew <C-R>+ <CR>
"save
nnoremap <Leader>s :w <CR>
"quit
nnoremap <Leader>q :q <CR>
"next tab
nnoremap <Leader>tn :tabnext <CR>
"prev tab
nnoremap <Leader>tp :tabprev <CR>
"nerdTree
nnoremap <Leader>tr :NERDTree <CR>
"jump to ctags definition
nnoremap <Leader>j <C-]>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"Clear search
nnoremap <silent> <Leader><Leader> :nohlsearch <CR>

hi CursorLineNr term=bold ctermfg=21
hi LineNr term=bold ctermfg=LightGrey
hi cStorageClass ctermfg=Green
hi cType ctermfg=41
hi cStructure ctermfg=41
hi cRepeat ctermfg=Green
hi cConditional ctermfg=Green
hi Visual cterm=reverse ctermbg=NONE
hi cStatement ctermfg=DarkGreen
hi cDefine ctermfg=DarkCyan
hi cString ctermfg=21
hi cNumber ctermfg=21
hi cDefine ctermfg=25
hi cConstant ctermfg=54
hi cOperator ctermfg=68
hi cUserLabel ctermfg=77
hi MatchParen cterm=bold ctermbg=none ctermfg=50

"Enable mouse scroll in tmux
set mouse=a
set autoindent
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
set timeoutlen=1000 ttimeoutlen=0
"Disable statusline
set laststatus=0

set tags=tags;/
set exrc
set secure

