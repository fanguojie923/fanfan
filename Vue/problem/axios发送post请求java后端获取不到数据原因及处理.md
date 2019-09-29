>   最近再学习前端的框架vue,发请求使用的是axios，自己简单的写了个后端，实现一个学生列表的crud，web层使用的是springmvc,并使用jq的$.ajax方式测试过接口没问题。

**出现的问题：**

```
 已经再次确保后端接口能接收jquery的$.ajax发送的post请求，但前端使用vue,发请求通过axios来发送，后端却无法获取数据。
```

**问题原因：**
    请求的Content-Type设置为application/x-www-form-urlencoded,那么这个Post请求被认为是HTTP
POST表单请求,参数出现在form data,参数形式是key=value&key1=value1这种形式，后端获取使用@RequestParam;
其他情况如使用原生AJAX的POST请求如果不指定请求头Request
Header,默认使用的Content-Type是text/plain;charset=UTF-8,或者application/json
,参数出现在Request payload块,其参数形式是标准的json格式，使用@RequestParam无法获取,需要使用@RequestBody获取。
    在axios使用Post发送数据时，默认是直接把json放到请求体中提交到后端的，属于上述的第二种方式。
    
**解决方案：**
第一种、前端解决：添加请求头信息,并重新封装请求参数
let params = 'studentno=' + this.student.studentno +
        '&name=' + this.student.name +
        '&phone=' + this.student.phone +
        '&email=' + this.student.email
axios.post(url, params,{headers: {'Content-Type':
'application/x-www-form-urlencoded'}})    

看到这种拼接字符就觉得恶心，可以选择另外的方式：

参考文档链接：
https://github.com/axios/axios#using-applicationx-www-form-urlencoded-format
<https://github.com/axios/axios#using-applicationx-www-form-urlencoded-format>

一下是拷贝关于参考文档中给出的方案，需要详细了解可翻阅文档。

Using application/x-www-form-urlencoded format

By default, axios serializes JavaScript objects to JSON. To send data in the 
application/x-www-form-urlencoded format instead, you can use one of the
following options.

Browser

In a browser, you can use the URLSearchParams
<https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams> API as
follows:
const params = new URLSearchParams(); params.append('param1', 'value1');
params.append('param2', 'value2'); axios.post('/foo', params);
Note that URLSearchParams is not supported by all browsers (see caniuse.com
<http://www.caniuse.com/#feat=urlsearchparams>), but there is a polyfill
<https://github.com/WebReflection/url-search-params> available (make sure to
polyfill the global environment).

Alternatively, you can encode data using the qs <https://github.com/ljharb/qs>
 library:
const qs = require('qs'); axios.post('/foo', qs.stringify({ 'bar': 123 }));
Or in another way (ES6),
import qs from 'qs'; const data = { 'bar': 123 }; const options = { method:
'POST', headers: { 'content-type': 'application/x-www-form-urlencoded' }, data:
qs.stringify(data), url, }; axios(options);
    
第二种、后端解决：在请求参数使用@RequestBody注解替代@RequestParam
@ResponseBody
@RequestMapping(value="/save",method=RequestMethod.POST)
public Map<String, String> save(@RequestBody Student
student)//自动将参数封装成student对象

代码不详细列出，仅列出关键部分。  