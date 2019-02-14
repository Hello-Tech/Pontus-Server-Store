# 配置文件

配置文件为一个`ini`文件。

## port

用来指定GRPC监听的端口号

## mysql

mysql的连接字符串(for golang)，用来指导本存储服务，如何连接到mysql数据库。

## 常用配置

一个常用的配置可能是：

```
port=3000
mysql=root:@/pontusim
```