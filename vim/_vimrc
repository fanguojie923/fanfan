""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM配置
" Author: mounui
" Email: maojunhui5214@163.com
" Blog: http://mounui.com
" Version: 2.0
" Last Modify: 2018-07-31 23:50
" Sections:
"       -- Load Configuration 加载配置
"       -- Encode Settings 编码设置
"       -- General Settings 基础配置
"       -- View Settings 显示设置
"       -- Others Settings 其他设置
"       -- HotKey Settings 自定义快捷键
"       -- Vundle配置 插件管理
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Configuration 加载配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 模仿windows快捷键
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
" TODO 设置leader键
let mapleader=" "
let g:mapleader=" "
" 开启语法高亮
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encode Settings 编码设置
" 参考：http://mounui.com/147.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 语言设置
" 菜单语言
set langmenu=zh_CN.UTF-8
" 帮助文档
set helplang=cn

" 设置文件编码为utf-8
set encoding=utf-8
" 普通模式下的编码设置
"set termencoding=utf-8
" 自动判断编码是时依次尝试以下编码
set fencs=utf-8,gbk,chinese,big5,cp936,gb18030,gb2312,utf-16
set fenc=utf-8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" 遇到Unicode值大于255的文本，不必等到空格在折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" vim在windows下的编码设置
" if has("win32")
"     set enc=chinese
" else
"     set enc=utf-8
" endif

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings 基础配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 启动的时候不显示援助乌干达儿童提示
set shortmess=atI
" 历史容量
set history=1000
" 针对不同文件类型采用不同的缩进格式
"filetype indent on
" 允许使用插件
"filetype plugin on
" 开启文件类型检测，启用插件和缩进
filetype plugin indent on
" 不检测文件类型
"filetype off
" 文件修改之后自动载入
set autoread
" 备份到另一个位置
" set bk
" set backupext=.bak
" set backupdir=/tmp/vimbak/
" 从不备份
set nobackup
" 禁止生成临时文件
set noswapfile
" 不产生nu文件
set noundofile
" 退出vim后内容显示在终端屏幕，可用于查看和复制
"set t_ti= t_te=
" 不启用鼠标
set mouse-=a
" 启用鼠标
"set mouse=a
" 输入字符不隐藏鼠标
" set nomousehide
" 去掉输入错误的提示音
set novisualbell
set noerrorbells
set t_vb=
set tm=500
" 魔术
set magic
" 配置backspace 从行首和行末可以跳到另一行
" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" View Settings 显示设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI界面下窗口字体设置
" 设置窗口位置 （距离屏幕左上角的距离）
"winpos 5 5
" 设置窗口大小 （40行，155列）
"set lines=40 columns=155
" 设置字体 （Consolas字体 大小14）
set guifont=Consolas:h14:cANSI

" 隐藏工具栏
set guioptions-=T
"隐藏菜单栏
set guioptions-=m
"设置配色方案
colorscheme molokai
" 在状态栏显示正在输入的命令
" set showcmd
" 在左下角显示当前vim模式
" set showmode

" 显示当前列号
set ruler
" 突出显示当前列
" set cursorcolumn
" 突出显示当前行
" set cursorline
" 光标移动时，上下方总会保留相应行数
set scrolloff=5
" TODO 命令行高度
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" 显示行号
set number
" 取消换行
set nowrap
" 每行最大字符数，超出换行
"set textwidth=80

" 自动缩进
set autoindent
" 智能缩进
set smartindent

" tab相关变更
" 设置tab键的宽度
set tabstop=4
" 每次缩进对应的空格数
set shiftwidth=4
" 退格键可以一次删掉4个空格
set softtabstop=4
set smarttab
" Tab自动转化为空格
set expandtab
set shiftround
" C系列缩进
set cindent

" 插入括号时，短暂跳转到匹配的括号上
set showmatch
" 跳转到配对括号上的时间，默认1/10 秒
set matchtime=2

" 搜索相关
" 搜索忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 高亮search文本
set hlsearch
" 开启增量搜索模式
set incsearch

" 代码折叠
set foldenable
" 折叠方法
set foldmethod=indent
" 关闭的折叠级别
set foldlevel=99
" 配置代码折叠键盘映射
map <leader>zz :call ToggleFold()<CR>
let g:FoldMethod = 0
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 相对行号
set relativenumber
" vim获取焦点时用相对行号，失去焦点时用绝对行号
au FocusLost * :set norelativenumber
au FocusGained * :set relativenumber
" 插入模式下用绝对行号，普通模式下用相对行号
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
" 普通模式下绝对、相对行号切换映射
nnoremap <C-N> :call NumberToggle()<CR>
fun! NumberToggle()
	if (&relativenumber == 1)
	    set norelativenumber number
	else
	    set relativenumber
	endif
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Others Settings 其他设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc文件修改后自动加载
if has("win32")
    autocmd! bufwritepost _vimrc source %
