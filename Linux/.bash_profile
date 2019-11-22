# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export JAVA_HOME=/home/biu/java/jdk1.8
export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar

export M2_HOME=/home/biu/java/apache-maven-3.6.1

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$JAVA_HOME/bin:$M2_HOME/bin

alias bashlogin='source /home/biu/.bash_profile && exec bash --login'

alias redisstart='/home/biu/redis/src/redis-server /home/biu/redis/redis.8201.conf'
alias redisstop='/home/biu/redis/src/redis-cli -h 127.0.0.1 -p 8201 -a 8a42f6a4f0656076bacaa4771179f7d6 shutdown'
alias redisconn='/home/biu/redis/src/redis-cli -h 127.0.0.1 -p 8201 -a 8a42f6a4f0656076bacaa4771179f7d6'
alias redisdot='/home/biu/redis/src/redis-cli -h r-2ze88bcded25abd4.redis.rds.aliyuncs.com -p 6379 -a 6c73ceE1F7D9E2090C25d'

alias redisstart8301='/home/biu/redis/src/redis-server /home/biu/redis/redis.8301.conf'
alias redisstop8301='/home/biu/redis/src/redis-cli -h 127.0.0.1 -p 8301 -a 8a42f6a4f0656076bacaa4771179f7d6 shutdown'
alias redisconn8301='/home/biu/redis/src/redis-cli -h 127.0.0.1 -p 8301 -a 8a42f6a4f0656076bacaa4771179f7d6'


alias redisstart8601='/home/biu/redis/src/redis-server /home/biu/redis/redis.8601.conf'
alias redisstop8601='/home/biu/redis/src/redis-cli -h 127.0.0.1 -p 8601 -a d66719c619738c8e00f3af414d4b6995 shutdown'
alias redisconn8601='/home/biu/redis/src/redis-cli -h 127.0.0.1 -p 8601 -a d66719c619738c8e00f3af414d4b6995'

alias redisonline='/home/biu/redis/src/redis-cli -h r-2ze9cd3493cbe064.redis.rds.aliyuncs.com -p 6379 -a c0SDFb33f2c4ED67TGa901165aaf'

alias phpstart='/home/biu/php/sbin/php-fpm -c /home/biu/php/etc/php.ini'
alias phpstop='cat /home/biu/php/var/run/php-fpm.pid | xargs kill -INT'
alias phprestart='cat /home/biu/php/var/run/php-fpm.pid | xargs kill -USR2'
alias phperror='tail -f /home/biu/php/var/log/php-error.log'

alias phpbash="/home/biu/php/bin/php -c /home/biu/php/etc/php.ini -f "

alias nginxstart='/home/biu/nginx/sbin/nginx'
alias nginxstop='ps -ef | grep nginx | grep -v grep | cut -c 9-15 | xargs kill -9'

alias mysqlstart='/home/biu/mysql/bin/mysqld_safe --user=mysql &'
alias mysqlstop='/home/biu/mysql/bin/mysqladmin shutdown -umysql -h127.0.0.1 -pmysql -P8003'
alias mysqllocal='/home/biu/mysql/bin/mysql -umysql -h127.0.0.1 -P8003 -pmysql'
alias mysqlzytzb='/home/biu/mysql/bin/mysql -uroot -h139.159.244.29 -P3306 -pZAQ!XSW@'

alias mysqlonline='/home/biu/mysql/bin/mysql -uuser_mall -hrm-2zexpput5wvqqx6q7.mysql.rds.aliyuncs.com -P3306 -p7ujmcgyu3edcYHG34s'
alias mysqldot='/home/biu/mysql/bin/mysql -uuser_dot -hrm-2zexpput5wvqqx6q7.mysql.rds.aliyuncs.com -P3306 -pa5ee7275b5c8b2e0#868#cd6ae1'


alias svnadd="svn status|grep ? | awk '{print $2}' | xargs svn add"
alias svndel="svn status|grep ! | awk '{print $2}' | xargs svn del"

alias tag='ctags -R'
export PATH
