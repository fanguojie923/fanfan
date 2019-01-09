## 服务器安装SSH 服务

##### 安装SSH  

> ​	yum  install openssh-server

启动SSH

> ​	service sshd start

设置开机运行

> ​	chkconfig sshd on

查看进程

> ​	ps -ef |grep ssh

安装客户端

> ​	yum install openssh-clients  



##### ssh连接

> ​	ssh  用户名@外网ip



### SSH config讲解

​	

| HOST         | 别名         |
| ------------ | ------------ |
| HOSTNAME     | 主机名       |
| PORT         | 端口         |
| user         | 用户名       |
| IdentifyFile | 秘钥文件路径 |



​	1.cd  ~/.ssh/

​	2.ls

​	3.touch config

​	4 . vim config

​	 

```
host  "fan"

​		四个空格HostName   47.94.145.17 

​		四个空格User  root

​				Port 22	
host  "fan1"

​		四个空格HostName   47.94.145.17 

​		四个空格User  root

​				Port 22	

ssh fan
ssh fan1都可以登录
```

​	

