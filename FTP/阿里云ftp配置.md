​	

> 在ftp 配置文件中

```php

# Port range for passive connections replies. - for firewalling.

PassivePortRange          39000 40000

```

> 阿里云开放此端口

<img src="./img.png">

在ftp 配置文件中最后一行添加即可

```
pasv_address = 【公网地址】47.94.145.17
```

