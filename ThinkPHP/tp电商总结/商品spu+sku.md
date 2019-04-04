参考https://blog.csdn.net/Mwangsheng/article/details/84024064

# 商品表（spu）、规格表（sku）设计

2018年11月13日 10:09:27 [Mwangsheng](https://me.csdn.net/Mwangsheng) 阅读数：746



转载出处：<https://www.jianshu.com/p/86f9596d6234>

最近在做一个中小型购物商城，商品的种类繁多，每一种商品具有不同的规格，不同的规格有相应的价格和库存；

这个设计的核心难点在于：**不同商品具有不同的属性，如何设计通用的存储方案？**

## 1. 先做一下专业术语解释：spu和sku

这里拿iphone6s举例，它身上有很多的属性和值， 比如：

- 毛重: 420.00 g
- 产地: 中国大陆
- 容量: 16G, 64G, 128G
- 颜色: 银, 白, 玫瑰金

**spu** 指的是商品（iphone6s），spu属性就是不会影响到库存和价格的属性, 又叫**关键属性**，与商品是一对一的关系，比如：

- 毛重: 420.00 g
- 产地: 中国大陆

**sku**指的是具体规格单品（玫瑰金 16G），sku属性就是会影响到库存和价格的属性, 又叫**销售属性**，与商品是多对一的关系，比如：

- 容量: 16G, 64G, 128G
- 颜色: 银, 白, 玫瑰金

所以iphone6s则会生成 3 * 3 = 9 个 sku

##  2. 下面进入主题

**数据表结构**

![img](https://img-blog.csdnimg.cn/20181113100418131.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L013YW5nc2hlbmc=,size_16,color_FFFFFF,t_70) 

 

上面这张图是我项目中用到的商品相关的几张数据表， 请只关注有数据值的字段，其它为业务需要，一共包含如下5张表：

### 1. 商品分类表 mmall_category 

此表采用无限层级树状数据结构，程序使用递归算法来遍历分类下的所有子分类，parent_id是父级分类， **parent_id=0时说明是根节点**, 属于一级类别； 如使用递归查询出100034包含100037子类别，依次类推，这样就构成一个可以无限扩展的数字结构；

 

- 商品分类表--mmall_category
- 商品表--------mmall_product
- 商品规格表--mmall_product_specs
- 属性key表---mmall_attribute_key
- 属性value表-mmall_attribute_value

\2. 商品表 mmall_product（也称spu表）

spu表中关键字段是**category_id**和**attribute_list**两个字段：
**category_id** 记录这个商品属于哪个分类， 用于通过分类进行商品搜索；
**attribute_list** 记录的是所有属性集合，这个字段采用json格式存储，便于前端解析；前端解析后可以在页面显示出商品的所有属性， 用户点击选择出属性组合后，前端可以拼接成**{"内存":"2G","颜色":"红色","尺寸":"20cm"}**这样的json格式**加上商品id**在（**商品规格表 mmall_product_specs**）查询到具体的单品，随即获取到具体单品的库存和价格等信息；

\3. 商品规格表 mmall_product_specs（也称sku表）

sku表保存的是具体的单品信息，比如具体规格的库存和价格等，核心字段是**product_id**和**product_specs**，**product_id** 记录的是spu表中的商品id，**product_specs** 记录的是该单品具体的属性值（规格值）；

\4. （属性key表 mmall_attribute_key）和（属性value表-mmall_attribute_value）

属性key表和属性value表仅用于管理后台页面生成属性选项，管理员在发布新商品时勾选属性，方便规格的录入和保证正确性；

**这里我使用了两张横表spu表和sku表实现不同商品的存储，spu表使用attribute_list字段保存属性集合，查询时使用product_id和product_specs去sku表中获取的具体的单品信息， spu表中可以增加一些商品的公共信息字段，例如名称、发布的商家、发布日期、上架状态， sku表中增加一些每个单品不同的字段，比如不同的单品有不同图片和名称或者详情说明等等，反正根据业务进行扩展**

------

**总结, 上述数据表设计方案适用于商品类别差异不是很大的情形，通过表的字段可以发现不同的商品之间变化的信息只有***attribute_list* **字段， 而这个字段通过json来存储各种不同的属性集合， 同样sku表中变化的字段只有** *product_specs* **也是通过json来存储各种不同属性组合。**

**核心思路就是把弹性字段使用json存储，这样设计的优点是数据表结构稳定，不用在商品增加属性后增加字段， 缺点是商品数据的解析复杂，弹性字段需要在业务代码中进行处理，增加了业务代码的复杂度。**