## docker 学习

​	--参考文档<https://yeasy.gitbooks.io/docker_practice/content/image/pull.html>

- <a href="./安装.md">安装</a>
  - <a href="./Docker构建PHP环境(一)之MySQL.md">Docker构建PHP环境(一)之MySQL</a>
  - <a href="./Docker构建PHP环境(二)之Redis.md">Docker构建PHP环境(二)之Redis</a>
  - <a href="./Docker构建PHP环境(三)之PHP7.2.md">Docker构建PHP环境(三)之PHP7.2</a>
  - <a href="./Docker构建PHP环境(四)之Nginx.md">Docker构建PHP环境(四)之Nginx</a>
  - <a href="./Docker构建PHP环境(五)之扩展安装.md">Docker构建PHP环境(五)之扩展安装</a>
  - <a href="./Docker构建PHP环境(六)之使用mysqli.md">Docker构建PHP环境(六)之使用mysqli</a>
  - <a href="./Docker构建PHP环境(七)之laravel.md">Docker构建PHP环境(七)之laravel</a>
  - <a href="./Docker用gogs管理git仓库.md">Docker用gogs管理git仓库</a>
  - 配置负载均衡<https://learnku.com/articles/26026#487694>
- <a href="./安装2.md">安装2</a>
- <a href="./安装离线.md">安装离线</a>
- <a href="./命令帮助.md">命令帮助</a>
- 使用镜像
  - <a href="./获取镜像.md">获取镜像</a>
    - <a href="./Docker中CentOS7镜像使用systemctl命令方法.md">Docker中CentOS7镜像使用systemctl命令方法</a>
  - <a href="./删除镜像.md">删除镜像</a>
- 操作容器
  - <a href="./删除容器.md">删除容器</a>
- Docker三剑客之Compose项目
  - <a href="./docker-compose/离线安装.md">Compose离线安装</a>
  - <a href="./docker-compose/Docker-Compose简介.md">Docker-Compose简介</a>
  - <a href="./docker-compose/Docker-Compose常用命令.md">Docker-Compose常用命令</a>
  - <a href="./docker-compose/Docker-Compose模板文件.md">Docker-Compose模板文件</a>

​	

> Docker虚拟化优点

1）操作 启动快

​	运行时性能可以获取极大提升，管理操作（启动，停止，开始，重启等等）都时以秒或者毫秒级

2）轻量级虚拟化

​	拥有足够的“操作系统”，仅需添加或减小镜像即可，在一台服务器上可以部署100~1000个containers容器。传统虚拟化，虚拟10-20个虚拟机就不错了

3）开源免费

 开源的，免费的，低成本的，由现代linux内核支持并驱动 ，轻量的container必定可以在一个物理机上开启更多“容器”，注定比VMS要便宜。

4）前景及云支持

​	正在越来越受欢迎，包括各大主流公司都在推动docker的快速发展，性能又很大优势

> 底层技术支持

1. Namespaces:做隔离pid,net,ipc,mnt,uts
2. Control groups: 做资源限制
3. Union file systems: Containe和image 分层

Docker 必须先安装防火墙

1. 安装防火墙 yum install firewalld
2. 开启防火墙  systemctl unmask firewalld   systemctl enablefirewalld    systemctl start firewalld 
3. 开启端口 
   1. firewall-cmd --zone=public  --add-port=2377/tcp --permanent
   2. firewall-cmd --zone=public  --add-port=7946/tcp  --permanent
   3. firewall-cmd --zone=public  --add-port=7946/udp --permanent
   4. firewall-cmd --zone=public  --add-port=4789/tcp  --permanent
   5. firewall-cmd --zone=public  --add-port=4789/udp --permanent
   6. firewall-cmd --reload