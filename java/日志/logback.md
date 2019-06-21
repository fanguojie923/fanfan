https://blog.csdn.net/u014527912/article/details/81158567



> **logback-spring.xml**文件

```xml
<?xml version="1.0" encoding="utf-8" ?>
<configuration>

    <!--控制台输出-->
    <appender name="consoleLog" class="ch.qos.logback.core.ConsoleAppender">
        <layout class="ch.qos.logback.classic.PatternLayout">
            <!-- %d为时间，%msg为自己要输出的信息，%n为换行 -->
            <pattern>
                %d - %msg%n
            </pattern>
        </layout>
    </appender>

    <!--滚动文件info级别日志的输出-->
    <appender name="fileInfoLog" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <!--拦截error级别及以上的日志-->
        <filter class="ch.qos.logback.classic.filter.LevelFilter">
            <level>ERROR</level>
            <!--匹配上就拒绝-->
            <onMatch>DENY</onMatch>
            <!--匹配不上的就接受-->
            <onMismatch>ACCEPT</onMismatch>
        </filter>
        <encoder>
            <pattern>
                %msg%n
            </pattern>
        </encoder>
        <!--滚动策略，这里使用基于时间的滚动策略，每天产生一个文件-->
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!--文件输出的路径-->
            <fileNamePattern>D:\jack\code\sell\info.%d.log</fileNamePattern>
        </rollingPolicy>
    </appender>

    <!--滚动文件error级别日志的输出-->
    <appender name="fileErrorLog" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <!--拦截error级别及以上的日志-->
        <filter class="ch.qos.logback.classic.filter.ThresholdFilter">
            <level>ERROR</level>
        </filter>
        <encoder>
            <pattern>
                %msg%n
            </pattern>
        </encoder>
        <!--滚动策略，这里使用基于时间的滚动策略，每天产生一个文件-->
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!--文件输出的路径-->
            <fileNamePattern>D:\jack\code\sell\error.%d.log</fileNamePattern>
        </rollingPolicy>
    </appender>

    <root level="info">
        <appender-ref ref="consoleLog"/>
        <appender-ref ref="fileInfoLog"/>
        <appender-ref ref="fileErrorLog"/>
    </root>

</configuration>
```