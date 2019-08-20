**在开发的时候很多时候都需要获取用户IP地址，但是又有很多项目前后端分离，使用了Nginx代理……获取不到用户真实IP**

`首先Nginx配置：`

```nginx
server {
        listen       80;
        server_name  localhost;
        charset utf-8;
        location / {
            root D:\Project\website\src\main\webapp\website;
			
            index  index.html index.htm;
        }
		
		location ~ .*/api/* {
			proxy_set_header Host $host;
			proxy_set_header X-Real-IP $remote_addr;
			proxy_set_header REMOTE-HOST $remote_addr;
			proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			proxy_pass   http://127.0.0.1:8080;
		}
    }
```

**很简单的配置大家应该懂得，只用加如下代码即可：**

```nginx
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header REMOTE-HOST $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
```

**JAVA代码：**

```java
public static String getIp(HttpServletRequest request) throws Exception{
        String ip = request.getHeader("X-Real-IP");
        if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
            return ip;
        }
        ip = request.getHeader("X-Forwarded-For");
        if (!StringUtils.isBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
            // 多次反向代理后会有多个IP值，第一个为真实IP。
            int index = ip.indexOf(',');
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        } else {
            return request.getRemoteAddr();
        }
    }
```

