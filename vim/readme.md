​		

# vim配置成IDE教程

vim在开发中十分高效，但是vim的默认的样式却很不友好，接下来我们将一下如何美化和配置vim，本文是基于MacOS系统为主的，Linux或者Windows配合整体类似肯能会有所不同。

## 1源码安装vim

虽然MacOS自带vim但是这个vim被阉割过,功能补全，如果需要在vim中复制到系统粘贴板上MacOS自带的vim是无法完成的:

```
git clone git@github.com:vim/vim.git
cd vim/
./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
make
make install
```

其中--with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --e nable-perlinterp分别表示支持python、ruby、lua、perl编写的插件，--with-python--config-dir指定python的路径，--enable-gui=gtk2表示对gvim的支持，--enable-cscope表示对cscope支持，许多linux版本的vim插件需要cscope插件来支持。
安装完查看我们可以通过vim --version来查看是否支持这些插件如vim --version|grep python看到python前面有一个+号表示我们vim集成了python插件的支持。

## 2.vimrc基本配置

.vimrc是vim的配置文件，原始的vim非常难用主要是默认没有配置成ide那样强大，我们vim的按键配置、主题配置及插件安装列表等都在vim中配置，后面我们需要安装到其他机器上只需要拷贝.vimrc文件安装即可(有些检查需要配置一些额外文件)。

前缀键。各类 vim 插件帮助文档中经常出现 <leader>，即，前缀键。vim 自带有很多快捷键，再加上各类插件的快捷键，大量快捷键出现在单层空间中难免引起冲突，为缓解该问题，引入了前缀键 <leader>，这样，键 r 可以配置成 r、<leader>r、<leader><leader>r 等等多个快捷键。前缀键是 vim 使用率较高的一个键（最高的当属 Esc），选一个最方便输入的键作为前缀键，将有助于提高编辑效率。找个无须眼睛查找、无须移动手指的键 —— 分号键，挺方便的，就在你右手小指处：

```
" 定义前缀键的前缀,即<Leader>
let mapleader=";"
```

既然前缀键是为快捷键服务的，那随便说下快捷键设定原则：不同快捷键尽量不要有同序的相同字符。比如，<leader>e 执行操作 0 和 <leader>eb 执行操作 1，在你键入 <leader>e 后，vim 不会立即执行操作 0，而是继续等待用户键入 b，即便你只想键入 <leader>e，vim 也不得不花时间等待输入以确认是哪个快捷键，显然，这让 <leader>e 响应速度变慢。<leader>ea 和 <leader>eb 就没问题。

Control键的映射，Control键是我们使用的最多的键之一然而它的位置却比较难按，我推荐你把Caps Lock键跟Control键进行调换位置，这样使用Control键组合的时候非常容易，相信我换过来后你爱上它的。

ESC键映射，ESC键是vim中频繁要使用的快捷键,如果我们需要从插入模式切换到命令模式需要使用ESC来进行切换，然而这样按起来非常麻烦（当然你也可以使用Ctrl+[来切换，不过会多按一个按键而且还很难按),这里我使用两种方法来映射ESC键:
方法1(vim映射):

```
" 映射esc为jk
inoremap jk <esc>
```

