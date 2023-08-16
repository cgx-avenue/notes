# Overview
* 容器本身并不知道它是哪种网络模式，容器本身只知道自己的network interface和ip，gateway，路由表之类的。none模式除外（只有一个本地的loopback）接口。

## Published ports
* 默认没有任何端口被暴露。
* 使用`--publish` or `-p` 可以暴露端口。
* 使用后会在host新建一条firewall rule，进行映射。
举例： 
![](imgs/2023-08-16-14-11-46.png)

注意：
* 暴露端口意味着不只是host可以看到，外部也可以看到。
* 如果是用localhost ip(127.0.0.1)暴露的端口，则只有host可以访问该端口。
* 但如果是同样的L2网段，比如连到同一个交换机，那么其他host也可以访问localhost ip暴露的端口。
e.g.:
```bash
docker run -p 127.0.0.1:8080:80 nginx
```

## IP & Hostname
* 默认情况下，Docker daemon动态分配子网和ip。
* 当使用`docker network connect` 连接网络时，可以使用`--ip` or `--ip6` 来指定ip。
* 容器默认hostname是容器ID，但可以用`--hostname`覆盖。当连接到现有network时候，可以用`docker network connect --alias`指定。

## DNS







# Refs
1. https://docs.docker.com/network/
2. https://docs.docker.com/engine/reference/run/#network-settings