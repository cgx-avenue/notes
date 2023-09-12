systemd不是单纯的一个命令，而是一个框架，用来管理从启动，用户到定时等很多任务。这里牵扯到linux的启动过程（参见下一篇）。
# 背景
systemd用来替代曾经混乱的Linux启动管理，`init`进程。这么多年来，关于如何在Linux里设置服务启动时生效，真的是烦不剩烦。systemd貌似能统一，但随着Linux发行版的不同，也并不是所有发行版都采用了systemd。
`init`如此启动服务：
```bash
sudo /etc/init.d/apache2 start
service apache2 start
```
依稀记得多少年前确实是这么配置的。
这种方法有两个缺点：
* 启动时间长。`init`进程是串行启动，只有前一个进程启动完，才会启动下一个进程。
* 启动脚本复杂。`init`进程只是执行启动脚本，不管其他事情。脚本需要自己处理各种情况，这往往使得脚本变得很长。

# Systemd概述
设计目标：为系统的启动和管理提供一套完整的解决方案。
根据 Linux 惯例，字母`d`是守护进程（daemon）的缩写。 Systemd 这个名字的含义，就是它要守护整个系统。

使用了 Systemd，就不需要再用`init`了。Systemd 取代了`initd`，成为系统的第一个进程（PID 等于 1），其他进程都是它的子进程。（参见refs1）

Systemd 的优点是功能强大，使用方便，缺点是体系庞大，非常复杂。事实上，现在还有很多人反对使用 Systemd，理由就是它过于复杂，与操作系统的其他部分强耦合，违反"keep simple, keep stupid"的[Unix 哲学](https://www.ruanyifeng.com/blog/2009/06/unix_philosophy.html)。
![[imgs/Pasted image 20230912142900.png]]
systemd架构图

systemctl是其中重要的命令行工具：
```bash
systemctl --version
```

# systemd 系统管理
通过各种命令实现
1. systemctl
2. systemd-analyze
3. hostnamectl
4. localectl
5. timedatectl
6. loginctl

# Unit
systemd可以管理**所有**系统资源，不同资源统称为Unit（单位）。
共12种，包含常用的`Service`。参见Refs2.


# refs
1. https://systemd.io/
2. https://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html
3. https://ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html