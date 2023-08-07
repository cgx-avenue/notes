官方文档：https://docs.docker.com/engine/reference/commandline/run/#privileged
官网的例子用的是mount，来看host的device相关的资源。

# 原理
> 使Docker容器获得host的root权限。
> 使用该参数，container内的root拥有真正的root权限。否则，container内的root只是外部的一个普通用户权限。
> privileged启动的容器，可以看到很多host上的设备，并且可以执行mount。
> 甚至允许你在docker容器中启动docker容器。
> https://blog.csdn.net/ichen820/article/details/120508201

背后原理是Linux capabilities
参见：https://www.cnblogs.com/davis12/p/14453690.html


# 实例
## 进入容器后查看素主机
```bash
$ sudo docker run -it --pid=host --privileged=true ubuntu /bin/bash
# 进入容器内部之后执行

/# nsenter -a -t 1 sh -c "ip addr"
```




Refs：
