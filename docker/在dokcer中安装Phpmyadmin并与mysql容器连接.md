首先在docker中搜索可用的镜像

```bash
$sudo docker search phpmyadmin
```

发现镜像后使用`docker pull`将镜像拉取下来 
**先建立mysql容器，再建立phpmyadmin容器**

```bash
$sudo docker run -d -h mysql -v /data/mysql:/var/lib/mysql -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=root mysql 
-h 设定主机名

$sudo docker run --name phpadmin --link mysql:db -p 9998:80 -d phpmyadmin/phpmyadmin
--link代表容器本容器与mysql连接，并起一个别名为db
```

访问宿主机的9998端口即可出现phpmyadmin登录界面

**若要修改phpadmin的配置文件,默认目录为/www**

```bash
$sudo docker exec -it phpadmin vi /www/libraries/config.default.php
或者
$sudo docker exec -it phpadmin vi /www/config.inc.php
```

若需要将phpmyadmin嵌入其他页面，可能需要修改config.default.php中的

```bash
$cfg['AllowThirdPartyFraming'] = true; 
```

