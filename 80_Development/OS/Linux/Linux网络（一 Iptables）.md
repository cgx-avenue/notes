# iptables
iptables 是 Linux 防火墙工作在用户空间的管理工具，是 `netfilter/iptables`IP 信息包过滤系统是一部分，用来设置、维护和检查 Linux 内核的 IP 数据包过滤规则。

有的地方说iptables是netfilter暴露在用户空间的接口。

我的理解是：iptables控制对linux系统网络数据包`进、出和转发`的控制。


# 四表五链（三表五链）
iptables内置了如下四张表。表是根据目的或者功能进行的划分，链是根据数据的处理步骤进行的划分，参照过滤框架那张图。每个表根据其功能，能够操作的链不同，也就是下面这个图。
![[imgs/Pasted image 20230911091029.png]]
`三表`和`四表`的区别就是`raw`表，有的算进去有的不算。
## 四表
### raw
用于处理异常，包括的规则链有：prerouting，output；一般使用不到。

### filter
负责过滤数据包，包括的规则链有：`input`，`output`和`forward`

### nat
用于网络地址转换（IP、端口），包括的规则链有：`prerouting`，`postrouting` 和 `output`

### mangle
主要应用在修改数据包、流量整形、给数据包打标识，默认的规则链有：`INPUT`，`OUTPUT`、 `forward`，`POSTROUTING`，`PREROUTING`

## 优先级

mangle > nat > filter



# Linux防火墙过滤框架
![[imgs/Pasted image 20230911091130.png]]
上图即为




# Refs
1. https://cloud.tencent.com/developer/article/1632776
2. https://cloud.tencent.com/developer/article/1632774
3. https://blog.csdn.net/daocaokafei/article/details/115091313
4. 