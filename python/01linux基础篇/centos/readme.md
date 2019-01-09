ip addr  

ifconfig 不能用

vi /etc/sysconfig/network-scripts/ifcfg .......



1. ONBOOT=yes

2. service network restart

3. ip addr  此时会多一个ip

4. yum install net-tools   安装 y y

5. ifconfig

   

##### 更换默认源

​	1. 设备 更换为桥接否则网络为内网

​      	2.ifconfig 得到外网ip 

​       3.用xshell连接

   	4.wget

​	5.yum install wget

​	6.http://mirrors.163.com/.help/centos.html 根据网址操作

### 使用说明

首先备份/etc/yum.repos.d/CentOS-Base.repo

```
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
```

下载对应版本repo文件, 放入 cd /etc/yum.repos.d/ (操作前请做好相应备份)

- [CentOS7](http://mirrors.163.com/.help/CentOS7-Base-163.repo)
- [CentOS6](http://mirrors.163.com/.help/CentOS6-Base-163.repo)
- [CentOS5](http://mirrors.163.com/.help/CentOS5-Base-163.repo)

运行以下命令生成缓存

```
cd /etc/yum.repos.d/
wget http://mirrors.163.com/.help/CentOS7-Base-163.repo
yum clean all
yum makecache
```

#### 安装VIM

> yum install yum 	



