**mongo配置**

> windows版本

```
mkdir d:\mongo\data\db
mkdir d:\mongo\data\log
mkdir d:\mongo\config
cd config
touch mongod.cfg
```

mongod.cfg文件内容

```
systemLog:
    destination: file
    path:D:\mongo\data\log\mongod.log
    logAppend: true
storage:
    dbPath: D:\mongo\data\
```

```
运行
.\mongod.exe --config "D:\mongo\config\mongod.cfg" --install
```