方法2(使用软件来修改映射):
修改后效果为单独按Caps Lock键是esc的功能，Caps Lock和其他键一起按则Caps Lock则是Control键的功能
方法1使用jk键来代替esc,因为经过统计几乎没有j和k连在一起的单词，所以我们可以放心的来代替esc，而且jk就在右手的食指和中指下按起来非常容易，这个比按Caps Lock还要简单,Caps Lock还要让左手的小拇指移动1cm。
方法2我使用了[Karabiner](https://pqrs.org/osx/karabiner/)这个软件来修改Caps Lock使得可以同时代替esc和Control键两个按键十分方便，因为单独按是ESC而Control键单独按没有效果，刚好这个特性使得这两个键可以映射在一个键上，对于方法1就可以映射esc键还补充方法2主要是如果我们使用idea、sublime、pycharm时可以使用Caps Lock来当做esc使用同时还保留Control键的功能。

```
  filetype plugin indent on
  syntax enable
```

执行`:filetype`可以查看到vim的文件类型检测功能是否已经打开，默认你会看到：filetype detection:ON plugin:OFF indent:OFF。
而我们第一句就是讲后面两个plugin及indent功能开启。下面详细介绍这三个参数的含义：

默认vim会自动检测文件类型，当我们开启了plugin功能时vim会在加载相应类型文件时加载相应的插件，比如为了让vim支持Python开发，那就需要加载一些Python的插件。而indent则会根据相应的文件类型来设置对应该文件的缩进等，不同的文件会有不同的缩进如Python、html使用4个空格作为缩进，而c、java、javascript使用2个空格作为缩进，那么indent就可以为不同文件类型选择合适的缩进了。

`syntax enable`可以让我们的vim自动识别关键字、字符串以及其他语法元素，并以不同的颜色显示出来。
当我们遇到一个无法识别的文件后缀但是我们希望它能高亮显示语法时可以使用`:set filetype=c`这样来对无法识别文件来手动指定文件类型。

接下来设置vim的快捷键(非插件),用来提升效率:

```
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 设置查看历史条数
set history=200
" F2切换开启或者关闭行号
nnoremap <F2> :set number!<CR>
" F3切换开启列高亮显示
nnoremap <F3> :set cursorcolumn!<CR>
" F4格式化json字符串
map <F4> :%!python -m json.tool<CR>
" 开启/关闭taglist
nmap <F8> :TagbarToggle<CR>
" 开启/关闭格式化粘贴
set pastetoggle=<F9>
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行
set cursorline
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set nowrap
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=2
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2
" 自动缩进代码
set autoindent
" 开启智能对齐
set smartindent
" 缩进代码量
set shiftwidth=2
" 删除空格数
set backspace=2
"为不同的文件类型设置不同的空格数替换TAB
autocmd FileType java,javascript,html,css,xml set ts=2
autocmd FileType java,javascript,html,css,xml set shiftwidth=2
autocmd FileType java,javascript,html,css,xml set softtabstop=2

autocmd FileType python,shell,bash set ts=4
autocmd FileType python,shell,bash set shiftwidth=4
autocmd FileType python,shell,bash set softtabstop=4

" 对于markdown文件需要进行换行方便书写
autocmd FileType markdown set wrap
```

上面展示了一些我的个人配置，比如F2作为行号的切换键，当我们不需要行号的时候可以去除这个干扰，专注开发，F3是列高亮对于对齐及列操作很有用处，F4是我非常喜欢的json格式化快捷键，这个很有用以前我要将一段压缩的json解析需要复制到站长之家或者一些web上在线的jsno解析工作那再粘贴解析或者在sublime上安装插件来解析不过效果不好，现在我要vi然后粘贴压缩的json字符串然后F4就可以看到格式化后的json字符串了,F8是显示一个文件的函数和变量的大纲，它能让我需要在一个很大的文件中快速跳转，这个使用插件[tagbar](https://github.com/majutsushi/tagbar)来实现的，后面会介绍，F9是粘贴模式的快捷键，如果我们直接从网页中复制一段代码粘贴在vim中格式是乱的跟粘贴之前的缩进不一样，这时就需要使用F9来切换成粘贴模式粘贴即可。
其他的还有一些编辑器上的配置如禁止光标闪烁、显示状态栏及根据不同类型的文件显示不同的缩进等。
全文频繁变更 .vimrc，要让变更内容生效，一般的做法是先保存 .vimrc 再重启 vim，太繁琐了，增加如下设置，可以实现保存 .vimrc 时自动重启加载它：

```
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

## 3插件管理
由于vim使用插件比较多，所以我们需要使用一个插件来管理vim的插件，这样下次我们在新的环境下配置时只需要将.vimrc文件拷过来然后安装插件即可。

插件管理我选择使用[vundle](https://github.com/VundleVim/Vundle.vim),插件列表如下:
​```Java
  " vundle 环境设置
  set rtp+=~/.vim/bundle/Vundle.vim
  " vundle 管理的插件列表必须位于 vundle  # begin() 和 vundle#end() 之间
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim' " 插件管理
  Plugin 'tomasr/molokai' " molokai vim主题
  Plugin 'vim-airline/vim-airline' " airline状态栏美化
  Plugin 'vim-airline/vim-airline-themes' " 状态栏主题包
  Plugin 'nathanaelkane/vim-indent-guides' " 代码块竖线
  Plugin 'scrooloose/nerdtree' " 加入NERDTree
  Plugin 'scrooloose/nerdcommenter' " 代码注释
  Plugin 'dyng/ctrlsf.vim' " 搜索功能
  Plugin 'SirVer/ultisnips' " 预定义模板
  Plugin 'honza/vim-snippets' " 模板库
  Plugin 'Valloric/YouCompleteMe' " 补全插件
  Plugin 'terryma/vim-multiple-cursors' " 多光标操作
  Plugin 'christoomey/vim-tmux-navigator' " tmux - vim中Ctrl + h, j, k, l光标冲突解决
  Plugin 'tpope/vim-fugitive' " 显示git branch
  Plugin 'alvan/vim-closetag' " html自动补全
  Plugin 'jiangmiao/auto-pairs' " 符号自动补全
  Plugin 'godlygeek/tabular' " 按符号自动对齐如: Tab \= , : Tab \|
  Plugin 'iamcco/mathjax-support-for-mkdp' " mardown实时预览辅助插件
  Plugin 'iamcco/markdown-preview.vim' " mardown实时预览插件
  Plugin 'kien/ctrlp.vim' " CtrlP文件搜索
  "Plugin 'marijnh/tern_for_vim' " js语法支持
  Plugin 'w0rp/ale' " 语法提示
  Plugin 'majutsushi/tagbar' " tagbar显示文件大纲
  " 插件列表结束
  call vundle#end()
```

安装插件需要在vim中运行

```
  :PluginInstall
```

就可以安装所有插件了。
这里有一点需要注意的是虽然vundle能帮助我们安装所有的插件，但是还是有一些配置需要在.vimrc之外进行配置的比如需要python的语法提示需要安装flake8,js的语法提示需要安装eslint且还要配置本地的.eslintrc文件，还有如果你使用tmux+vim+iTerm2进行开发还需要配置本地的.tmux.conf文件，后面我们会逐一介绍这些配置。
vundle卸载插件只需要我们将Plugin注释或者删除掉后，运行

```
  :PluginClean
```

vundle中插件需要更新升级运行

```
  :PluginUpdate
```

## 4插件配置

### 4.1界面美化

首先我们看到vim初始的时候是比较难看的界面，我们先进行界面美化。
我使用的是[molokai](https://github.com/tomasr/molokai)主题，其他的主题如[solarized](https://github.com/altercation/vim-colors-solarized)等其他的主题都可以根据自己喜好来设置。

```
" 配色方案
let g:molokai_original=1
let g:rehash256=1
colorscheme molokai
```

接下来美化状态栏，通过[vim-ariline](https://github.com/vim-airline/vim-airline)插件可是使vim得状态栏变得很漂亮。

```
" 设置状态栏主题风格
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
```

vim-airline这个插件坑比较多，一开始安上去会遇到箭头变成问号、箭头对不起等问题，主要是因为airline是基于powerline使用的用的，如果没有安装powerline的字体则airline会显示问号，如果字体大小不一致则会产生箭头对不齐，这里是配置iterm的字体为12pt Source Code Pro for Powerline显示箭头还算可以放大了就会对齐，不过影响不大。

### 4.2Tmux+Vim配置

通常开发时我们需要结合tmux+vim来实现开发环境快速搭建及恢复，但是光标在vim的窗口中切换及在tmux窗口间切换的键比较多，很久不用就会忘记而且很麻烦，所以我们通过[vim-tmix-navigator](https://github.com/christoomey/vim-tmux-navigator)来实现在vim和tmux中一样快捷键切换，使用Control+hjkl来实现四个方便的窗口切换而且不用考虑是vim的窗口还是tmux的窗口，插件会帮我们自动识别。

vim中buffer就相当于ide中一个tab，我们每打开一个文件就会显示一个tab，在ide中我们切换tab需要按很多键而且不容记住，现在我们自定义自己的buffer切换键，通过leader+u/o实现左右buffer的切换，leader+数字键可以实现快速切换到序号1~9的buffer。

```
" 映射切换buffer的键位
nnoremap <leader>u :bp<CR>
nnoremap <leader>o :bn<CR>
nnoremap <leader>x :bd<CR>
" 映射<leader > num到num buffer
map <leader>1 :b1<CR>
map <leader>2 :b2<CR>
map <leader>3 :b3<CR>
map <leader>4 :b4<CR>
map <leader>5 :b5<CR>
map <leader>6 :b6<CR>
map <leader>7 :b7<CR>
map <leader>8 :b8<CR>
map <leader>9 :b9<CR>
```

### 4.3文件树

ide中左侧一般都是树形展示项目结构，在vim中也可以做到我们使用[nerdtree](https://github.com/scrooloose/nerdtree)来实现

```
" NERDTree config
map <leader>f :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() == "primary") | q | endif

" 默认开启NERDTree
"autocmd vimenter * NERDTree
" 隐藏不需要显示的文件，如pyc
let NERDTreeIgnore=['\.pyc$']
```

这里我使用leader+f来作为切换文件树的开关，默认是不开启，我在需要的时候打开用即可，nerdtree功能很强大如使用o来打开一个文件，使用s来打开纵向打开一个文件，m会出现一个菜单可以进行文件及文件夹的新建、删除、重命名等操作。

### 4.4 插件补全

补全插件使用了强大[YouCompleteMe](https://github.com/Valloric/YouCompleteMe),这个安装起来比较麻烦
，但是补全的功能非常强大。
1.通过:PluginInstall安装YCM
2.下载安装最新版的 libclang
如果不需要 C 家族的语义化补全，则可跳过这一步

```
# brew install llvm-3.9 clang-3.9 libclang-3.9-dev libboost-all-dev
```

PS: ** YCM 官方墙烈推荐使用上游编译的二进制文件代替系统自带的 libclang**
3.编译构建 ycm_core 库

```
** 需要：cmake python3-dev**
```

YCM 的顶层目录或者说根目录应该是 ～/.vim/bundle/YouCompleteMe
创建一个目录放编译过程中产生的文件

```
$ mkdir ~/.ycm_build
$ cd ~/.ycm_build
```

生成 makefile
如果跳过第三步的话，则可以直接运行

```
$ cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
```

如果没有跳过第三步，说明需要 c 家族的语义化补全则需运行

```
$ cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
```

构建 ycm_core

```
#  --config Release 这个构建选项进针对 Windows
$ cmake --build . --target ycm_core --config Release
```

配置
复制 .ycm_extra_conf.py 文件

```
$ cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/
```

添加 vim 配置
注意下面的 python 解释器的路径要和编译 ycm_core 的时候使用的 python 解释器是相同的版本（2 或 3）

```
" ～/.vimrc
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
```

测试
新建一个 hello.c 文件，看看是否自动补全头文件，然后在 vim 中运行 :YcmToggleLogs stderr 命令查看错误日志

### 4.5 搜索功能

全局搜索使用的是[CtrlSF](https://github.com/dyng/ctrlsf.vim),它是使用ack的需要安装ack

```
" CtrlSF搜索
" 默认程序为ACK而不是AG
let g:ctrlsf_ackprg='ack'
" 修改ctrlsf快捷键
nnoremap <leader>g :CtrlSF<Space>
" ctrlsf搜索忽略目录
let g:ctrlsf_ignore_dir=["node_modules", "static"]
```

如果是要搜索按照文件名搜索需要使用[CtrlP](https://github.com/kien/ctrlp.vim)

```
" CtrlP文件搜索
let g:ctrlp_custom_ignore='\v[\/](node_modules|static|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_map='<leader>s'
```

### 4.6 语法提示

语法提示我使用了[ale](https://github.com/w0rp/ale)插件来进行语法提示，它最大的好处是异步的我们不会因为加载了文件过大而卡住，它会在后台执行完后显示出来。

```
" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" 保存时候在进行语法提示
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

" 对于JS的语法设置
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'html': ['tidy-html5'],
\}
```

### 4.7ctags+git hook自动生成

在.git/hooks下新建文件ctags
内容如下

```
#!/bin/sh
set -e
PATH="/usr/local/bin:$PATH"
dir=$(dirname $(git rev-parse --absolute-git-dir))"/WebSite"
trap 'rm -f "$dir/$$.tags"' EXIT
git ls-files | \
  ctags --tag-relative -L - -f "$dir/$$.tags" -R --fields=+l --languages=python --python-kinds=-iv ./ $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")
