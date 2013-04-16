"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Dexter.Yy <dexter.yy at gmail.com>
" Last Change: $LastChangedDate$ $Rev$
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For vundle
set t_Co=256
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" vim-scripts repos
Bundle 'bash-support.vim'
Bundle 'perl-support.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
 " vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
 " non github repos
Bundle 'git://git.wincent.com/command-t.git'
filetype plugin indent on 

set history=400
if has('mouse')
  set mouse=a
endif
set backspace=indent,eol,start
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

let g:Powerline_symbols = 'fancy'
set laststatus=2
let g:molokai_original = 0

map Q gq
inoremap <C-U> <C-G>u<C-U>

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Platform
function! MySys()
	if has("win32") || has("win64")
    	return "windows"
	elseif has("mac")
		return "mac"
	else
    	return "linux"
  	endif
endfunction

"if MySys() == 'mac' || MySys() == 'linux'
	"set shell=/bin/bash\ -l
"endif

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" Move Backup Files to ~/.vim/backups/
set backupdir=~/.vim/backups
set dir=~/.vim/backups
set nobackup 
"set nowritebackup 

set shiftwidth=4
set tabstop=4
set nowrap
set wildmenu
set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]
set foldmethod=indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running") || has("gui_macvim")
	colorscheme molokai
	let g:colors_name="yytextmate"
else
	colorscheme molokai
endif

if MySys() == "mac"
	set guifont=Inconsolata-dz\ for\ Powerline:h16
	"set guifontwide=Hei:h16
	set guifontwide=Hiragino\ Sans\ GB:h16
elseif MySys() == "linux"
	set guifont=Monospace
endif

set anti
set linespace=2 
set number
set numberwidth=4
set equalalways
set guitablabel=%t

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype and syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_macvim")

	set columns=120
	set lines=58
	winpos 52 42 

	let macvim_skip_cmd_opt_movement = 1
	let macvim_hig_shift_movement = 1

	set transparency=0
	set guioptions=none
	"set guioptions-=Tegmrt
	"set guioptions+=b 
	
	macm File.New\ Tab						key=<D-T>
	macm File.Save<Tab>:w					key=<D-s>
	macm File.Save\ As\.\.\.<Tab>:sav		key=<D-S>
	macm Edit.Undo<Tab>u					key=<D-z> action=undo:
	macm Edit.Redo<Tab>^R					key=<D-Z> action=redo:
	macm Edit.Cut<Tab>"+x					key=<D-x> action=cut:
	macm Edit.Copy<Tab>"+y					key=<D-c> action=copy:
	macm Edit.Paste<Tab>"+gP				key=<D-v> action=paste:
	macm Edit.Select\ All<Tab>ggVG			key=<D-A> action=selectAll:
	macm Window.Toggle\ Full\ Screen\ Mode	key=<D-F>
	macm Window.Select\ Next\ Tab			key=<D-}>
	macm Window.Select\ Previous\ Tab		key=<D-{>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost vimrc source ~/.vimrc


autocmd BufRead * :lcd! %:p:h

" filetype
autocmd BufNewFile,BufRead *.vm setlocal ft=html

" language support
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 textwidth=79
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" for AutoComplPop
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <tab> 		v>
nmap <s-tab> 	v<
vmap <tab> 		>gv 
vmap <s-tab> 	<gv

" map cmd to ctrl
if MySys() == "mac"
	map <D-y> <C-y>
	map <D-e> <C-e>
	map <D-f> <C-f>
	map <D-b> <C-b>
	map <D-u> <C-u>
	map <D-d> <C-d>
	map <D-w> <C-w>
	map <D-r> <C-r>
	map <D-o> <C-o>
	map <D-i> <C-i>
	map <D-g> <C-g>
	map <D-a> <C-a>
	map <D-]> <C-]>
	cmap <D-d> <C-d>
	imap <D-e> <C-e>
	imap <D-y> <C-y>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" bufExplorer setting
autocmd BufWinEnter \[Buf\ List\] setl nonumber

" 默认键映射 <leader>bv :VSBufExplorer
"

" tasklist
nmap <silent> <leader>tl :TaskList<CR>


" taglists setting
nmap <silent> <leader>tg :TlistToggle<CR>
"let Tlist_Use_SingleClick=1
"Tlist_Process_File_Always=1
nmap <silent> <leader>fe :Sexplore!<cr>

" NERDTree setting
nmap <silent> <leader>nt :NERDTree<cr>

" Most Recently Used (MRU)
nmap <silent> <leader>r :MRU<cr>

" FuzzyFinder setting
"nmap <leader>fb :FuzzyFinderBuffer<cr>
"nmap <leader>ff	:FuzzyFinderFile<cr>
"nmap <leader>fd	:FuzzyFinderDir<cr>
"nmap <leader>fe	:FuzzyFinderMruFile<cr>
"nmap <leader>fc	:FuzzyFinderMruCmd<cr>
"nmap <leader>fm	:FuzzyFinderBookmark<cr>
""nmap <leader>ft	:FuzzyFinderTag<cr>
"nmap <leader>ft	:FuzzyFinderTaggedFile<cr>
nmap <leader>fb :FufBuffer<cr>
nmap <leader>ff :FufFile<cr>
nmap <leader>fd :FufDir<cr>
nmap <leader>fa :FufBookmark<cr>



"let NERDCreateDefaultMappings=0