else
    autocmd! bufwritepost .vimrc source %
endif

" 关闭vi兼容模式
set nocompatible
" 启用系统剪贴板
"set clipboard=unnamed

" 自动补全 参考：http://mounui.com/212.html
" 让vim补全菜单行为和一般IDE一致 （使用<C-p>,<C-n>弹出提示窗口）
set completeopt=preview,menu
" 增强模式中命令行自动完成
set wildmenu
" 文件模式列表 （忽略的文件模式）
set wildignore+=*.swp,*.bak,*.pyc,*.class,.svn
"set wildmode=list:longest  " 列表形式展示候选
set ttyfast
" 离开插入模式后自动关闭预览窗口
au InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中补全提示列表里当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" 自动补全选择选项方向键映射
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 复制粘贴映射（与外界互通） 参考：http://mounui.com/236.html
vnoremap <C-C> "*y
nnoremap <C-V> "*p

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HotKey Settings 自定义快捷键设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭方向键
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

" 同物理行上跳转
nnoremap k gk
nnoremap j gj

" kj替换<Esc>
inoremap kj <Esc>
" 快速进入命令行
" nnoremap ; :

" 去掉搜索高亮
map <silent> <leader>/ :noh<CR>

" <F1> 退出
nnoremap <F1> <Esc>
" <F2> 行号开关
nnoremap <F2> :call HideNumber()<CR>
fun! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
" <F3> 可打印字符切换
nnoremap <F3> :set list! list?<CR>
" <F4> 换行切换
nnoremap <F4> :set wrap! wrap?<CR>
" <F5> 粘贴模式开关
"set pastetoggle=<F5>
nnoremap <F5> :set paste! paste?<CR>
" <F6> 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" 分屏窗口移动
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" 命令行模式增强，ctrl-a到行首，-e到行尾
cnoremap <c-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" 保持搜索模式始终在屏幕中间
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" 标签页tab切换
map <leader>tj :tabnext<CR>
map <leader>tk :tabprev<CR>
map <leader>tn :tabnext<CR>
map <leader>tp :tabprev<CR>
map <leader>th :tabfirst<CR>
map <leader>tl :tablast<CR>
map <leader>te :tabedit<CR>
map <leader>td :tabclose<CR>
map <leader>tm :tabm<CR>
" 正常模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>
" tab切换
let g:last_active_tab = 1   " 当前标签页编号
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<CR>
au TabLeave * let g:last_active_tab = tabpagenr()

" 全选
map <leader>sa ggVG

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileType Settings 文件类型设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au filetype python set tabstop=4 shiftwidth=4 expandtab ai
au filetype ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
au BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
au BufRead,BufNewFile *.part set filetype=html
au BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
au BufWinEnter *.php set mps-=<:>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle配置 插件管理工具
" 配置参考：http://mounui.com/179.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set nocompatible              " 去除VI一致性,必须
" filetype off                  " 必须
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle/')

" 插件列表
Plugin 'VundleVim/Vundle.vim'           " Vundle插件管理工具
Plugin 'altercation/vim-colors-solarized' " 配色方案
Plugin 'molokai'		                " 配色方案
Plugin 'colorizer'                      " css颜色显示插件
Plugin 'mattn/emmet-vim'                " 前端代码补全
Plugin 'DoxygenToolkit.vim'		        " 注释文档生成
Plugin 'VimTweak'					    " 背景透明插件
Plugin 'ervandew/supertab'              " 补全记忆插件
Plugin 'AutoComplPop'                   " 自动代码提示
Plugin 'othree/html5.vim'               " html全能补全
Plugin 'w0rp/ale'                       " 代码检查
Plugin 'junegunn/fzf',                  " 搜索工具
Plugin 'junegunn/fzf.vim'               " 搜索工具
Plugin 'junegunn/limelight.vim'         " 界面设置
Plugin 'junegunn/goyo.vim'              " 配合limelight使用
Plugin 'haya14busa/incsearch.vim'       " 搜索工具
Plugin 'justinmk/vim-sneak'             " 跳转工具
Plugin 'mhinz/vim-signify'              " 版本控制
Plugin 'terryma/vim-multiple-cursors'   " 多光标输入
Plugin 'suan/vim-instant-markdown'      " Markdown
Plugin 'pangloss/vim-javascript'        " Javascript
Plugin 'tpope/vim-commentary'           " 快速注释
Plugin 'vim-airline/vim-airline'        " 状态栏美化
Plugin 'vim-airline/vim-airline-themes' " airline主题
Plugin 'tyru/open-browser.vim'          " 打开浏览器
Plugin 'scrooloose/nerdtree'            " 文件浏览（目录树）
Plugin 'tpope/vim-surround'             " 配对操作符
Plugin 'tpope/vim-fugitive'             " git包装器

