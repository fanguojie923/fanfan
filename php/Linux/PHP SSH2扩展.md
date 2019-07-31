\#环境CentOS7.3

\#第一、安装支持库文件

yum install make gcc-c++ glibc-devel zlib-devel openssl-devel  libssh2-devel php-devel

\##编译安装libssh2

wget http://www.libssh2.org/download/libssh2-1.8.0.tar.gz

tar zxvf libssh2-1.8.0.tar.gz

cd libssh2-1.8.0

./configure&&make&&make install

\#第二、安装SSH2扩展 (php7必须下载ssh2-1.0.tgz)

wget http://pecl.php.net/get/ssh2-1.0.tgz

tar -xzf ssh2-1.0.tgz

cd ssh2-1.0

phpize && ./configure --with-php-config=/www/server/php/72/bin/php-config && make && make install

\#第三、修改ssh2.ini

touch /etc/php.d/ssh2.ini

echo extension=ssh2.so > /etc/php.d/ssh2.ini

\#第四、检查SSH2是否安装成功

php -m | grep ssh2

php -i|grep ssh2

\#通过以下php代码测试：



<?php 

$connection = ssh2_connect("192.168.209.250",22);

if (ssh2_auth_password($connection,"您的FTP用户名","FTP密码"))

{

echo "Authentication Successful! ";

}

else

{

die("Authentication Failed...");

}

?>

