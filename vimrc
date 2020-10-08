let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/bin/python3'
"-----------------
" map settings
"-----------------
" ':'换成','
let mapleader=","

vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <leader>wq :wq<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j
map <leader>sudo :w !sudo tee %
" 移除 Windows 文件结尾的 `^M`
noremap <leader>m :%s/<C-V><C-M>//ge<CR>
"-----------------
" settings
"-----------------
set guifont=monaco\ 18                  "linux-font
set guifont=monaco:h18:cUTF-8:qDRAFT    "windows/mac-font
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 "设置编码
set termencoding=utf-8
set encoding=utf-8
set autoread        "文件发生外部改变，发出提示
set number          "设置行号
set relativenumber  "相对行号
set cursorline      "高亮行
set mouse=a         "启用鼠标
set selection=exclusive
set selectmode=mouse,key
set autoindent      "自动缩进
set showmatch       "括号匹配
set smarttab        "智能制表符
set tabstop=4       "设置Tab长度为4空格,默认的是8个
set softtabstop=4   "退格键的时候退回缩进的长度
set shiftwidth=4    "设置自动缩进长度为4空格,每一级缩进的长度
set noexpandtab     "缩进用空格,不用tab表示
set nocompatible    "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set foldenable      "允许折叠
set showcmd         "输入的命令显示出来，看的清楚些
set listchars=tab:>-,trail:-    "显示空格和tab键
set cmdheight=1     "命令行高度为一行
set laststatus=1    "显示状态栏
set ruler           "显示光标当前位置
filetype plugin indent on   "打开文件类型检测
set incsearch       "即时显示匹配结果
set hlsearch        "高亮所有结果
map <silent> <leader><CR> :nohlsearch<CR>
set ignorecase      "忽略大小写
set smartcase       "搜索模式里有大写字母，就不再忽略大小写
set formatoptions+=mM   "在断行、合并(join)行时，针对多字节字符（比如中文）的优化处理
set magic           "设置魔术
set history=1000    "历史操作
set hidden          "允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set autochdir       "自动切换当前目录为当前文件所在的目录
set nobackup        "覆盖文件时不备份
set nowritebackup
set noswapfile      "不用交换文件
set fenc=
set re=1
set lazyredraw      "切换缓存时不用保存
set synmaxcol=128
syntax sync minlines=300

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175    "光标闪烁

au FileType text,markdown,html,xml set wrap  "设置折行
set linebreak       "折行时，以单词为界，以免切断单词
set breakindent     "折行后的后续行，使用与第一行相同的缩进

"-----------------
" function settings
"-----------------
" auto fcitx 退出插入模式和命令行模式自动切换
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction
set ttimeoutlen=150
autocmd InsertLeave * call Fcitx2en() "退出插入模式

" 高亮不想要的空格，比如行尾
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches() " for performance

" 保存时自动删除行尾空格
func! DeleteTrailingWS()
    exec "normal mz"
    %s/\s\+$//ge
    exec "normal `z"
endfunc
au BufWrite * :call DeleteTrailingWS()
map <leader>W :call DeleteTrailingWS()<CR>

"-----------------
" Plugin
"-----------------
call plug#begin()
    " Project
    Plug 'terryma/vim-multiple-cursors' "光标编辑
    Plug 'junegunn/vim-easy-align'      "代码对齐

    " Git
    Plug 'airblade/vim-gitgutter'

    " Genreal Highlighter
    Plug 'chrisbra/Colorizer' " Show colors with :ColorHighlight

    " Other visual enhancement
    Plug 'ryanoasis/vim-devicons'
    Plug 'luochen1990/rainbow'
    Plug 'wincent/terminus'

    " Other function
    Plug 'tpope/vim-surround'
    Plug 'Raimondi/delimitMate'     "补全括号
    Plug 'easymotion/vim-easymotion'    "快速移动
    Plug 'mhinz/vim-startify'   "提供开始屏幕
    Plug 'Yggdroot/indentLine'          "缩进标线

call plug#end()
"-----------------
" Plugin settings
"-----------------
" UI设置
set t_Co=256
syntax enable