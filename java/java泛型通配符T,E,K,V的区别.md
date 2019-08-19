# JAVA泛型通配符T，E，K，V的区别

泛型是我们编程中经常使用到的，比如指定List集合类型或者Map的时候，或者比如定义`public <T> void write(T t, T[] ta);`方法的时候，我们用一个`T`就定义了，那么，什么是泛型呢？

**泛型**就是指所操作的数据类型被指定为一个参数，这种参数类型可是是任意类型，可以用在类、接口和方法的创建中，分别称为泛型类、泛型接口、泛型方法。

在Java SE 1.5之前（没有泛型的情况下），如果要引用任意对象，必须通过对类型Object的引用来实现参数的“任意化”，“任意化”带来的缺点是要做显式的强制类型转换，而这种转换是要求开发者必须知道实际参数类型的情况下方可进行。



```java
package com.weixin.web;

public class Box<T> {
    private T object;

    public void set(T object) {
        this.object = object;
    }

    public T get() {
        return object;
    }

    public static void main(String[] args) {

        Box<Apple> box = new Box<Apple>();
        box.set(new Apple());
        Apple apple = box.get();

        Box box2 = new Box();  //非泛型 需强制转换
        box2.set(new Apple());
        Apple apple2 = (Apple) box2.get();
    }
}
```

对于强制类型转换错误，编译器有可能不提示，而是在运行的时候才出现异常，泛型的好处是在编译的时候检查类型安全，并且所有的强制转换都是自动和隐式的，以提高代码的重用率。

但是我们在定义泛型类，泛型方法，泛型接口的时候，经常会碰见除了`T`以外的通配符，比如`E`，`K`，`V`甚至`?`等等，这些通配符是什么意思呢？

**？ 表示不确定的java类型**
 **T (type) 表示具体的一个java类型**
 **K V (key value) 分别代表java键值中的Key Value**
 **E (element) 代表Element**

