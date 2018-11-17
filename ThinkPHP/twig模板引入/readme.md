##  ##
> composer.json 文件

	  "require": {
        .....
        "twig/twig" : "^1.0||^2.0",
        .....
    },
> 执行 
	
	composer update 或者 composer install

![](https://i.imgur.com/YBtUe7Z.png)


> thinkphp/library/think/view/driver 目录下

![](https://i.imgur.com/PAarGds.png)

> 代码如下:

	<?php
	namespace think\view\driver;
	
	use think\App;
	use think\exception\TemplateNotFoundException;
	use think\Log;
	use think\Request;
	use think\Template;
	
	class Twig{
	
	    protected $config = [
	        // 模板起始路径
	        'view_path'   => '',
	        // 模板文件后缀
	        'view_suffix' => 'Twig',
	        // 模板文件名分隔符
	        'view_depr'   => DS,
	        //Whetaher to open the template chche,set to true eveyr time the default cache
	        'tpl_cache'   => true,
	    ];
	     public function __construct($config = [])
	    {
	        $this->config = array_merge($this->config, $config);
	        if (empty($this->config['view_path'])) {
	            $this->config['view_path'] = App::$modulePath . 'view' . DS;
	        }
	        $this->template = new Template($this->config);
	    }
	
	    /**
	     * 检测是否存在模板文件
	     * @access public
	     * @param string $template 模板文件或者模板规则
	     * @return bool
	     */
	    public function exists($template)
	    {
	        if ('' == pathinfo($template, PATHINFO_EXTENSION)) {
	            // 获取模板文件名
	            $template = $this->parseTemplate($template);
	        }
	        return is_file($template);
	    }
	    /**
	     * 渲染模板文件
	     * @access public
	     * @param string    $template 模板文件
	     * @param array     $data 模板变量
	     * @return void
	     */
	     public function fetch($template, $data = [])
	    {
	        if ('' == pathinfo($template, PATHINFO_EXTENSION)) {
	            // 获取模板文件名
	            $template = $this->parseTemplate($template);
	        }
	        // 模板不存在 抛出异常
	        if (!is_file($template)) {
	            throw new TemplateNotFoundException('template not exists:' . $template, $template);
	        }
	        // 记录视图信息
	        App::$debug && Log::record('[ VIEW ] ' . $template . ' [ ' . var_export(array_keys($data), true) . ' ]', 'info');
	        extract($data, EXTR_OVERWRITE);
	        include $template;
	    }
	    /**
	     * 渲染模板内容
	     * @access public
	     * @param string    $template 模板内容
	     * @param array     $data 模板变量
	     * @param array     $config 模板参数
	     * @return void
	     */
	    public function display($template, $data = [], $config = [])
	    {
	        $this->template->display($template, $data, $config);
	    }
	
	    /**
	     * 自动定位模板文件
	     * @access private
	     * @param string $template 模板文件规则
	     * @return string
	     */
	    private function parseTemplate($template)
	    {
	        // 获取视图根目录
	        if (strpos($template, '@')) {
	            // 跨模块调用
	            list($module, $template) = explode('@', $template);
	            $path                    = APP_PATH . $module . DS . 'view' . DS;
	        } else {
	            // 当前视图目录
	            $path = $this->config['view_path'];
	        }
	
	       
	        // 分析模板文件规则
	        $request    = Request::instance();
	        $controller = $request->controller();
	        if ($controller && 0 !== strpos($template, '/')) {
	            $depr     = $this->config['view_depr'];
	            $template = str_replace(['/', ':'], $depr, $template);
	            if ('' == $template) {
	                // 如果模板文件名为空 按照默认规则定位
	                $template = str_replace('.', DS, $controller) . $depr . $request->action();
	            } elseif (false === strpos($template, $depr)) {
	                $template = str_replace('.', DS, $controller) . $depr . $template;
	            }
	        }
	        return $path . ltrim($template, '/') . '.' . ltrim($this->config['view_suffix'], '.');
	    }
	
	    public function __call($method, $params)
	    {
	        return call_user_func_array([$this->template, $method], $params);
	    }
	
	
	}

---------------------  
原文：https://blog.csdn.net/qq_34629975/article/


> 在config目录中template.php文件修改配置

	return [
    // 模板引擎类型 支持 php think 支持扩展
    'type'         => 'Twig',
    // 默认模板渲染规则 1 解析为小写+下划线 2 全部转换小写 3 保持操作方法
    'auto_rule'    => 1,
    // 模板路径
    'view_path'    => '',
    // 模板后缀
    'view_suffix'  => 'twig',
    // 模板文件名分隔符
    'view_depr'    => DIRECTORY_SEPARATOR,
    // 模板引擎普通标签开始标记
    'tpl_begin'    => '{',
    // 模板引擎普通标签结束标记
    'tpl_end'      => '}',
    // 标签库标签开始标记
    'taglib_begin' => '{',
    // 标签库标签结束标记
    'taglib_end'   => '}',
];

## 或者 ##
	return $this->engine('twig')->fetch('show',['a'=>'1']);

> 如果你需要动态改变模板引擎的参数，请使用视图类提供的 config 方法进行动态设置，而不要使用
> 改变配置类参数的方式

	<?php
		namespace app\index\controller;
		use think\Controller;
		class Index extends Controller
		{
		public function index()
		{
		// 改变当前操作的模板路径
		$this->view->config('view_path', 'mypath');
		return $this->fetch();
		}
		}