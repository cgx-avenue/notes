# Motivation 使用场景
1. Docker容器获取宿主机信息，比如CPU，内存，磁盘等
2. Docker容器需要修改宿主机信息，比如网卡信息
3. 容器内命令不足，比如telnet调试端口，怎么利用宿主机工具命令

# 知识点
## Namespace隔离
Docker和宿主机共用一个内核，Namespace的隔离依然没有完全隔离Linux资源，如：/proc、/sys、/dev/sd*等目录；


## Proc或Pid空间
使用Docker问题：在Docker容器中执行top、free命令，看到的资源情况是宿主机的资源消耗比例，而不是这个容器被限制了多少CPU、内存；

## 
　　　　C. 设置容器特权级运行：--privileged，比如容器内操作内核模块、挂载USB磁盘、修改MAC地址等，设置privileged=true即可；

　　　　D. 设置容器特权白名单：--cap-add，privileged=true等同于cap-add=ALL，其权限非常大，接近于宿主机的权限，为了防止用户的滥用，需要增加权限限制，只提供给容器必须的权限。



Refs：
1. https://www.cnblogs.com/ruhuanxingyun/p/16850950.html