https://blog.csdn.net/u014527912/article/details/81158567



> **/main/resource/logback-spring.xml**文件

```xml
<?xml version="1.0" encoding="UTF-8"?>

<configuration>

    <!--定义日志文件的存储地址 勿在 LogBack 的配置中使用相对路径-->
    <property name="LOG_HOME" value="sysLog"/>
    <!-- 指定了文件最多保存的历史天数：-->
    <property name="LOG.MAX_HISTORY" value="15" />
    <!--配置了日志打印的格式：-->
    <property name="LOG.PATTERN" value="%d{yyyy-MM-dd HH:mm:ss} %M:%L -- %msg %n" />

    <!--  输出到控制台-->
    <appender name="consoleLog" class="ch.qos.logback.core.ConsoleAppender">
        <layout class="ch.qos.logback.classic.PatternLayout">
            <pattern>>${LOG.PATTERN}</pattern>
        </layout>
    </appender>

    <!--    INFO日志　-->
    <appender name="fileInfoLog" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <filter class="ch.qos.logback.classic.filter.LevelFilter">
            <!--这里是LvelFilter,对日志级别的过滤-->
            <level>ERROR</level>
            <!--            用于配置符合过滤条件的操作 -->
            <onMatch>DENY</onMatch>
            <!--            用于配置不符合过滤条件的操作-->
            <onMismatch>ACCEPT</onMismatch>
        </filter>
        <!--<encoder>：对记录事件进行格式化  负责两件事，一是把日志信息转换成字节数组，二是把字节数组写入到输出流。-->
        <encoder>
            <pattern>${LOG.PATTERN}</pattern>
        </encoder>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!--日志文件保留天数-->
            <MaxHistory>${LOG.MAX_HISTORY}</MaxHistory>
            <fileNamePattern>${LOG_HOME}/info/info%d.sysLog</fileNamePattern>
        </rollingPolicy>
    </appender>
    <!--    ERROR 日志-->
    <appender name="fileErrorLog" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <filter class="ch.qos.logback.classic.filter.ThresholdFilter">
            <level>ERROR</level>
        </filter>
        <encoder>
            <pattern>>${LOG.PATTERN}</pattern>
        </encoder>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!--日志文件保留天数-->
            <MaxHistory>${LOG.MAX_HISTORY}</MaxHistory>
            <fileNamePattern>${LOG_HOME}/error/error%d.sysLog</fileNamePattern>
        </rollingPolicy>
    </appender>
    　
    <root level="info">
        <appender-ref ref="consoleLog"/>
        <appender-ref ref="fileInfoLog"/>
        <appender-ref ref="fileErrorLog"/>
    </root>
</configuration>
```