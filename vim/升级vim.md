工作环境：

- centos 6
- vim 7.15 升级到 vim 8.1

完整的过程：

1. 卸载原来的 vim
2. 下载 vim 源码包
3. 安装 vim 源码包（重点在于配置，虽然配置信息没有完全看懂）

```
# 1. 先卸载原来的 vim
[hx@localhost ~]$ sudo yum -y remove vim
[hx@localhost ~]$ sudo yum install ncurses-devel python-devel -y  # 安装必要组件

# 2. 下载新的 vim 包
[hx@localhost ~]$ git clone https://github.com/vim/vim.git
[hx@localhost ~]$ cd vim 

# 3. 安装 vim 源码包
[hx@localhost vim]$ ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            # --enable-pythoninterp=yes \
            # --with-python-config-dir=/usr/lib64/python2.6/config \  # 找到自己系统 python2 对应 config 目录
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/local/python36/lib/python3.6/config-3.6m-x86_64-linux-gnu \  # 找到自己系统 python3 对应 config 目录
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr/local/vim
[hx@localhost vim]$ sudo make install

# 4. 将 vim 添加到环境变量 PATH 中
[hx@localhost vim]$ export PATH=$PATH:/usr/local/vim/bin  # 临时修改
[hx@localhost vim]$ sudo vi /etc/profile  # 对所有用户永久修改
```

在 /etc/profile 文件末尾增加两行：

```
PATH=$PATH:/usr/local/vim/bin
export PATH
```



![img](https:////upload-images.jianshu.io/upload_images/11455432-f19610d0a7a98dd1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/583/format/webp)

编译参数说明

作者：数据搬瓦工

链接：https://www.jianshu.com/p/7dc470f98fb8

来源：简书

简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。