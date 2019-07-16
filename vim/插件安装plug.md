# 安装 vim-plug



```

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

需要 curl 没有的话单独安装

## 安装插件

```
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
" Plug 其他若干
call plug#end()
```

`:source ~/.vimrc` 在 vim 中重新加载配置

## vim-plug 操作

在 vim 中使用的命令

### 状态

`PlugStatus` 检查现在 plug 负责的插件状态

### 安装

`PlugInstall` 安装配置好的插件

### 更新

`PlugUpdate` 更新已安装的插件

### 清理

`PlugClean` 清理插件，需要现在 .vimrc 里面删除或注释掉

### 升级

`PlugUpgrade` 升级自身













**2**
mkdir ~/.vim/autoload/
cd ~/.vim/autoload/
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
配置vim plug
vim ~/.vimrc
将要安装的插件写入~/.vimrc，这里以ycm插件为例：
" Specify a directory for plugins 
call plug#begin('~/.vim/plugged')
 "以安装ycm插件为例
Plug 'Valloric/YouCompleteMe'

" Initialize plugin system
call plug#end()
vim ~/.vimrc
切换到命令行模式，依次输入
PlugStatus
PlugInstall
就可以安装插件了
使用vim plug可以方便的管理插件
查看插件类型：
：PlugStatus
安装插件：
：PlugInstall
更新插件：:PlugUpdate
vim-plug本身更新：:PlugUpgrade