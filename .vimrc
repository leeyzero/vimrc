" ======================================
" 基本配置
" ======================================

" 不兼容vi命令
set nocompatible

" 打开语法高亮
syntax on

" 开启文件类型检查，并且载入与该类型对应的缩进规则。
filetype indent on

" 在底部状态栏显示当前模式，如插入、命令模式
set showmode

" 在命令模式下显示当前命令，如输入2y时，会在状态栏显示命令，再次输入y时，执行命令，状态栏命令消失
set showcmd

" 是否显示状态栏。0表示不显示，1表示只在多窗口时显示，2表示显示。
set laststatus=2

" 在状态栏显示光标的当前位置
set  ruler

" 支持鼠标
" set mouse=a

" 当前文本使用uf8编码
set encoding=utf-8  

" 保留命令的历史记录数
set history=1000

" 显示行号
set number

" 光标所在的当前行高亮
set cursorline

" 设置行宽，即一行显示多少个字符
set textwidth=100

" 自动折行，即太长的行分成几行显示，关闭自动折行为set nowrap
set wrap

" 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行
set linebreak

" 垂直滚动时，光标距离顶部/底部的位置（单位：行）
set scrolloff=5

" 水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用。
set sidescrolloff=10


" ======================================
" 缩进相关配置
" ======================================

" 按下tab时显示的空格数
set tabstop=4

" tab转化为多少个空格
set softtabstop=4

" 执行移位操作`>>或<<`时，显示的空格数
set shiftwidth=4

" 由于 tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格
set expandtab

" 自动缩略，当按下回车时，自动与上一行的缩进保持一致
set autoindent


" ======================================
" 搜索相关配置
" ======================================

" 光标遇到{[()]}时，会高亮显示另一半匹配的符号
set showmatch

" 高亮显示搜索的词
set hlsearch

" 增量搜索匹配结果，即每输入一个字母都会进行匹配
set incsearch

" 搜索时忽略大小写
set ignorecase

" 如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感
set smartcase


" ======================================
" 编辑相关配置
" ======================================
" 不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp
set noswapfile

" 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录。
set autochdir

" 出错时，不要发出响声
set noerrorbells

" 出错时，发出视觉提示，通常是屏幕闪烁
set visualbell

" 打开文件监视。如果在编辑过程中文件发生外部改变，就会发出提示。
set autoread

" 命令模式下，底部操作指令按下 Tab 键自动补全
set wildmenu

" Vundle 配置
filetype off

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif


" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 请将安装插件的命令放在vundle#begin和vundle#end之间.
Plugin 'whatyouhide/vim-gotham'
Plugin 'vim-airline/vim-airline'

" plugins for golang
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'

" YCM依赖的环境比较多，暂不开启
" Plugin 'Valloric/YouCompleteMe'

call vundle#end() " 必须
filetype plugin indent on " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
" 查阅 :h vundle 获取更多细节和wiki以及FAQ

" 主题
colorscheme gotham256
let g:gotham_airline_emphasised_insert = 0

" airline
let g:airline#extensions#tabline#enabled = 0

" vim-go
let g:go_fmt_command = "goimports" 
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=25
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" 设置宽度
let NERDTreeWinSize=25
