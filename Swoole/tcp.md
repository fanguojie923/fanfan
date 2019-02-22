之前看文档我一直以为swoole是个框架，需要我们配置然后设置端口访问，其实不是，swoole是php的扩展，我们只需要在我们的项目中增加server.php,或者其他的名字，里面的代码简单点可以按照文档上来写，如下：

```
//创建Server对象，监听 127.0.0.1:9501端口
$serv = new swoole_server("127.0.0.1", 9501); 

//监听连接进入事件
$serv->on('connect', function ($serv, $fd) {  
    echo "Client: Connect.\n";
});

//监听数据发送事件
$serv->on('receive', function ($serv, $fd, $from_id, $data) {
    $serv->send($fd, "Server: ".$data);
});

//监听连接关闭事件
$serv->on('close', function ($serv, $fd) {
    echo "Client: Close.\n";
});

//启动服务器
$serv->start(); 
```

```
<?php
//创建服务器 TCP
$host = '0.0.0.0';//string
$port = 9501;//int
/**
 * $host : 127.0.0.1 本地Ip
 *           192.168.50.133监听对应外网Ip
 *  ipv4 / ipv6 ::0
 *  $port:端口号 1024以下 需要root权限
 *  $mode:SWOOLE PROCESS多进程方式  默认不需要
 *  $sock_type ：SWOOLE_SOCK_TCP 默认不需要
 */
// $serv = new swoole_server($host,$port,$mode,$sock_type);
$serv = new swoole_server($host,$port);
//使用
//$bool $swoole_server->on(string $event,mixed $callback);
/**
 *$event:
 *connect: 当建立连接的时候 $srev:服务器信息 $fd客户信息
 *receive: 当接收到数据  $srev:服务器信息 $fd客户端 $from_id:id $data:数据
 *close:关闭连接
 */
$serv->on('connect',function($serv,$fd){
    var_dump($serv);
    var_dump($fd);
    echo "建立连接\n";
});
$serv->on('receive',function($serv,$fd,$from_id,$data){
    echo "接收到数据\n";
    var_dump($data);
});
$serv->on('close',function($serv,$fd){
    echo "关闭连接";

});
```

这里就创建了一个TCP服务器，监听本机9501端口，你也可以改成其他的端口号，只要你的服务器可以支持这个端口。
服务器端的server必须运行起来我们才能使用swoole，异步执行。如何运行呢？我们cd到你的项目下server.php 所在的文件夹，然后执行

```
php server.php
```

如何测试成功呢？我们可以关掉这个客户端，重新打开连接服务器，然后执行



```
telnet 127.0.0.1 9501
hello
Server: hello
```

如果是这样子说明成功了。
需要注意的是我们如果修改了server.php,必须断掉之前，然后重新打开。
我这边写了一个脚本来断掉之前的，起名stop.sh

```
#! /bin/bash
ps -eaf |grep "server.php" | grep -v "grep"| awk '{print $2}'|xargs kill -9
```

这需要放在和server.php同一个文件夹。
我们需要cd到这个文件夹，执行

> sh stop.sh



# client

这个是可以在浏览器上执行的，我们见一个client.php，代码如下：

```
$client = new swoole_client(SWOOLE_SOCK_TCP);

//连接到服务器
if (!$client->connect('127.0.0.1', 9501, 0.5))
{
    die("connect failed.");
}
//向服务器发送数据
if (!$client->send("hello world"))
{
    die("send failed.");
}
//从服务器接收数据
$data = $client->recv();
if (!$data)
{
    die("recv failed.");
}
echo $data;
//关闭连接
$client->close();
```

创建一个TCP的同步客户端，此客户端可以用于连接到我们server服务器。向服务器端发送一个hello world字符串，服务器会返回一个 Server: hello world字符串。
以上是swoole简单的安装和连同。