mv "$dir/$$.tags" "$dir/tags"
```

在.git/hooks下新建post-checkout,post-commit,post-merge内容如下

```
#!/bin/sh
.git/hooks/ctags >/dev/null 2>&1 &
```

它们代表切换分支，提交commit，merge都会调用ctags来生成新的tags来取代旧版本的tags

在.git/hooks下新建pots-rewrite内容如下:

```
#!/bin/sh
case "$1" in
  rebase) exec .git/hooks/post-merge ;;
esac
```

这样无论是我们checkout、merge、commit还是rebase都会帮我们自动生成最新的tags，当我切换分支或者提交后，开始生成临时![{pid}.tag，](https://math.jianshu.com/math?formula=%7Bpid%7D.tag%EF%BC%8C){pid}.tags生成完毕后会修改成tags文件，这一切都在后台运行不会卡住前端任务

### 4.8其他的一些插件配置

[Markdown](https://github.com/iamcco/markdown-preview.vim)配置:

```
" markdown peview settings
let g:mkdp_auto_start = 1
```

[tagbar](https://github.com/majutsushi/tagbar)配置:

```
" 设置tagbar执行程序位置
let g:tagbar_ctags_bin = "`brew --prefix`/bin/ctags"
```

[vim-closetag](https://github.com/alvan/vim-closetag)配置:

```
" 用于解决vim-closetag和delimitMate在写html导致<html></html>>多一个>的情况
let g:closetag_filenames="*.xml,*.html,*.xhtml,*.phtml,*.php"
auto FileType xml,html,php,xhtml,js let b:delimitMate_matchpairs="(:),[:],{:}"
```