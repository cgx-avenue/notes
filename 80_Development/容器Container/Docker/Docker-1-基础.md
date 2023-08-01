#docker #basic #基础
# 资源
## 官网
https://www.docker.com/

# 原理
> Docker 技术使用 [Linux 内核](https://www.redhat.com/zh/topics/linux/what-is-the-linux-kernel)和内核功能（例如 [Cgroup](https://www.redhat.com/zh/blog/world-domination-cgroups-rhel-8-welcome-cgroups-v2) 和[命名空间](https://lwn.net/Articles/528078/)）来分隔进程，以便各进程相互独立运行。这种独立性正是采用容器的目的所在；它可以独立运行多种进程、多个应用，更加充分地发挥基础设施的作用，同时[保持各个独立系统的安全性](https://www.redhat.com/zh/topics/security)。



# 教程
### 安装
https://docs.docker.com/desktop/install/linux-install/

# 应用场景
1. Web 应用的自动化打包和发布。
2. 自动化测试和持续集成、发布。
3. 在服务型环境中部署和调整数据库或其他的后台应用。
4. 从头编译或者扩展现有的 OpenShift 或 Cloud Foundry 平台来搭建自己的 PaaS 环境。

# 架构
https://www.runoob.com/docker/docker-architecture.html
C/S 架构，看下图中的Host，对比Portainer里面的进入页。
![](imgs/2023-05-05-14-00-35.png)
其他的就是关键词，镜像，容器，等等。
Docker 包括三个基本概念:
 1. 镜像（Image）：Docker 镜像（Image），就相当于是一个 root 文件系统。比如官方镜像 ubuntu:16.04 就包含了完整的一套 Ubuntu16.04 最小系统的 root 文件系统。
2. 容器（Container）：镜像（Image）和容器（Container）的关系，就像是面向对象程序设计中的类和实例一样，镜像是静态的定义，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等。
 3. 仓库（Repository）：仓库可看成一个代码控制中心，用来保存镜像。


# Docker image 镜像
# Docker container 容器

# 容器连接
https://www.runoob.com/docker/docker-container-connection.html
指定端口号

# Dockerfile
https://www.runoob.com/docker/docker-dockerfile.html

# Docker compose
https://www.runoob.com/docker/docker-compose.html
https://juejin.cn/post/7042663735156015140


# Docker 命令
https://www.runoob.com/docker/docker-command-manual.html