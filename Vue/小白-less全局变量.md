首先一定要确定安装了**vue-cli3X**以上，

> vue add style-resources-loader

如果上面的没反应，请再一次确实是不是升级到了vue-cli3.x以上，

如果安装失败或者提示错误，可以试着先把全部依赖删除了，先安装`vue add style-resources-loader`，那是这里就是一直安装不成功，后来全部删除，先安装这个，最后在全部安装

安装成功后，会在vue.config.js中生成


```
 pluginOptions: {
      'style-resources-loader': {
        preProcessor: 'less',
        patterns: [
            //这个是加上自己的路径，
            //注意：试过不能使用别名路径
            path.resolve(__dirname, './src/common/less/index.less'),
        ]
      }
    }
```