### springboot定制内置Tomact



**tomcat优化配置application.yml**

```
server:
  port: 9692
  tomcat:
    accept-count: 1000     #可以放到处理队列中的请求数
    max-threads: 800       #最大并发数
    min-spare-threads: 200  #初始化时创建的线程数
```

**config包**

```
import org.apache.catalina.connector.Connector;
import org.apache.coyote.http11.Http11NioProtocol;
import org.springframework.boot.web.embedded.tomcat.TomcatConnectorCustomizer;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.ConfigurableWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.stereotype.Component;


//当Spring容器内没有TomcatEmbeddedSevletContainerFactory这个Bean时，会把此Bean加载进Spring容器里
@Component
public class WebServerConfiguration implements WebServerFactoryCustomizer<ConfigurableWebServerFactory> {

    @Override
    public void customize(ConfigurableWebServerFactory factory) {
        // 使用对应工厂类提供给我们的接口定制化我们的tomcat connector

        /**
         * keepAliveTimeOut : 多少毫秒不响应断开keepalive
         * maxKeepAliveRequests: 多少次请求后keepalive断开连接
         */
        ((TomcatServletWebServerFactory) factory).addConnectorCustomizers(new TomcatConnectorCustomizer() {
            @Override
            public void customize(Connector connector) {
                Http11NioProtocol protocol = (Http11NioProtocol) connector.getProtocolHandler();
                // 定制化keepAliveTimeout，设置30秒内没有请求则服务端自动断开keepalive链接
                protocol.setKeepAliveTimeout(300000);
                // 当客户端发送超过10000个请求则自动断开keepalive链接
                protocol.setMaxKeepAliveRequests(10000);
            }
        });
    }
}
```