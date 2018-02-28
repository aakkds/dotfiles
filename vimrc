 set nocompatible 
 filetype off 
 
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin() 
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'scrooloose/nerdtree'
 Plugin 'tpope/vim-surround'
 Plugin 'jiangmiao/auto-pairs'
 "Plugin 'zenorocha/dracula-theme',{'rtp':'vim/'} 
 let g:ConqueGdb_GdbExe = 'arm-none-eabi-gdb'
 Plugin 'vim-scripts/Conque-GDB'
 
call vundle#end() 
filetype plugin indent on  
syntax on
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
set number 
set rnu
filetype plugin indent on  

"Enable mouse scroll in tmux
set mouse=a
set autoindent 
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab 
"set showtabline=2
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tq :q<CR>
nnoremap ta :qa<CR>
nnoremap tr :NERDTree<CR>
nnoremap sc :nohlsearch<CR>
set tags=tags;/ 
colorscheme atom-dark-256  
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
set background=dark
set cursorline
if &term=~ '256color'
	"Disable Background erase
	set t_ut=
endif
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
:hi MatchParen cterm=none ctermbg=black ctermfg=green 
