# [centos出现“FirewallD is not running”怎么办](https://www.cnblogs.com/kccdzz/p/8110143.html)



最近在阿里云服务器centos上安装了mysql数据库，默认是不开启远端访问功能，需要设置一下防火墙，在开放默认端口号 3306时提示FirewallD is not running，经过排查发现是防火墙就没打开造成的，出于安装考虑还是把防火墙开上吧，以下步骤仅供参考啦。

## 工具/原料

 

- 阿里云服务器centos

## 方法/步骤

 

1. 

   执行firewall-cmd --permanent --zone=public --add-port=3306/tcp，提示FirewallD is not running，如下图所示。

   [![centos出现“FirewallD is not running”怎么办](https://imgsa.baidu.com/exp/w=500/sign=3783b5472134349b74066e85f9eb1521/7dd98d1001e939013391d96372ec54e737d196df.jpg)](http://jingyan.baidu.com/album/5552ef47f509bd518ffbc933.html?picindex=1)

2. 

   通过systemctl status firewalld查看firewalld状态，发现当前是dead状态，即防火墙未开启。

   [![centos出现“FirewallD is not running”怎么办](https://imgsa.baidu.com/exp/w=500/sign=0c6057bedc39b6004dce0fb7d9513526/55e736d12f2eb93882fe2eafdc628535e4dd6fdf.jpg)](http://jingyan.baidu.com/album/5552ef47f509bd518ffbc933.html?picindex=2)

3. 

   通过systemctl start firewalld开启防火墙，没有任何提示即开启成功。

   [![centos出现“FirewallD is not running”怎么办](https://imgsa.baidu.com/exp/w=500/sign=32b9322ef2f2b211e42e854efa816511/e61190ef76c6a7efec9afc7bf4faaf51f3de662a.jpg)](http://jingyan.baidu.com/album/5552ef47f509bd518ffbc933.html?picindex=3)

4. 

   再次通过systemctl status firewalld查看firewalld状态，显示running即已开启了。

   [![centos出现“FirewallD is not running”怎么办](https://imgsa.baidu.com/exp/w=500/sign=79a4d13cf11986184147ef847aec2e69/503d269759ee3d6d9f44d3964a166d224e4adee9.jpg)](http://jingyan.baidu.com/album/5552ef47f509bd518ffbc933.html?picindex=4)

5. 5

   如果要关闭防火墙设置，可能通过systemctl stop firewalld这条指令来关闭该功能。

   [![centos出现“FirewallD is not running”怎么办](https://imgsa.baidu.com/exp/w=500/sign=ce97d76d33f33a879e6d001af65d1018/2e2eb9389b504fc2cecce458ecdde71191ef6ddf.jpg)](http://jingyan.baidu.com/album/5552ef47f509bd518ffbc933.html?picindex=5)

6. 6

   再次执行执行firewall-cmd --permanent --zone=public --add-port=3306/tcp，提示success，表示设置成功，这样就可以继续后面的设置了。

   [![centos出现"FirewallD is not running"怎么办](https://imgsa.baidu.com/exp/w=500/sign=9a524f1e82d4b31cf03c94bbb7d7276f/42166d224f4a20a4969c689a99529822730ed0e9.jpg)](http://jingyan.baidu.com/album/5552ef47f509bd518ffbc933.html?picindex=6)

   # [CentOS7使用firewalld打开关闭防火墙与端口](https://www.cnblogs.com/blueskyli/p/7218804.html)

   

   1、firewalld的基本使用

   启动： systemctl start firewalld

   查看状态： systemctl status firewalld 

   停止： systemctl disable firewalld

   禁用： systemctl stop firewalld

    

   2.firewalld是centos7的一大特性，最大的好处有两个：支持动态更新，不用重启服务；

   启动一个服务：systemctl start firewalld.service

   关闭一个服务：systemctl stop firewalld.service

   重启一个服务：systemctl restart firewalld.service

   显示一个服务的状态：systemctl status firewalld.service

   在开机时启用一个服务：systemctl enable firewalld.service

   在开机时禁用一个服务：systemctl disable firewalld.service

   查看服务是否开机启动：systemctl is-enabled firewalld.service

   查看已启动的服务列表：systemctl list-unit-files|grep enabled

   查看启动失败的服务列表：systemctl --failed

   3.配置firewalld-cmd

   查看版本： firewall-cmd --version

   查看帮助： firewall-cmd --help

   显示状态： firewall-cmd --state

   查看所有打开的端口： firewall-cmd --zone=public --list-ports

   更新防火墙规则： firewall-cmd --reload