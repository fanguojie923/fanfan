## **Redis由Windows自启动的，配置文件的设置都是无效的** 

**解决方案：**

1、禁用Redis的自启动，设置为手动

2、不要使用Redis安装版，使用压缩版

3、通过命令行CMD加载配置文件（redis.windows.conf）启动

代码  ![收藏代码](http://fanshuyao.iteye.com/images/icon_star.png)

1. D:\soft\Redis>redis-server.exe redis.windows.conf  

 

通过Cmd启动的界面都是不一样的，如下：
![img](https://images2015.cnblogs.com/blog/1081330/201707/1081330-20170711171858743-1029152175.png)

看到了正常启动的盒子。

 

4、再新打开一个cmd（不要关闭之前打的Cmd窗口），启动Redis客户端：

Java代码  ![收藏代码](http://fanshuyao.iteye.com/images/icon_star.png)

1. D:\soft\Redis>redis-cli.exe  

 

5、获取Redis中某个key的值，提示无权限。

 

代码  ![收藏代码](http://fanshuyao.iteye.com/images/icon_star.png)

1. 127.0.0.1:6379> get name  
2. (error) NOAUTH Authentication required.  
3. 127.0.0.1:6379>  

 这样才是对的。

 

6、通过密码进入访问，使用 auth + 密码，如下：

代码  ![收藏代码](http://fanshuyao.iteye.com/images/icon_star.png)

1. 127.0.0.1:6379> get name  
2. (error) NOAUTH Authentication required.  
3. 127.0.0.1:6379> auth 123456  
4. OK  
5. 127.0.0.1:6379> get name  
6. "haha"  
7. 127.0.0.1:6379>  

### **如果不是安装版的Redis，又想让Redis自启动的时候，可以向Windows添加自启动服务：**

1、进入到Redis的安装目录

代码  ![收藏代码](http://fanshuyao.iteye.com/images/icon_star.png)

1. > D:\soft\Redis>  

   2、执行命令：

代码  ![收藏代码](http://fanshuyao.iteye.com/images/icon_star.png)

1. > D:\soft\Redis>redis-server --service-install redis.windows.conf --loglevel notice --service-name Redis  

-  --service-install redis.windows.conf  指定redis配置文件
- --loglevel notice 指定日志级别
- --service-name Redis 指定服务名称

 

运行结果如下（ Redis successfully installed as a service.）：

代码  ![收藏代码](http://fanshuyao.iteye.com/images/icon_star.png)

1. D:\soft\Redis>redis-server --service-install redis.windows.conf --loglevel notice --service-name Redis  
2. [7176] 12 Jul 09:34:50.730 # Granting read/write access to 'NT AUTHORITY\NetworkService' on: "D:\soft\Redis" "D:\soft\Redis\"  
3. [7176] 12 Jul 09:34:50.730 # Redis successfully installed as a service.  

 

3、安装服务后，默认不是马上启动的，但启动类型是自启动，如果想马上启动，请执行命令：

代码  ![收藏代码](http://fanshuyao.iteye.com/images/icon_star.png)

1. > redis-server --service-start  

代码  ![收藏代码](http://fanshuyao.iteye.com/images/icon_star.png)

1. 服务成功启动显示如下：  

2. > [9876] 12 Jul 09:57:41.251 # Redis service successfully started.  

或者重启电脑。

停止服务：

代码  ![收藏代码](http://fanshuyao.iteye.com/images/icon_star.png)

1. redis-server --service-stop  

###### 4、删除Redis服务：

代码  ![收藏代码](http://fanshuyao.iteye.com/images/icon_star.png)

1. redis-server --service-uninstall  