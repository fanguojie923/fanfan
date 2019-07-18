## 1. vim缓存区和系统剪贴板

- vim 里面复制粘贴实际上是在[vim寄存器](https://mounui.com/233.html)中存取数据
- 系统的`ctry+c，ctry+v`是与系统剪贴板之间的交互

vim 复制粘贴和系统复制粘贴操作的不是同一个东西，所以系统和 vim 之间不是那么容易直接使用的。

## 2. 解决方法

1. 查看 vim 版本是否支持`clipboard`,用vim打开一个文件，然后执行命令`:reg`查看是否有`+`或`*`号；或者执行`:version`命令查看是否有`+clipboard`，注意`clipboard`前面是个加号，如果是减号说明不支持，需要安装`vim-gnome`。如果存在，则可以使用 `"+y` 将vim里面的内容复制到系统剪贴板或者 `"+p` 将系统剪贴板里面的内容粘贴到vim里面。
2. 可以在配置文件里面设置 `clipboard=unnamed` 这样就可以直接使用 y p 命令直接复制粘贴了。

如果你习惯使用`CTRL+C`和`CTRL+V`可以在配置文件中设置：



" 将CTRL-C,CTRL-V映射为"*y,"*p

```
vmap <C-C> "*y
nmap <C-V> "*p
```

