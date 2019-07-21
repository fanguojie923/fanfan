## 编写Dockerfile支持systemd基础镜像

```shell
FROM centos:7
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

## 
```

 

## 构建支持systemd基础镜像

```shell
$ sudo docker build --rm -t local/c7-systemd .
```

#### 基于基础镜像编写httpd服务镜像

```
FROM local/c7-systemd
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service
EXPOSE 80

CMD ["/usr/sbin/init"]


```

## 构建httpd服务镜像

```
$ sudo docker build --rm -t local/c7-systemd-httpd .
```

## 运行httpd服务镜像

```
$ sudo docker run -tid --privileged=true \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 \
  local/c7-systemd-httpd
```

注意：–privileged=true参数，表示容器拥有root权限，官方文档没有加这个参数，我测试时镜像启动出错。

### 在容器中查看systemctl命令

```
$ sudo docker exec -it <your-container-name> bash
```

完美看到httpd运行情况

```
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Active: active (running) since Thu 2018-09-06 08:02:56 UTC; 2min 11s ago
     Docs: man:httpd(8)
           man:apachectl(8)
 Main PID: 18 (httpd)
   Status: "Total requests: 10; Current requests/sec: 0; Current traffic:   0 B/sec"
   CGroup: /docker/7ded642bc79721ca7013a8b337b8e049ec83afe8ea9fe9b73ce40866fd8064a2/system.slice/httpd.service
           ├─18 /usr/sbin/httpd -DFOREGROUND
           ├─20 /usr/sbin/httpd -DFOREGROUND
           ├─21 /usr/sbin/httpd -DFOREGROUND
           ├─22 /usr/sbin/httpd -DFOREGROUND
           ├─23 /usr/sbin/httpd -DFOREGROUND
           ├─24 /usr/sbin/httpd -DFOREGROUND
           ├─25 /usr/sbin/httpd -DFOREGROUND
           ├─26 /usr/sbin/httpd -DFOREGROUND
           └─27 /usr/sbin/httpd -DFOREGROUND
```

 