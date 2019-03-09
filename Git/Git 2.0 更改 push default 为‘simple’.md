## Git 2.0 更改 push default 为‘simple’

如果你最近更新了 Git，你可能会在执行 git push 时看到如下消息：

```php
warning: push.default is unset; its implicit value is changing in 
Git 2.0 from 'matching' to 'simple'. To squelch this message 
and maintain the current behavior after the default changes, use: 

  git config --global push.default matching

To squelch this message and adopt the new behavior now, use: 

  git config --global push.default simple
```

##### Matching

‘matching’ 参数是 Git 1.x 的默认行为，其意是如果你执行 git push 但没有指定分支，它将 push 所有你本地的分支到远程仓库中对应匹配的分支。

##### Simple

而 Git 2.x 默认的是 simple，意味着执行 git push 没有指定分支时，只有当前分支会被 push 到你使用 git pull 获取的代码。

### 修改默认设置

从上述消息提示中的解释，我们可以修改全局配置，使之不会每次 push 的时候都进行提示。对于 matching 输入如下命令即可：

```
git config --global push.default matching
```

而对于 simple ，请输入：

```
git config --global push.default simple
```