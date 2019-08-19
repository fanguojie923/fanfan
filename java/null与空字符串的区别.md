# null和空字符串('')的区别

在Java开发中，我们需要常常判断是否值为null，尤其在xml数据交互过程中，我们判断某一个报文的值是否为null时候，经常需要用三目运算判断：如果值为null，则赋值空字符串（insert数据库时），那为什么需要这样呢？null和空字符串('')有什么区别？

```java
public static void main(String[] args) {
        String aaa = null;
        System.out.println(aaa.indexOf("a"));
        System.out.println(aaa.length());
        // 报空指针异常
        //Exception in thread "main" java.lang.NullPointerException
        
        String bbb = "";
        System.err.println(bbb.indexOf("a")); //-1
        System.err.println(bbb.length());//0        
    }
```

**null和空字符串('')虽然都是没有任何内容，但是null却输出空指针异常，因为堆内存中根本就没有这个东西。**



他们的区别可相当大，虽然都是没有信息，但是null代表堆内存中根本没有这个东西，这个对象不存在，怎么执行indexof操作？空字符串虽然没有信息，但是是有内存空间的，**所以null与空字符串主要区别如下：**

**1.类型**
 null表示的是一个对象的值，而非一个字符串。例如声明一个对象的引用，String aaa = null ;
 ""表示的是一个长度为0的空字符串。例如声明一个字符串String bbb = "" ;
 所以：null不指向任何对象，相当于没有任何值;而""代表一个长度为0的字符串。

**2.内存分配**
 String aaa = null ;
 表示声明一个字符串对象的引用，但指向为null（未指向任何的内存空间）；

String bbb = "";
表示声明一个字符串类型的引用，其值为""空字符串（指向空字符串的内存空间）；

在java中变量和引用变量是存在栈中（stack），而对象（new产生的）都是存放在堆中（heap）。
所以：null不分配内存空间;而""会分配内存空间。