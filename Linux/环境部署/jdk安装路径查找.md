在安装好[Git](http://www.cnblogs.com/imyalost/p/8715688.html)、[JDK](http://www.cnblogs.com/imyalost/p/8709578.html)和[jenkins](http://www.cnblogs.com/imyalost/p/8710933.html)之后，就需要在jenkins中进行对应的设置，比如在全局工具配置模块，需要写入JDK的安装路径。

这篇博客，介绍几种常见的在Linux中查看JDK路径的方法。。。

 

**1、which java**

首先输入命令行，查看结果：

 [root@localhost ~]# which java

 /usr/bin/java 

**PS**：which Java是无法定位到Java的安装路径的，只能定位到执行路径；whereis Java也无法定位，只能展示一部分的Java路径，如下所示：

 [root@localhost ~]# whereis java

 java: /usr/bin/java /usr/lib/java /etc/java /usr/share/java /usr/share/man/man1/java.1.gz 

 

**2、echo $JAVA_HOME**

使用 echo $JAVA_HOME 命令可以定位到Java安装路径，但是前提是配置了环境变量$JAVA_HOME，否则还是定位不到，如下所示：

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
[root@localhost ~]# java -version
openjdk version "1.8.0_161"
OpenJDK Runtime Environment (build 1.8.0_161-b14)
OpenJDK 64-Bit Server VM (build 25.161-b14, mixed mode)
[root@localhost ~]# echo $JAVA_HOME

[root@localhost ~]#
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

 

**3、rpm -qa | grep java**

如果JDK是源码安装，那么rpm -qa | grep java命令也是定位不到的jdk的安装路径的，比如我是用的yum命令安装，使用rpm -qa | grep java命令的话，结果如下所示：

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
[root@localhost ~]# rpm -qa | grep java
javapackages-tools-3.4.1-11.el7.noarch
java-1.8.0-openjdk-headless-1.8.0.161-0.b14.el7_4.x86_64
tzdata-java-2018d-1.el7.noarch
java-1.8.0-openjdk-devel-1.8.0.161-0.b14.el7_4.x86_64
java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64
java-1.7.0-openjdk-1.7.0.171-2.6.13.0.el7_4.x86_64
python-javapackages-3.4.1-11.el7.noarch
java-1.7.0-openjdk-headless-1.7.0.171-2.6.13.0.el7_4.x86_64
[root@localhost ~]# 
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

 

**4、ls -lrt**

先了解下ls命令：

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
-a 显示所有文件及目录 (ls内定将文件名或目录名称开头为"."的视为隐藏档，不会列出) 

-l 除文件名称外，亦将文件型态、权限、拥有者、文件大小等资讯详细列出 

-r 将文件以相反次序显示(原定依英文字母次序) 

-t 将文件依建立时间之先后次序列出 

-A 同 -a ，但不列出 "." (目前目录) 及 ".." (父目录) 

-F 在列出的文件名称后加一符号；例如可执行档则加 "*", 目录则加 "/" 

-R 若目录下有文件，则以下之文件亦皆依序列出
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

根据上面的命令，我们可以执行如下命令，找到JDK的安装路径：

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
[root@localhost ~]# ls -lrt /usr/bin/java
lrwxrwxrwx 1 root root 22 Apr  3 19:30 /usr/bin/java -> /etc/alternatives/java
[root@localhost ~]# ls -lrt /etc/alternatives/java
lrwxrwxrwx 1 root root 73 Apr  3 19:30 /etc/alternatives/java -> /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/jre/bin/java
[root@localhost ~]# cd /usr/lib/jvm
[root@localhost ~]# ls
java                                                jre-1.7.0
java-1.7.0-openjdk-1.7.0.171-2.6.13.0.el7_4.x86_64  jre-1.7.0-openjdk
java-1.8.0                                          jre-1.7.0-openjdk-1.7.0.171-2.6.13.0.el7_4.x86_64
java-1.8.0-openjdk                                  jre-1.8.0
java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64     jre-1.8.0-openjdk
java-openjdk                                        jre-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64
jre                                                 jre-openjdk
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

ls -lrt解析：即将文件以建立时间先后顺序的倒叙排列显示，从上面的结果可以看出，/usr/bin/java是执行路径，那么继续执行后面的文件路径，即可找到JDK的安装路径为/usr/lib/jvm/java-1.8.0。