call vundle#end()

" 简要帮助文档
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"************************************************
" colorizer配置 css显示颜色插件
" 参考：http://mounui.com/208.html
"************************************************
" 显示设置，默认值为2；0，1 软化前景色，-1 纯色显示
let g:colorizer_fgcontrast = 0
" 启动时不启用着色
let g:colorizer_startup = 0

"************************************************
" emmet配置 前端补全工具
" 参考：http://mounui.com/291.html
"************************************************
" 只在html和css文件中起作用
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstal
" 修改Emmet扩展键
let g:user_emmet_expandabbr_key = '<C-e>'
" 修改Emmet默认快捷键
"let g:user_emmet_leader_key = '<C-e>'

"************************************************
" VimTweak配置 界面配置工具
" 参考：http://mounui.com/208.html
"************************************************
" 自动透明
au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 230)
" 自动最大化
" au GUIEnter * call libcallnr("vimtweak.dll", "EnableMaximize", 1)
" 自动置顶
" au GUIEnter * call libcallnr("vimtweak.dll", "EnableTopMost", 1)

" 快捷键设置
map <M-1> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 10) <CR>
map <M-8> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 180) <CR>
map <M-9> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 230) <CR>
map <M-0> <ESC>:call libcallnr("vimtweak.dll", "SetAlpha", 255) <CR>
map _+ <ESC>:call libcallnr("vimtweak.dll", "EnableMaximize", 1) <CR>
map _- <ESC>:call libcallnr("vimtweak.dll", "EnableMaximize", 0) <CR>

"************************************************
" SuperTab配置 自动补全记忆插件
" 参考：http://mounui.com/217.html
"************************************************
" 补全模式
let g:SuperTabRetainCompletionType = 2
" 补全方式
let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

"************************************************
" AutoComplPop配置 自动代码提示插件
" 参考：http://mounui.com/225.html
"************************************************
" 输入一个字母即可补全
"let g:acp_behaviorKeywordLength = 1
" 自动弹出是由键映射，对于通过移动来避免自动弹出是很有用
let g:AutoComplPop_MappingDriven = 1
" 修改GUI高亮参数 该设置全局有效
hi Pmenu guibg=#444444
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

" 加载PHP函数字典，配置PHP函数自动补全，注意文件位置
au FileType php setlocal dict+=$VIM/vimfiles/bundle/AutoComplPop/dict/php_funclist.txt
" PHP提示触发
if !exists('g:AutoComplPop_Behavior')
	let g:AutoComplPop_Behavior = {}
	let g:AutoComplPop_Behavior['php'] = []
	call add(g:AutoComplPop_Behavior['php'], {
		\ 'command' : "\<C-x>\<C-o>",
		\ 'pattern' : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
		\ 'repeat' : 0,
		\ })
endif

"************************************************
" ale配置 语法检查插件
"************************************************
" 保持侧边栏可见
let g:ale_sign_column_always = 1
" 禁用突出显示
let g:ale_set_highlights = 0
" 自定义error和warning标识符
let g:ale_sign_error = '●'
let g:ale_sign_warning = '○'
" 在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['X %d', '! %d', 'O ok']
" 显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" 只有在文件保存时检查
"let g:ale_fix_on_save = 1
" 键入时不检查
"let g:ale_lint_on_text_changed = 'never'
" 进入时不检查
"let g:ale_lint_on_entere = 0

"************************************************
" DoxygenToolkit配置 注释插件
" 参考：http://mounui.com/202.html
"************************************************
" Lincese
let g:DoxygenToolkit_licenseTag = "\<enter>Copyright (C) 2018 http://mounui.com\<enter>If you have any questions, please contact me email:maojunhui5214@163.com\<enter>You can also leave a message on my blog."
" 注释块首尾
let g:DoxygenToolkit_blockHeader="************************Header*************************"
let g:DoxygenToolkit_blockFooter="************************Footer*************************"
" Author
let g:DoxygenToolkit_authorName="mounui <maojunhui5214@163.com>"
" Fun
let g:DoxygenToolkit_briefTag_funcName="yes"    " 显示函数名
let g:doxygen_enhanced_color=1

