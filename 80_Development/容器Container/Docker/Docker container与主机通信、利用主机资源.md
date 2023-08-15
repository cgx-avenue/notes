# Motivation 使用场景
1. Docker容器获取宿主机信息，比如CPU，内存，磁盘等
2. Docker容器需要修改宿主机信息，比如网卡信息
3. 容器内命令不足，比如telnet调试端口，怎么利用宿主机工具命令

# 方式一：利用docker run --priviledge --pid
## 知识点
### Namespace隔离
Docker和宿主机共用一个内核，Namespace的隔离依然没有完全隔离Linux资源，如：/proc、/sys、/dev/sd*等目录；


### Proc或Pid空间
使用Docker问题：在Docker容器中执行top、free命令，看到的资源情况是宿主机的资源消耗比例，而不是这个容器被限制了多少CPU、内存；

### --privileged 模式
设置容器特权级运行：--privileged，比如容器内操作内核模块、挂载USB磁盘、修改MAC地址等，设置privileged=true即可；

### 按需给予capability
设置容器特权白名单：--cap-add，privileged=true等同于cap-add=ALL，其权限非常大，接近于宿主机的权限，为了防止用户的滥用，需要增加权限限制，只提供给容器必须的权限。

### docker run
比如如下docker 命令
```bash
docker run --privileged=true --pid=host
```

--pid=host，使用宿主机命名空间，方便容器获取到宿主机所有进程信息，其中/proc/1作为nsenter的目标；

--privileged=true，使得docker容器有root权限执行宿主机命令，确保从容器执行命令时不会报权限不足提示；

### nsenter 调试命令
nsenter执行宿主机命令查看IP信息：nsenter -n -t 1 ip addr

nsenter命令是一个可以在指定进程的命令空间下运行指定程序的命令，位于util-linux包中，格式：nsenter -a -t <pid> <command> 或者nsenter -m -u -i -n -p -t <pid> <command> ；

-a表示进入宿主机的所有命名空间，linux旧版本可能不支持，需要替换为-m -u -i -n -p、-m表示进入mount命令空间、-u表示进入uts命令空间、-i表示进入ipc命令空间、-n表示进入net命令空间、-p表示进入pid命令空间、-U表示进入user命令空间、-t表示被进入命名空间的目标进程的pid；

可以先输入nsenter -n -t 1进入1空间，然后输入ip addr命令，最后执行exit退出。

## 问题集
### 获取docker 容器的PID
```bash
docker inspect -f <container_name|container_id> | grep Pid
```
### 进入容器命令空间
```bash
nsenter -n -t PID
```
注意：执行完不会有任何提示
### 抓取数据包
```bash
tcpdump -nn -i veth22222 port 8081
```

方式二：利用ssh，容器登录host
https://juejin.cn/post/7090940431122300941


## Refs：
1. https://www.cnblogs.com/ruhuanxingyun/p/16850950.html
2. https://cloud.tencent.com/developer/article/1730699
3. https://zhuanlan.zhihu.com/p/636269015
4. https://blog.csdn.net/gongdiwudu/article/details/128888497

# 方式二
