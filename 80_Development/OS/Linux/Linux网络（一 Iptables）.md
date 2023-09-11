# iptables
iptables 是 Linux 防火墙工作在用户空间的管理工具，是 `netfilter/iptables`IP 信息包过滤系统是一部分，用来设置、维护和检查 Linux 内核的 IP 数据包过滤规则。

有的地方说iptables是netfilter暴露在用户空间的接口。

我的理解是：iptables控制对linux系统网络数据包`进、出和转发`的控制。


# 四表五链（三表五链）
iptables内置了
![[imgs/Pasted image 20230911091029.png]]

# Linux防火墙过滤框架
![[imgs/Pasted image 20230911091130.png]]




# Refs
1. https://cloud.tencent.com/developer/article/1632776
2. https://cloud.tencent.com/developer/article/1632774
3. https://blog.csdn.net/daocaokafei/article/details/115091313
4. 