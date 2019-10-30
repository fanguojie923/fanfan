# git自动拉取代码shell脚本

##  [LINUX](https://izww.cn/category/linux/)

```
#!/bin/bash
echo ""
#输出当前时间
date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"
echo "Start"
#git项目路径
gitPath="/data/website/xxx.com/"
#git 网址
gitHttp="git@git.coding.net:tegic/xxx.git"

echo "Web站点路径：$gitPath"

#判断项目路径是否存在
if [ -d "$gitPath" ]; then
        cd $gitPath
        #判断是否存在git目录
        if [ ! -d ".git" ]; then
                echo "在该目录下克隆 git"
                git clone $gitHttp gittemp
                mv gittemp/.git .
rm -rf gittemp
        fi
        #拉取最新的项目文件、撤销本地、暂存区、版本库(用远程服务器的origin/master替换本地、暂存区、版本库)

        git reset --hard origin/master
        git pull
        #设置目录权限 WEB_USER='www' : WEB_USERGROUP='www'
        chown -R www:www $gitPath
        echo "End"
        exit
else
        echo "该项目路径不存在"
        echo "End"
        exit
fi
```