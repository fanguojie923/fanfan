#### 进程 案列

```php
<?php
echo "start:".date('Y-m-d H:i:s');
	$workers = [];
  $urls = [
      'http://baidu.com',
      'http://fdd.fgj1013.top',
      'http://qq.com',
      'http://hao123.com',
  ];
  //开启四个进程
  for ($i = 0;$i <4;$i++){
      $process = new swoole_process(function (swoole_process $pro)use($i,$urls){
          //todo
          //将内容输入到管道
           $content = curlData($urls[$i]);
           //echo $content.PHP_EOL;
           $pro->write($content.PHP_EOL);

      },true);//true不显示到屏幕 放入到管道
      $pid = $process->start();
      $workers[$pid] = $process;
  }
  //获取管道内容
  foreach ($workers as $process){
      echo $process->read();
  }
  function curlData($url){
      sleep(1);
      return $url.PHP_EOL;
  }
echo "end:".date('Y-m-d H:i:s');
```

