 set nocompatible
 filetype off

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'scrooloose/nerdtree'
 Plugin 'tpope/vim-surround'
 Plugin 'SirVer/ultisnips'
 Plugin 'honza/vim-snippets'
 Plugin 'jiangmiao/auto-pairs'

call vundle#end()
set t_Co=256
syntax on
autocmd VimEnter * wincmd p
set number
set rnu
set nois
set scrolloff=0
"set background=dark
"colorscheme PaperColor
filetype plugin indent on
filetype plugin on
autocmd BufWritePre * :%s/\s\+$//e

let mapleader = " "
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

nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"Clear search
nnoremap <silent> <Leader><Leader> :noh <CR>

set colorcolumn=80

hi CursorLineNr term=bold ctermfg=30
hi LineNr term=bold ctermfg=LightGrey
hi cStorageClass ctermfg=78
hi cType ctermfg=41
hi cppType ctermfg=41
hi cStructure ctermfg=50
hi cRepeat ctermfg=Green
hi cConditional ctermfg=Green
hi Visual cterm=reverse ctermbg=NONE
hi cStatement ctermfg=DarkGreen
hi cDefine ctermfg=DarkCyan
hi cString ctermfg=80
hi cNumber ctermfg=50
hi cDefine ctermfg=25
hi cConstant ctermfg=49
hi cOperator ctermfg=68
hi cUserLabel ctermfg=77
hi cPreCondit ctermfg=12
hi Search ctermbg=black ctermfg=Green cterm=bold
hi MatchParen cterm=bold ctermbg=none ctermfg=50
hi ColorColumn ctermbg=black ctermfg=red cterm=bold

"Enable mouse scroll in tmux
set mouse=a
set autoindent
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
set timeoutlen=1000 ttimeoutlen=0

set tags=tags;/
set exrc
set secure
set cursorline

function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

"git grep for work under cursor
nnoremap <Leader>g yiw:Shell git grep <C-R>" <CR>
