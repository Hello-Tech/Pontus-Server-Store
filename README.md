# Pontus Store 

Pontus服务端的存储层。

## 开发环境

本工程使用`golang`进行开发，使用官方的依赖管理工具`dep`管理依赖。按以下步骤设置环境：

 - `cd src && dep init`

> 执行上述开发过程时，依赖`dep`可执行文件。此文件并不是`golang`开发环境默认就有的。安装过程也很简单，使用`go get -d -u github.com/golang/dep`即可以安装。

## 依赖库

 - xorm：golang写的 `mysql orm`库，用于读写mysql数据库
