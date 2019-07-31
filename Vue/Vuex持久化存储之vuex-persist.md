# Vuex持久化存储之vuex-persist

安装：

```shell
npm install --save vuex-persist
or
yarn add vuex-persist
```

引入：

```
import VuexPersistence from 'vuex-persist'
```

先创建一个对象并进行配置：各个页面之间跳转，如果刷新某个视图，数据并不会丢失，依然存在，并且不需要在每个 mutations 中手动存取 storage 。

```
const vuexLocal = new VuexPersistence({
    storage: window.localStorage
})
```

引入进vuex插件：

```
const store = new Vuex.Store({
  state: { ... },
  mutations: { ... },
  actions: { ... },
  plugins: [vuexLocal.plugin]
}) 
```

vuex-persist 的详细属性：

| 属性         | 类型                               | 描述                                                         |
| ------------ | ---------------------------------- | ------------------------------------------------------------ |
| key          | string                             | 将状态存储在存储中的键。默认: 'vuex'                         |
| storage      | Storage (Web API)                  | 可传localStorage, sessionStorage, localforage 或者你自定义的存储对象. 接口必须要有get和set.  **默认是: window.localStorage** |
| saveState    | function (key, state[, storage])   | 如果不使用存储，这个自定义函数将保存状态保存为持久性。       |
| restoreState | function (key[, storage]) => state | 如果不使用存储，这个自定义函数处理从存储中检索状态           |
| reducer      | function (state) => object         | 将状态减少到只需要保存的值。默认情况下，保存整个状态。       |
| filter       | function (mutation) => boolean     | 突变筛选。看mutation.type并返回true，只有那些你想坚持写被触发。所有突变的默认返回值为true。 |
| modules      | string[]                           | 要持久化的模块列表。                                         |