# iptables
iptables 是 Linux 防火墙工作在用户空间的管理工具，是 `netfilter/iptables`IP 信息包过滤系统是一部分，用来设置、维护和检查 Linux 内核的 IP 数据包过滤规则。

有的地方说iptables是netfilter暴露在用户空间的接口。

我的理解是：iptables控制对linux系统网络数据包`进、出和转发`的控制。


# 四表五链（三表五链）
iptables内置了如下四张表。表是根据目的或者功能进行的划分，链是根据数据的处理步骤进行的划分，参照过滤框架那张图。每个表根据其功能，能够操作的链不同，也就是下面这个图。

`三表`和`四表`的区别就是`raw`表，有的算进去有的不算。
## 四表
![[../../../../../_assets/img/Pasted image 20230911091029.png]]

### raw
用于处理异常，包括的规则链有：prerouting，output；一般使用不到。

### filter
负责过滤数据包，包括的规则链有：`input`，`output`和`forward`

### nat
用于网络地址转换（IP、端口），包括的规则链有：`prerouting`，`postrouting` 和 `output`

### mangle
主要应用在修改数据包、流量整形、给数据包打标识，默认的规则链有：`INPUT`，`OUTPUT`、 `forward`，`POSTROUTING`，`PREROUTING`

### 优先级

mangle > nat > filter



## 五链
即Linux防火墙过滤框架，也就是数据来了怎么进行的处理。图中的`路由决策`和`Local Process`不算做五链。
![[../../../../../_assets/img/Pasted image 20230911094058.png]]
### input
匹配目标IP是本机的数据包

### output
出口数据包 ， 一般不在此链上做配置

### forward
匹配流经本机的数据包

### prerouting
修改目的地址，用来做 DNAT 。如：把内网中的 80 端口映射到互联网端口

### postrouting
修改源地址，用来做 SNAT。如：局域网共享一个[公网IP](https://cloud.tencent.com/product/eip?from_column=20065&from=20065)接入Internet。

### 数据流
参照上面的图
1. 当一个数据包进入网卡时，它首先进入 `PREROUTING` 链，内核根据数据包目的 IP 判断是否需要转送出去。
2. 如果数据包就是进入本机的，它就会沿着图向下移动，到达 `INPUT` 链。数据包到了 INPUT 链后，任何进程都会收到它。
3. 本机上运行的程序可以发送数据包，这些数据包会经过 `OUTPUT` 链，然后到达`POSTROUTING` 链输出。
4. 如果数据包是要转发出去的，且内核允许转发，数据包就会如图所示向右移动，经过 `FORWARD` 链，然后到达 `POSTROUTING` 链输出。

> **总结**：整体数据包分两类：1、发给防火墙本身的数据包 ；2、需要经过防火墙的数据包

# iptables规则和操作
参见refs4，5
## 规则格式
![[../../../../../_assets/img/Pasted image 20230911095047.png]]
`-t`就是操作哪张表，默认filter，`chain`部分就是五链当中哪一个，其余的都是条件、动作之类的，详见refs5.

## 显示当前的rule
```bash
sudo iptables -L
```




# Refs
1. https://cloud.tencent.com/developer/article/1632776
2. https://cloud.tencent.com/developer/article/1632774
3. https://blog.csdn.net/daocaokafei/article/details/115091313
4. https://upcloud.com/resources/tutorials/configure-iptables-ubuntu
5. https://cloud.tencent.com/developer/article/1632774
6. https://zhuanlan.zhihu.com/p/618848653