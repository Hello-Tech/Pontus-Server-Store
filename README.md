# Pontus Store 

## 1. 开发环境配置
Server提供业务服务，客户端（一般是接入服务器）通过grpc调用相关服务，开发语言为Python。

### 安装grpcio

```
sudo python -m pip install grpcio
```

### 安装grpcio-tools

Python的 gRPC 工具包括了Proto Buffer的编译器 `protoc` 以及通过proto文件中的定义的服务生成gRPC客户端与服务端代码的工具。

```
python -m pip install grpcio-tools
```

## 2. 使用Proto生成grpc文件

开发环境就续，获取源代码后，需要先根据proto生成相关的python类文件后，才能正常编译运行。

### 2.1 根据`proto`生成对应的`python`文件

只需要运行根目录下的build_proto.sh即可。

```
cd {git}
bash build_proto.sh
```

> {git}为Pontus-Service-Biz的代码根目录。

### 2.2 启动服务

在调试阶段，在控制台启动grpc服务：
```
cd {git}
python server.py
```

### 2.3 测试服务

test目录用于测试。
