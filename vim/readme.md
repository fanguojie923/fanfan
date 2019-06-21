​		

```
" pathogen
call pathogen#infect()
" 配置文件.vimrc更改后自动重新载入
autocmd! bufwritepost .vimrc source ~/.vimrc
" 加载个性化配置
"auto bufread /home/map/liuboye/* so /home/map/liuboye/.vimrc
"禁用VI兼容模式
set nocompatible
"设置用于GUI图形用户界面的字体列表。
set guifont=Courier_New:h12:cANSI
"设定文件浏览器目录为当前目录
set bsdir=buffer
"设置编码
set enc=utf-8
set termencoding=utf-8
"设置文件编码
set fenc=utf-8
"设置文件编码检测类型及支持格式
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"指定菜单语言
set langmenu=en_US.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"指定帮助语言为中文
set helplang=cn
set iskeyword+=


"设置字体
if has("gui_running")
endif

if has("gui_running")
    colorscheme ron
    set guioptions-=L
    " 滚动条
    set guioptions+=r
    set guifont=Consolas:h9

    "窗口最大化
    set lines=9999
    set columns=9999
else
    set encoding=utf-8
    set fileencodings=utf-8,gb18030,gb2312,gbk " 如果你要打开的文件编码不在此列，那就添加进去
    "使用 murphy 调色板
    "colorscheme vividchalk
    "colorscheme desert
    "colorscheme ron
endif


syntax on
set nu
set showmatch
filetype plugin on
filetype indent on


set history=100

set autoread
set complete-=u
set complete-=i
set complete+=k 
set ffs=unix,dos
set so=7
set wildmenu
set ruler
set cmdheight=2
set showcmd
set nu
set noexpandtab
set lz
set hid
set backspace=eol,start,indent
set whichwrap+=<,>
set incsearch
set hlsearch
set magic
set noerrorbells
set novisualbell
set t_vb=
set showmatch
set mat=2
set laststatus=2
set viminfo='10,\"100,:20,n~/.viminfo
set sessionoptions-=curdir
set sessionoptions+=sesdir
set nobackup
set nowb
set noswapfile
set fen
set fdl=0
set expandtab
set shiftwidth=4
set ts=4
set ai
set si
set cindent
set autoindent
set wrap
set pastetoggle=<F3>
set smarttab
set lbr
set tw=78
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
    autocmd FileType html,python,vim,javascript setl shiftwidth=4
    autocmd FileType html,python,vim,javascript setl tabstop=4
    autocmd FileType * setl textwidth=40000
    autocmd FileType java,c setl shiftwidth=4
    autocmd FileType java setl tabstop=4
    autocmd FileType txt setl lbr
    autocmd FileType txt setl tw=78
    autocmd BufNewFile,BufRead *.todo so ~/vim_local/syntax/amido.vim
    autocmd FileType vim set nofen
    autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>
    autocmd FileType html set ft=xml
    autocmd FileType html set syntax=html
    autocmd FileType php set foldmethod=marker
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c,cpp  map <buffer> <leader><space> :make<cr>
    autocmd FileType c,cpp  setl foldmethod=syntax | setl fen
    autocmd FileType tex map <silent><leader><space> :w!<cr> :silent! call Tex_RunLaTeX()<cr>
    autocmd FileType tex inoremap $i \indent
    autocmd FileType tex inoremap $* \cdot
    autocmd FileType tex inoremap $i \item
    autocmd FileType tex inoremap $m \[<cr>\]<esc>O
    autocmd FileType template set encoding=utf-8
    autocmd BufWinEnter \[Buf\ List\] setl nonumber


function! InsertTabWrapper()
        let col=col('.')-1
        if !col || getline('.')[col-1] !~ '\k'
            return "\<TAB>"
        else
            return "\<C-N>"
        endif
endfunction
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>


"NeoComplCache 配置----begin
"自启动
let g:neocomplcache_enable_at_startup = 1
"默认选择第一个
let g:neocomplcache_enable_auto_select = 1 
"NeoComplCache 配置----end

"bufExplorer config -------begin
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 40  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
let g:bufExplorerMaxHeight=20        " Max height
let g:miniBufExplorerMoreThanOne = 2   " Display when more than 2 buffers
let g:miniBufExplSplitToEdge = 1       " Always at top
let g:miniBufExplMaxSize = 3           " The max height is 3 lines
let g:miniBufExplMapWindowNavVim = 1   " map CTRL-[hjkl]
let g:miniBufExplUseSingleClick = 1    " select by single click
let g:miniBufExplModSelTarget = 1      " Dont change to unmodified buffer
let g:miniBufExplForceSyntaxEnable = 1 " force syntax on
"bufExplorer config -------end

"php conf
let g:PHP_SYNTAX_CHECK_BIN = '/home/zzd/php/bin/php'
"golang config
set number
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

set mouse=v
set t_Co=256
colorscheme molokai
let g:go_version_warning = 0
```

