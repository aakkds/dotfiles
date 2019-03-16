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

hi CursorLineNr term=bold ctermfg=Magenta
hi LineNr term=bold ctermfg=34
hi cStorageClass ctermfg=Green
hi cType ctermfg=LightBlue
hi cStructure ctermfg=LightBlue
hi cRepeat ctermfg=Green
hi cConditional ctermfg=Green
hi Visual cterm=reverse ctermbg=NONE
hi cStatement ctermfg=DarkGreen
hi cDefine ctermfg=DarkCyan
hi cString ctermfg=21
hi cNumber ctermfg=21
hi cDefine ctermfg=25
hi cConstant ctermfg=34

"Enable mouse scroll in tmux
set mouse=a
set autoindent
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
set timeoutlen=1000 ttimeoutlen=0

set tags=tags;/
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction
set exrc
set secure
set tabline=%!MyTabLine()
function MyTabLine()
	let s = ''
	for t in range(tabpagenr('$'))
		if t+1==tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLines#'
		endif
		let s .= '%' . (t + 1) . 'T'
		let s .= ' '
		let s .=t+1 . ' '
		let n = ''
		let m =0
		let bc = len(tabpagebuflist(t+1))
		for b in tabpagebuflist(t+1)
			if getbufvar(b,"&buftype") == 'help'
				let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
			elseif getbufvar( b, "&buftype" ) == 'quickfix'
				let n .= '[Q]'
			else
				let n .= pathshorten(bufname(b))
			endif
			if getbufvar( b, "&modified")
				let m +=1
			endif
			if bc > 1
				let n .= ' '
			endif
			let bc-=1
		endfor
		if m> 0
			let s .= '[' . m . '+]'
		endif
		if t + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		if n==''
			let s .= '[New]'
		else
			let s .=n
		endif
		let s .= ' '
	endfor
	let s .= '%#TabLineFill#%T'
	if tabpagenr('$') > 1
		let s .= '%=%#TabLineFill#%999Xclose'
	endif
	return s
endfunction

