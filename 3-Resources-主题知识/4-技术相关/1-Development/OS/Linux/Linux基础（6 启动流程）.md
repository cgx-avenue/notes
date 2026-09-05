# 流程
Linux系统启动主要分为下面三个流程：

1. 硬件引导（Hardware Boot）：这部分由主板BIOS控制完成，加载操作系统等一系列工作。
2. Linux操作系统引导（Linux Boot）：加载Linux内核，加载完成后启动init daemon。
3. Linux操作系统启动（Linux Startup）：由init daemon管理开机后服务管理事项。

![[../../../../../_assets/img/Pasted image 20230912155500.png]]

再来一张经典图就是，
![[../../../../../_assets/img/Pasted image 20230912155645.png]]

# 进入Linux之后
上面说的是进入操作系统之前，进入Linux系统之后，又发生了什么呢？参见Refs2
![[../../../../../_assets/img/Pasted image 20230912160003.png]]

真的是这样吗？看起来这是init架构的图。我们现在已知了systemd接管了init的历史重任。参见Refs3, 结合systemd的[[Linux基础（5 systemd）]]，启动图如下。
![[../../../../../_assets/img/Pasted image 20230912161127.png]]



# Refs
1. https://zhuanlan.zhihu.com/p/643259265
2. https://www.ruanyifeng.com/blog/2013/08/linux_boot_process.html
3. https://zhuanlan.zhihu.com/p/150016003