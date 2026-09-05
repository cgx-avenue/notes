# 原理
所谓多网卡冗余就是通过工具把多张网卡绑定成一个IP地址（bond0属于虚拟网卡）使用。这项技术在大中小企业都无比受用。

## 多网卡的绑定的优点：
1、扩大服务器的网络带宽
2、可以有效均衡负载和提高容错能力，避免单点失效
3、一旦发生故障，无缝切换网卡。

linux 主机安装双网卡，共享一个IP地址，对外提供访问，实际 同样 连接两条物理线路到交换机 实现平时 双网卡同时工作，分流网络压力，同时提供冗余备份，监控，防止物理线路的单点故障。

用于关键性节点[服务器](https://cloud.tencent.com/act/pro/promotion-cvm?from_column=20065&from=20065)，高网络IO服务器，网络[共享存储](https://cloud.tencent.com/product/cfs?from_column=20065&from=20065)服务器等。。。

# 实现
Linux bonding 驱动模块 提供了一种方法，用以把多个网络接口（network interface）组合成一个 逻辑的 "bonded" 接口。 Bonded 接口的工作方式取决于驱动的模式：不同的模式提供了热备份或负载均衡等不同的服 务。

此外，驱动还会监控链路的可用性。大多数目前发布的Linux内核都以模块（module）方式带了bonding驱动， ifenslave工具（主要配置工具）也都已经安装好。

## 7种策略
* 轮询策略（round robin），mode=0，按照设备顺序依次传输数据包，提供负载均衡和容错能力 
* 主备策略（active-backup），mode=1，只有主网卡处于工作状态，备网卡处于备用状态，主网卡坏掉后备网卡开始工作，提供容错能力 
* 异或策略（load balancing (xor)），mode=2，根据源MAC地址和目的MAC地址进行异或计算的结果来选择传输设备，提供负载均衡和容错能力 
* 广播策略（fault-tolerance (broadcast)），mode=3，将所有数据包传输给所有接口通过全部设备来传输所有数据，一个报文会复制两份通过bond下的两个网卡分别发送出去，提供高容错能力 
* 动态链接聚合（lacp），mode=4，按照802.3ad协议的聚合自动配置来共享相同的传输速度，网卡带宽最高可以翻倍，链路聚合控制协议（LACP）自动通知交换机聚合哪些端口，需要交换机支持 802.3ad协议，提供容错能力 
* 输出负载均衡模式（transmit load balancing），mode=5，输出负载均衡模式，只有输出实现负载均衡，输入数据时则只选定其中一块网卡接收，需要网卡和驱动支持ethtool命令 
* 输入/输出负载均衡模式（adaptive load balancing），mode=6，输入和输出都实现负载均衡，需要网卡和驱动支持ethtool命令

常用的有三种

mode=0：平衡负载模式，有自动备援，但需要”Switch”支援及设定。

mode=1：自动备援模式，其中一条线若断线，其他线路将会自动备援。

mode=6：平衡负载模式，有自动备援，不必”Switch”支援及设定。

# Refs
1. https://cloud.tencent.com/developer/article/1923889
2. https://www.cnblogs.com/lcword/p/5914089.html
3. https://www.cnblogs.com/lcword/p/5914089.html
4. https://zhuanlan.zhihu.com/p/352814803