"************************************************
" fzf配置 搜索工具
" 参考：https://mounui.com/306.html
"************************************************
if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" 键盘映射
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader>b        :Buffers<CR>
nnoremap <silent> <Leader>l        :Lines<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

function! s:plug_help_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source': sort(keys(g:plugs)),
  \ 'sink':   function('s:plug_help_sink')}))

"************************************************
" limelight goyo配置
" 参考：https://mounui.com/311.html
"************************************************
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'Gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" 包含的前后段的数量
let g:limelight_paragraph_span = 1
" Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
" 进入goyo模式后自动触发limelight，退出则关闭
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" limelight键盘映射
nmap <silent> <leader>g      :Goyo<CR>
xmap <silent> <leader>g      :Goyo<CR>

"************************************************
" incsearch配置
" 参考：https://mounui.com/314.html
"************************************************
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"************************************************
" signify配置 版本控制
" 参考：https://mounui.com/152.html
"************************************************
" 设置要检查的VCS
let g:signify_vcs_list = ['git']
" 插入模式下指定updatetime时间后无操作将缓存区交换文件写入磁盘
"let g:signify_cursorhold_insert     = 1
" 正常模式下指定updatetime时间后无操作将缓存区交换文件写入磁盘
"let g:signify_cursorhold_normal     = 1
" 缓冲区被修改时更新符号
let g:signify_update_on_bufenter    = 0
" vim获取焦点时更新符号
let g:signify_update_on_focusgained = 1
" 键盘映射
nnoremap <leader>gt :SignifyToggle<CR>
nnoremap <leader>gh :SignifyToggleHighlight<CR>
nnoremap <leader>gr :SignifyRefresh<CR>
nnoremap <leader>gd :SignifyDebug<CR>
" hunk jumping
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

"************************************************
" vim-multiple-cursors配置 多光标输入
" 参考：https://mounui.com/319.html
"************************************************
" 关闭插件默认映射
let g:multi_cursor_use_default_mapping = 0
" mapping
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = 'g<C-d>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"************************************************
" vim-instant-markdown配置 Markdown标记即时预览
" 参考：https://mounui.com/322.html
"************************************************
" 关闭实时预览
let g:instant_markdown_slow = 1
" 关闭打开文件自动预览
"let g:instant_markdown_autostart = 0
" 阻止外部资源加载
"let g:instant_markdown_allow_external_content = 0

"************************************************
" vim-javascript配置 javascript语法高亮、缩进
" 参考：https://mounui.com/325.html
"************************************************
" 为jsdoc文档启用语法突出显示
let g:javascript_plugin_jsdoc = 1
" 为ngdoc启用额外语法突出显示
let g:javascript_plugin_ngdoc = 1
" 为Flow启用语法突出显示
let g:javascript_plugin_flow = 1
" 基于语法文件启用JavaScript的代码折叠，可能会影响性能
augroup  javascript_folding 
    au!
    au FileType javascript setlocal fdm=syntax 
augroup  END
" 设置隐藏字符 （设置的字符要在系统允许的范围内）
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "►"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "○"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "Ᵽ"
" let g:javascript_conceal_noarg_arrow_function = ""
" let g:javascript_conceal_underscore_arrow_function = ""
" 启用隐藏
set conceallevel=1

"************************************************
" vim-airline配置 状态栏美化
" 参考：https://mounui.com/331.html
"************************************************
" 设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double
" 总是显示状态栏 
let laststatus = 2
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
let g:airline_theme="dark"      " 设置主题
" 开启tabline
let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1      
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 设置字体 
set guifont=Powerline_Consolas:h14:cANSI   

"************************************************
" open-browser配置 打开浏览器
" 参考：https://mounui.com/343.html
"************************************************
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" 搜索引擎配置
let g:openbrowser_default_search = 'baidu'
let g:openbrowser_search_engines = {
\  'baidu': 'http://www.baidu.com/s?wd={query}&rsv_bp=0&rsv_spt=3&inputT=2478',
\}

"************************************************
" nerdtree配置 目录树资源管理器
" 参考：https://mounui.com/347.html
"************************************************
map <leader>ne :NERDTreeToggle<CR>
" 目录树窗口尺寸
let g:NERDTreeWinSize = 20
" 关闭nerd帮助
" let g:NERDTreeMinimalUI = 1
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 显示隐藏文件
let NERDTreeShowHidden=1
" 修改默认箭头符号
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
augroup NERDTree
    au!
    autocmd vimenter * NERDTree     " vim启动时自动打开NERDTree
    " vim启动打开目录时自动打开NERDTree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    " 文件全部关闭时退出NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
