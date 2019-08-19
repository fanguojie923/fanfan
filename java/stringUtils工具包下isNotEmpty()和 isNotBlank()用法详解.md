#### StringUtils工具包下isNotEmpty()和isNotBlank()用法讲解

> Java编程中，常常会需要判断某个对象的值是否为空，从而进行下一步操作，我们先看代码：

```java
public class Person {
    private String name;
    private String age;
    private String height;
    private String weight;
    private String love;
//getter和setter略
}

public class TestNull {
    public static void main(String[] args) {
        Person pe = new Person();
        pe.setName("李逍遥");
        pe.setAge("18");
        pe.setHeight("188");
        pe.setHeight("75");
        pe.setLove("");
        
        System.err.println("love==" + pe.getLove());  //love==
        if (pe.getLove() == null) {
            System.err.println("love is null");  // 未执行到该步
        }
    }
}
```

很奇怪，执行结果并未输出`love is null`这一句话，我们输出`pe.getLove() == null`结果为`false`，这种情形很常见，新手一般很容易犯这个错误，所以我们往往判断一个对象的某个值是否为null，需要引入StringUtils.isNotEmpty()或者StringUtils.isNotBlank()两个工具类

**两者有何区别？**
isNotEmpty将空格也作为参数，isNotBlank则排除空格参数（\t \r \n等等）。

```java
public static void main(String[] args) {
        // isNotEmpty==判断某字符串是否非空
        System.out.println(StringUtils.isNotEmpty(null)); // = false;
        System.out.println(StringUtils.isNotEmpty("")); // false;
        System.out.println(StringUtils.isNotEmpty(" "));// true;
        System.out.println(StringUtils.isNotEmpty("bob")); // true;

        // isNotBlank：判断某字符串是否不为空且长度不为0且不由空白符(whitespace)构成，
        System.err.println(StringUtils.isNotBlank(null)); // false
        System.err.println(StringUtils.isNotBlank("")); // false
        System.err.println(StringUtils.isNotBlank(" ")); // false
        System.err.println(StringUtils.isNotBlank("\t \n \f \r")); // false
    }
```

引入这个工具包，我们需要导入`import org.apache.commons.lang3.StringUtils`jar包，但是不引入该Jar包，同样可以，我们可以这样判断：

```java
StringUtils.isNotEmpty(str)  等同于:
str != null && str.length > 0

StringUtils.isNotBlank(str) 等价于:
str != null && str.length > 0 && str.trim().length > 0
即：判断是否==null时，还需要判断length是否>0
```

