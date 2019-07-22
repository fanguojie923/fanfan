**1、拉取php镜像**

```
docker pull php:7.2-fpm
```

**2、创建项目目录**

```
mkdir -p /wwwroot/server/project
mkdir php-fpm && cd php-fpm (在server下目录安装)
mkdir logs
```

**3、运行一个临时php容器**

```
docker run --name testphp -d php:7.2-fpm
```

**4、复制php配置文件等**

```
docker cp testphp:/usr/local/etc/php $PWD/php
cd php && cp php.ini-development php.ini
cd ..(返回php-fpm目录下)
```

**5、运行新的php容器**

```
docker run -p 9000:9000 --name php7.2 -v /wwwroot/server/project:/www -v $PWD/php:/usr/local/etc/php 
-v $PWD/logs:/phplogs --link mysql:mysql --link redis:redis  -d php:7.2-fpm
```



```
运行成功后删除testphp：  docker rm -f testphp
```

*注：(--link参数：把php和mysql还有reids建立连接，当你用php连接mysql的时候host地址可以添mysql， redis同理)