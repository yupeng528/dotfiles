"==========================================
" Author:  fish
" Version: 1.0
" Last_modify: 2015-05-02
"==========================================

" 修改leader键
let mapleader = ','
let g:mapleader = ','

syntax on "打开关键字上色
filetype plugin indent on "开启文件类型自动识别，启用文件类型插件，启用针对文件类型的自动缩进
"set completeopt=longest,menu

set list
set listchars=tab:>-,trail:-

" utf8环境的编码设置
set noundofile
set nobackup
set noswapfile
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

set nocp "设置非兼容设置，要求做出vim而不是vi的行为
set hls "搜索字符串时高亮显示要搜索的字符串

"set mouse=a "支持鼠标事件（点击定位等）
set mouse=

set wildmenu "vim命令行自动补全显示单行菜单

" 下面是tab缩进相关
set expandtab " 编辑时将所有 Tab 替换为空格
set tabstop=2 " Tab 宽度为 2 个字符
set shiftwidth=2 " 自动缩进的时候，缩进尺寸为 2 个空格
set softtabstop=2 " 编辑插入tab时，把tab算作的空格数
set autoindent " 开启自动缩进
set smarttab " 一键删除tab
set backspace=indent,eol,start "方便insert模式下的删除操作

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 突出显示当前列
"set cursorcolumn
" 突出显示当前行
"set cursorline
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 显示行号
set number

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" kj 替换 Esc
inoremap kj <Esc>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>

nnoremap <leader>1 :wqa<CR>

" select all
map <Leader>sa ggVG

" y$ -> Y Make Y behave like other capitals
map Y y$

" NERDTreeToggle
map <leader>n :NERDTreeToggle<CR>

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc

" set some keyword to highlight
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()



" ##############快捷键设置################
vnoremap < <gv "设置visual状态下的shift <缩进
vnoremap > >gv "设置visual状态下的shift >缩进
map <F12> :set number!<CR> "映射f12为行号开关
nmap <C-N> :tabnext<CR> " 映射自动补全到tab键
nmap <C-P> :tabprevious<CR> " 映射自动补全到tab键

" insert模式下的移动光标快捷键

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <DELETE>

" command模式下的定位光标快捷键

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

""""""""""""""""""""""""""""""

" BufExplore settings

""""""""""""""""""""""""""""""

let g:bufExplorerDefaultHelp=0 " Do not show default help.
let g:bufExplorerShowRelativePath=1 " Show relative paths.
let g:bufExplorerSortBy='mru' " Sort by most recently used.
let g:bufExplorerSplitRight=0 " Split left.
let g:bufExplorerSplitVertical=1 " Split vertically.
let g:bufExplorerSplitVertSize = 30 " Split width
let g:bufExplorerUseCurrentWindow=1 " Open in new window.

"set tags+=/home/work/phpui/tags "设置tag, 首先得安装ctags工具

"let g:winManagerWindowLayout='FileExplorer|TagList' "winmanager布局，得安装winmanager.vim插件

"nmap wm :WMToggle<cr> " 映射wm插件开关到wm

let g:miniBufExplMapWindowNavVim = 1 "

let g:miniBufExplMapWindowNavArrows = 1 "
"colorscheme contrasty
colorscheme desert "配色方案
"colorscheme torte
"taglist 安装
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1


nnoremap <silent> <F3> :Grep<CR>
let g:SuperTabRetainCompletionType=2

let g:SuperTabDefaultCompletionType="<C-X><C-O>"
let g:neocomplcache_enable_at_startup = 1

map fg : Dox<cr>
let g:DoxygenToolkit_authorName="fish"
let g:DoxygenToolkit_briefTag_pre = "@brief"
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 50
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_startCommentBlock = "/* "
let g:DoxygenToolkit_interCommentBlock = " * "
let g:DoxygenToolkit_interCommentTag = " * "
let g:DoxygenToolkit_endCommentTag = " */"
let g:DoxygenToolkit_endCommentBlock = " */"

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType javascript,css,scss,html set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.tpl setlocal filetype=vue.html.javascript.css
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd BufRead,BufNewFile *.ux setlocal filetype=vue.html.javascript.css
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd
au FileType javascript setlocal dict+=~/.vim/dict/node.dict
au FileType vue setlocal dict+=~/.vim/dict/vue.dict

