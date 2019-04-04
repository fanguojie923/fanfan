服务端代码  

​	

```php
$http = new Swoole\Http\Server("127.0.0.1", 9501);
//配置静态文件根目录，与enable_static_handler配合使用,底层收到Http请求会先判断document_root路径下是否存在此文件，如果存在会直接发送文件内容给客户端，不再触发onRequest回调。
$server->set([
    'document_root' => '/www/wwwroot/default/swoole/demo/server',
    'enable_static_handler' => true,
]);
$http->on('request', function ($request, $response) {
    //传参接收参数
    $content = [
        'date:' => date('Y-m-d H:i:s'),
        'get:'=>$request->get,
        'post:'=>$request->post,
         'header:'=>$request->header,
    ];
    //日志写入
    swoole_async_writefile(__DIR__.'/test.log', json_decode($content).PHP_EOL, function($filename) {
        //todo
    echo "wirte ok.\n";
}, FILE_APPEND);
	//get参数的传递？a=1 用$request->get接收，post 相同用法
    $response->end("<h1>Hello Swoole. #".rand(1000, 9999).json_encode($request->get)."</h1>");
});
$http->start();
```



连接方法俩种

> one

```
curl http://127.0.0.1:9501
```

> two

  配置域名+nginx 反向代理	
    

    server
    {
        listen 80;
        server_name skt.fgj1013.top
    	index index.php index.html index.htm default.php default.htm default.html;
        root /www/wwwroot/default/swoole/demo/server/client;
        #SSL-START SSL相关配置，请勿删除或修改下一行带注释的404规则
        #error_page 404/404.html;
        #SSL-END
    
        #ERROR-PAGE-START  错误页配置，可以注释、删除或修改
        error_page 404 /404.html;
        error_page 502 /502.html;
        #ERROR-PAGE-END
    
        #PHP-INFO-START  PHP引用配置，可以注释或修改
    
        include enable-php-72.conf;
        #PHP-INFO-END
    
        #REWRITE-START URL重写规则引用,修改后将导致面板设置的伪静态规则失效
        include /www/server/panel/vhost/rewrite/skt.fgj1013.top.conf;
        #REWRITE-END
    
        #禁止访问的文件或目录
        location ~ ^/(\.user.ini|\.htaccess|\.git|\.svn|\.project|LICENSE|README.md)
        {
            return 404;
        }
    
        #一键申请SSL证书验证目录相关设置
        location ~ \.well-known{
            allow all;
        }
        //****************************添加此处 start*****************************
         location =/ {//官网在此处会有差异
            #添加了这个也不行
            #try_files uri uri/ /index.php?$query_string; 
              #下面这几行是swoole官网设定
            if (!-e $request_filename) {
                proxy_pass http://127.0.0.1:9501;
            }
            proxy_http_version 1.1;
            proxy_set_header Connection "keep-alive";
            proxy_set_header X-Real-IP $remote_addr;    
        }
        //****************************添加此处end*****************************
        location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
        {
            expires      30d;
            error_log off;
            access_log off; 
        }
        location ~ .*\.(js|css)?$
        {
            expires      12h;
            error_log off;
            access_log off; 
        }
        access_log  /www/wwwlogs/skt.fgj1013.top.log;
        error_log  /www/wwwlogs/skt.fgj1013.top.error.log;
    }






