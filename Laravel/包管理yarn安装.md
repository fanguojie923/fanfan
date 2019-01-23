# [舀](https://scoop.sh/)

https://github.com/lukesampson/scoop/wiki

Windows的命令行安装程序

### Scoop安装您熟悉和喜爱的工具

```
scoop install curl
```

### 熟悉Windows命令行

寻找熟悉的Unix工具？厌倦了Powershell的*动词 - 名词*冗长？炒到可以让您充分[的程序](https://github.com/lukesampson/scoop/tree/master/bucket)，你[需要的](https://github.com/lukesampson/scoop-extras)，具有指向和点击的最小量。

### 告别权限弹出窗口

默认情况下，Scoop会将程序安装到您的主目录。因此，您不需要管理员权限来安装程序，并且每次需要添加或删除程序时都不会看到UAC弹出窗口。

### Scoop为您读取README

不确定您是需要32位还是64位？不记得你安装后必须键入的命令才能获得你需要的其他东西吗？Scoop让你满意。只是`scoop install`，你将准备好立即工作。

# 演示

# 安装在几秒钟内

确保安装了[Powershell 3](https://www.microsoft.com/en-us/download/details.aspx?id=34595)（或更高版本）和[.NET Framework 4.5](https://www.microsoft.com/net/download)（或更高版本）。然后运行：

```
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
```

**注意：**如果出现错误，可能需要更改执行策略（即启用Powershell）`Set-ExecutionPolicy RemoteSigned -scope CurrentUser`



#### 通过 Scoop 安装

[Scoop](http://scoop.sh/) 是一个用于 Windows 的基于命令行的安装工具。 请按照此 [说明](https://github.com/lukesampson/scoop/wiki/Quick-Start) 安装 Scoop 。

Scoop 安装后，你就可以在控制台执行如下命令安装 Yarn 了：

```
scoop install yarn
```

如果 [Node.js](https://nodejs.org/) 未被安装，scoop 会提示你安装。 例如：

```
scoop install nodejs
```

#### 注意

请将您的项目目录和 Yarn 的缓存目录 (%LocalAppData%\Yarn) 列入杀毒软件的白名单中，否则会因为每次向磁盘写入文件时而被扫描，导致安装软件包变得很慢。

通过如下命令测试 Yarn 是否安装成功：

```
yarn --version
```

 