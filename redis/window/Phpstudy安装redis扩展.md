# phpstudy的Redis扩展

2018年12月24日 

个人分类： [PHP](https://blog.csdn.net/qq_23989101/article/category/7292990)

一、查看自己的PHPinfo信息

![img](https://img-blog.csdn.net/20180320172101749)

二、查找相对应得Redis扩展

1.下载地址：<http://pecl.php.net/package/redis>

我的是x86，vc14

![img](https://img-blog.csdn.net/20180320172203944)

![img](https://img-blog.csdn.net/20180320172213997)

三、操作

1.解压，并复制php_redis.dll 和 php_redis.pdb

![img](https://img-blog.csdn.net/20180320172228832)

2.粘贴到PHPstudy的PHP的ext（注意你的PHP版本，我的是php7）

![img](https://img-blog.csdn.net/20180320172248623)

3.打开PHPstudy的 其他选项菜单 -> 打开配置文件 -> php.ini，加上 extension=php_redis.dll

![img](https://img-blog.csdn.net/20180320172303860)

4.重新启动phpstudy

 

四、PHPinfo查看

![img](https://img-blog.csdn.net/20180320172333595)

完成！！！

##### 尝试代码调用

尝试一下用写代码使用一下。创建一个PHP文件，输入以下代码：

```
<?php



    $redis = new Redis();  //实例化这个类



	$redis->connect('localhost', 6379);  //指定主机和端口进行连接



	$redis->set('myname', 'mclink'); //设置键值对



	$res = $redis->get('myname');  //获取值



	echo "我设置的myname键的值为：".$res;  //打印输出
```

然后访问一下这个文件。可以看到：

![img](https://img-blog.csdn.net/20180326150238548)

如果你访问失败了，可能你是忘记了开启服务器端 到redis 安装目录

```
redis-server.exe redis.windows.conf
```

，不然应该是不会有问题的。

好了现在你的PHPstudy已经可以正常使用redis数据库了。

 