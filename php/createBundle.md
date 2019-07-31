# 创建Bundle #
	
	1. php bin/console generate:bundle
	2. no
	3. 注意：统一用yml文件
	4. 在composer.json 中添加对应bundle
		"autoload": {
		    "psr-4": {
		        "AppBundle\\": "src/AppBundle",
		        "WebBundle\\": "src/WebBundle"
		  },
	5.更新： composer dump-autoload
