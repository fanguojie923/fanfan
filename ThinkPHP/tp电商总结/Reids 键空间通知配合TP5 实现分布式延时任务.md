# Reids 键空间通知配合TP5 实现分布式延时任务

<img src="./img/redis1.png">

测试环境：windows 10 + phpStudy

配置redis配置文件 redis.windows.conf

```
notify-keyspace-events "Ex"
```

<img src="./img/redis.png">



> Redis配置文件基类

```
<?php

namespace app\common\controller;


class RedisConn{

    //单列
    //类静态变量全局保存
    private static $instance = array();

    private function __construct()
    {
    }

    /**
     * getInstance
     * 获取redis 实例
     * @param string $section
     * @return void
     */
    public static function getInstance($section = 'default')
    {
        if(isset(self::$instance[$section])){
            return self::$instance;
        }

        $conn = self::getConnect($section);

        if($conn === false){
            return false;
        }
        self::$instance[$section] = $conn;
        return self::$instance[$section];
    }

    /**
     * getConnect 连接redis
     */
    public static function getConnect($section)
    {
        $configArr = self::getConfig($section);
        if(empty($configArr)){
            return false;
        }
        $redis = new \Redis();
        $retryDelay = isset($configArr['connect_retry_delay']) ? $configArr['connect_retry_delay']: 100;
        $timeout = isset($configArr['connect_timeout']) ? $configArr['connect_timeout'] : 1;
        $password =isset($configArr['password']) ? $configArr['password'] : '';

        $result = $redis->connect($configArr['host'],$configArr['port'],$timeout,null,$retryDelay);

        if($result){
            if($password){
                $redis->auth($password);
            }
            return $redis;
        }
        return false;
    }


    /**
     *
     * getConfig 获取redis配置信息
     */
    public static function getConfig($section)
    {
        $conMap = array(
          'default' => array(
              'host'                => '127.0.0.1',
              'port'                => '6379',
              'connect_timeout'     => '1.5',
              'connect_retry_delay' => '100',
              'connect_retry_times' => 3,
              'password'            =>''
          )
        );
        if(!isset($conMap[$section])){
            return array();
        }
        return $conMap[$section];
    }
}
```

> redis 基础方法文件

```php+HTMLphp
<?php
namespace app\common\controller;

use app\common\controller\RedisConn;
use think\Log;

class RedisBase
{
    private $redis;

    public function __construct($config = 'default')
    {

        try{
            $this->redis = RedisConn::getInstance();
            $this->setex('ss',5,'jue');
        }catch (Exception $e){
            Log::write("[Redis Connect Failed] errmsg is [". $e->getMessage() ."]");
        }

        if($this->redis == false){
            Log::write("[Redis Connect Failed] config is [" . $config . "]");
        }
    }

    public function __call($method, $params)
    {
        try{
            if(empty($this->redis)){
                return false;
            }else{
                return call_user_func_array(array($this->redis,$method),$params);
            }
        }catch (Exception $e){
            Log::write("[Redis Operation Failed] errmsg is [". $e->getMessage() ."]");
        }
        return false;
    }


    public function setex($key, $time, $val)
    {
        return $this->redis->setex($key, $time, $val);
    }

    public function set($key, $val)
    {
        return $this->redis->set($key, $val);
    }

    public function get($key)
    {
        return $this->redis->get($key);
    }

    public function expire($key = null, $time = 0)
    {
        return $this->redis->expire($key, $time);
    }

    public function psubscribe($patterns = array(), $callback)
    {
        $this->redis->psubscribe($patterns, $callback);
    }

    public function setOption()
    {
        $this->redis->setOption(\Redis::OPT_READ_TIMEOUT, -1);
    }
}
```

> command 脚本

```
<?php
/**
 * Created by PhpStorm.
 * User: 范国洁
 * Date: 2019/4/14
 * Time: 0:10
 */

namespace app\common\command;

use app\api\service\RedisSubscribe;
use think\console\Command;
use think\console\Input;
use think\console\input\Argument;
use think\console\Output;

class Order extends Command
{
    // 配置指令  php think order psubscribe & 后台挂起进程
    public function configure()
    {
        $this->setName('order')
            ->addArgument('type', Argument::REQUIRED, "the type of the task that pay needs to run")
            ->setDescription('this is payment system command line tools');
    }

    // 执行指令
    public function execute(Input $input, Output $output)
    {
        $type = $input->getArgument('type');
        if ($type == 'psubscribe') {
            // 发布订阅任务
            $this->psubscribe();
        }
    }

    /**
     * Redis 发布订阅模式
     */
    private function psubscribe()
    {
        $service = new RedisSubscribe();
        $service->sub();
    }
}
```

> 此处订阅服务[过期逻辑处理]

```
<?php
/**
 * Created by PhpStorm.
 * User: 范国洁
 * Date: 2019/4/14
 * Time: 0:30
 */

namespace app\api\service;

use app\common\controller\RedisBase;
use think\Log;

class RedisSubscribe
{
    public function sub()
    {
        Log::error(time()."__超时任务__:");
        $redis = new RedisBase();
        $redis->setOption();
        $redis->psubscribe(array('__keyevent@0__:expired'), function ($redis, $pattern, $chan, $msg) {
            //逻辑处理
            Log::error('[1]--过期事件的订阅 ' . json_encode($msg));
            log::error(json_encode($redis));
            log::error(json_encode($pattern));
            log::error(json_encode($chan));
            log::error($msg);
        });
    }
}
```