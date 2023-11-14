
"=========================================
"===  Edited by dingding, 2021.04.18   ===
"===   If you wanna commentary in EN   ===
"=== Contact me at dingdluan@gmail.com ===
"=========================================

"=================================================
" Repository url:
"   https://github.com/DingdingLuan/dingding_vim
"=================================================



filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'godlygeek/tabular'
call vundle#end()
filetype plugin indent on
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

let g:SimpylFold_docstring_preview=1
" python:
au BufNewFile,BufRead *.py
\ set tabstop=4	|
\ set softtabstop=4	|
\ set shiftwidth=4	|
\ set textwidth=79	|
\ set expandtab	|
\ set autoindent	|
\ set fileformat=unix	|
\ nnoremap<silent> <c-b> <Esc>:w<CR>:!clear;python % <CR>|
"\ nnoremap <buffer> <c-b> :exec '!python' shellescape(@%, 1)<cr> |
"python代码ctrl+b一键编译


" python 代码高亮
let python_hightlight_all=1
" 全栈开发
au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2	|
\ set softtabstop=2	|
\ set shiftwidth=2	|
" 避免出现多余空白字符
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

"访问系统剪贴板
set clipboard=unnamed
"开启全屏模式

set modelines=0		" CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing



set nowritebackup nobackup
set showmatch         " 高亮显示对应的括号
set number            " 显示行号
set mouse-=a 
set selection=exclusive 
"set lines=50 columns=90
set ruler						" 显示光标当前位置（右下角）
set laststatus=2		" 总是显示状态栏

set tabstop=2
set shiftwidth=2
set autoindent
set autowrite
set foldenable
set foldmethod=syntax
set incsearch
set hlsearch
"colorscheme synthwave
colorscheme potato
syntax on
:inoremap ( ()<ESC>i
:inoremap { {}<ESC>i
:inoremap [ []<ESC>i
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap < <><ESC>i
set autoread
set foldenable
set t_Co=256 " required
"map <F3> :NERDTreeMirror<CR>
"map <F3> :NERDTreeToggle<CR>
map <C-n> :NERDTreeMirror<CR>
map <C-n> :NERDTreeToggle<CR>


"fortran


let s:extfname= expand("%:e")
if s:extfname==? "f90"
    let fortran_free_source=1
    unlet! fortran_fixed_source
		nnoremap<silent> <c-b> <CR><Esc>:w !file='%';filename=`basename $file .f90`;gfortran $file -o $filename<CR>
		"nnoremap<silent> <c-b> <CR><Esc>:w !file='%';filename=`basename $file .f90`;file_path=`pwd`;ifort $file_path/$file -o $file_path/$filename<CR>
	else
    let fortran_fixed_source=1
    unlet! fortran_free_source
endif
let fortran_more_precise=1
let fortran_do_enddo=1
"去掉固定格式每行开头的红色填充
let fortran_have_tabs=1
set foldmethod=syntax


" neocomplcache的补全设置
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_enable_auto_select=1

" nerd_commenter注释
let mapleader=","
map <c-t> ,cc
map <c-r> ,cu

" 配置powerline 内嵌视图
"set laststatus=2
"set t_Co=256
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" ctl+H一键关闭高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

nnoremap <c-h> :call DisableHighlight()<cr>
function! DisableHighlight()
    set nohlsearch
endfunc


"Comman 全局复制粘贴操作
map <C-A> ggVG
map! <C-A> <Esc> ggVGY
"放弃了复制粘贴，因为和V-block模式冲突了
"map <C-v> "+gp
"map <C-c> "+y
"imap <C-v> <Esc> "+gp


set rtp+=/root/miniconda3/lib/python3.9/site-packages/powerline/bindings/vim
set laststatus=2
set encoding=utf-8
set t_Co=256
set number
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set background=dark

hi Normal guibg=NONE ctermbg=NONE

"c++
let s:extfname= expand("%:e")
if s:extfname==? "cc"
		nnoremap<silent> <c-b> <CR><Esc>:w !file='%';filename=`basename $file .cc`;g++ $file -o $filename && ./$filename<CR>
endif

" 20220212, 添加快捷操作窗口大小
nnoremap + :res +5<CR>
nnoremap _ :res -5<CR>
" 20220212, 添加打开zsh终端快捷键
nnoremap <S-t> :term zsh<CR>
" 20231114, 配置彩虹括号
let g:rainbow_active = 1

" 设置 'Ctrl+Shift+A' 
" 为 'Tabularize /' 的快捷键
" 后续自己添加一下对其符号即可
" win linux和mac都通用
vmap <C-S-a> :Tabularize /
