记录一些杂七杂八的小知识。

# 内核端口数量的限制
在Linxu系统中，端口的数值范围为无符号short类型，值范围为1 ~ 65535。一般来讲**1 ~ 1023范围默认只有Root用户有权限使用，普通用户可以使用区间范围1025 ~ 65535，约6万。**

但你要考虑这中间很多的端口可能被已运行的程序占用，不妨打个折降低预期范围，留有5万左右的可用数值，以作缓冲。

我们可通过sysctl命令确认当前可用的端口范围，以作参考：

bash sysctl -a | grep net.ipv4.ip_local_port_range

若范围空间太小，比如1024 ~ 35525，那就需要主动扩大一下：

bash sysctl -w net.ipv4.ip_local_port_range="1024 65535" sysctl -p
————————————————
版权声明：本文为CSDN博主「star9595」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/u014042372/article/details/85261871

#  [What do 'real', 'user' and 'sys' mean in the output of time(1)?](https://stackoverflow.com/questions/556405/what-do-real-user-and-sys-mean-in-the-output-of-time1)
https://stackoverflow.com/questions/556405/what-do-real-user-and-sys-mean-in-the-output-of-time1

# Linux帮助命令
- help 命令与 --help 参数
- man 命令
- info 命令

https://zhuanlan.zhihu.com/p/105096446