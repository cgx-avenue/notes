基于Ethernet二层网络的双路冗余结构。
![[imgs/Pasted image 20230918163026.png]]
物理上需要两个完全一样的Ethernet连接。
名词概念：  
**SAN：** Singly Attached Node，单端口节点，不实现PRP功能  
**DANP**： Doubly Attached Node implementing PRP，PRP的双端口节点，可直接发送PRP流量  
**RedBox**： Redundancy Box，冗余盒，将SAN传入的流量转换成PRP流量发送出去  
**C Frame**： 原始信息帧，指代用户想要冗余备份的信息  
**A Frame、B Frame**： 附带特定字段的PRP信息帧，由原始信息帧扩展而来

PRP冗余机制的实现，主要依托于两个逻辑或物理分隔的子网（LAN A，LAN B，即所谓的A网、B网），以上图中的信息传输为例：PRP发送方(Source DANP)将原始信息帧（C Frame）复制一份，并在两份帧中添加一特定字段（RCT，下面会提到这个），形成PRP信息帧（A Frame、B Frame），分别从自身的两个端口发送出去（分别对应A网、B网），分别途径两个独立的子网到达同一个PRP接收方（Destination DANP）；PRP接收方从两个端口分别接收到这两份PRP信息帧后，会经过一系列的帧处理算法进行处理，简而言之，就是依据“先来后到”的原则，将后到达的PRP信息帧消除，仅保留一份先到达的PRP信息帧，将特定字段消除后，还原成原来的原始信息，传递给上层。

那么问题来了，“A帧”和“B帧”是如何产生和消除的？具体的帧组成又是怎样的呢？请看下图：  
![pic怕](https://img-blog.csdnimg.cn/10a84b7a44514958babe3dd47621098c.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA57K-6YCaaGVsbG9fd29ybGQ=,size_10,color_FFFFFF,t_70,g_se,x_16)

![[imgs/Pasted image 20230918163131.png]]

这是DANP节点的简要示意图，主要分为上层（链路层以上）、LRE（Link Redundancy Entity，链路层冗余实体）子层、下层（链路层及物理层）。可以看到PRP设备的内部实现只是在标准以太网设备的MAC层中增添了一个LRE子层，这个子层内部实现了PRP信息帧的产生和消除算法。具体而言，就是在原始信息帧的基础上，增加了一个RCT（Redundancy Control Trailer，冗余控制体）字段，并针对这个字段进行一系列的处理，基于802.3标准以太网的PRP帧格式如下图所示：  
![在这里插入图片描述](https://img-blog.csdnimg.cn/5c6cd98382eb454792504c878adf6235.png)  
RCT字段由6个字节组成，内部又会细分为不同的位域，指代不同的含义，简要介绍如下：

> **Sequence Number**:16位帧序列号，LRE对同一原始信息帧复制而来的PRP帧赋予相同的序列号，并会随PRP帧的发送而递增序列号的值  
> **LSDU size**：12位载荷大小，标识Payload字段+RCT字段的总字节大小  
> **Lan id**：4位子网ID，仅有两个值可选，0xa、0xb，代表A、B两个子网  
> **PRP Suffix**：16位PRP信息帧后缀，固定为0x88fb

LRE所实现的总体功能，就如先前所提到的：发送方向，将原始帧复制一份，打上A、B两个子网的RCT字段，向两个端口分别发送；接收方向，则是根据源MAC、RCT中的帧序列号识别某一PRP帧，后依据“先来后到”的原则，仅保留一份PRP信息帧，褪去RCT字段后传输给上层应用程序。而LRE子层内部的具体实现，有兴趣的读者可以自行移步IEC官网了解。


# Refs
1. https://blog.csdn.net/qq_41658597/article/details/120660263
2. https://blog.csdn.net/weixin_47677928/article/details/119677481
3. 