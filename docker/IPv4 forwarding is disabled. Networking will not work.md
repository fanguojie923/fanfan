centos 7 docker 启动了一个web服务 但是启动时 报

WARNING: IPv4 forwarding is disabled. Networking will not work.

**网上查询了下 需要做如下配置**

**解决办法：**

vi /etc/sysctl.conf

或者

vi /usr/lib/sysctl.d/00-system.conf

添加如下代码：

net.ipv4.ip_forward=1

重启network服务

systemctl restart network

查看是否修改成功

sysctl net.ipv4.ip_forward

如果返回为“net.ipv4.ip_forward = 1”则表示成功了