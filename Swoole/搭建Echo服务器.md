# 搭建Echo服务器从Echo Server开始！

------

[TOC]

所有讲解网络通信编程的书籍都会最先讲解如何编写一个Echo服务器，本书也不例外。本章将讲解如何快速编写一个基于Swoole扩展的Echo服务器。几乎所有的网络编程书都从教学如何建立一个Echo开始服务器。那么，我们将为本指南做同样的事情。在本章中，我们将学习如何基于Swoole快速构建Echo Server！

## 服务端服务器

创建一个`Server.php`文件并输入如下内容：创建一个名为'Server.php'的文件并输入以下代码：

```php
// Server
class Server
{
    private $serv;

    public function __construct() {
        $this->serv = new swoole_server("0.0.0.0", 9501);
        $this->serv->set(array(
            'worker_num' => 8,
            'daemonize' => false,
        ));

        $this->serv->on('Start', array($this, 'onStart'));
        $this->serv->on('Connect', array($this, 'onConnect'));
        $this->serv->on('Receive', array($this, 'onReceive'));
        $this->serv->on('Close', array($this, 'onClose'));

        $this->serv->start();
    }

    public function onStart( $serv ) {
        echo "Start\n";
    }

    public function onConnect( $serv, $fd, $from_id ) {
        $serv->send( $fd, "Hello {$fd}!" );
    }

    public function onReceive( swoole_server $serv, $fd, $from_id, $data ) {
        echo "Get Message From Client {$fd}:{$data}\n";
        $serv->send($fd, $data);
    }

    public function onClose( $serv, $fd, $from_id ) {
        echo "Client {$fd} close connection\n";
    }
}
// 启动服务器 Start the server
$server = new Server();
```

## 客户端客户端

创建一个`Client.php`文件并输入如下内容：创建一个名为“Client.php”的文件并输入以下代码：

```php
<?php
class Client
{
    private $client;

    public function __construct() {
        $this->client = new swoole_client(SWOOLE_SOCK_TCP);
    }

    public function connect() {
        if( !$this->client->connect("127.0.0.1", 9501 , 1) ) {
            echo "Error: {$this->client->errMsg}[{$this->client->errCode}]\n";
        }

        fwrite(STDOUT, "请输入消息 Please input msg：");  
        $msg = trim(fgets(STDIN));
        $this->client->send( $msg );

        $message = $this->client->recv();
        echo "Get Message From Server:{$message}\n";
    }
}

$client = new Client();
$client->connect();
```

## 运行吧！

在Terminal下执行命令`php Server.php`即可启动服务器，在另一个Terminal下执行`php Client.php`，输入要发送的内容，即可发送消息到服务器，并收到来自服务器的消息。启动Echo Server？只需在终端中运行命令'php Server.php'即可。然后在另一个终端窗口中运行命令'php Client.php'并输入您要发送的任何内容。啊哈！查看服务器终端中的内容？您的邮件将从客户端发送到服务器。