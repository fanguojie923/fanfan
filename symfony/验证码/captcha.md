#  composer require gregwar/captcha-bundle #使用Composer包地址

    ## app/kernel.php文件下  ##
	public function registerBundles()
    {
        $bundles = [
	....
	new Gregwar\CaptchaBundle\GregwarCaptchaBundle(),
	....
	 ];
# composer文件 #
	"require" : {
		.....
		"gregwar/captcha-bundle": "^2.0",
		"gregwar/image-bundle": "dev-master",
	},
# 组态 #
## 将以下配置添加到您的app/config/config.yml： ##
	
	//gregwar_captcha: ~
	gregwar_captcha:
	    expiration: 120
	    width: 70
	    height: 30
	    length: 4
	    as_url: true
	    text_color: [255, 255, 255]
	    background_color: [42, 76, 139]
	    ignore_all_effects: false
	    distortion: false
	    interpolation: false
	    charset: 'abcdefhjkmnprstuvwxyz'
	    quality: 90


