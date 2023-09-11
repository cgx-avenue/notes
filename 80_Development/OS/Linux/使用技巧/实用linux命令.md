# !!
语法糖，上一条运行的命令。
回想下自己身上是否发生过这样一种情况，当键入一行很长的命令敲击回车之后才发现命令开头忘记加 `sudo` 了,这时候你只需要键入 `sudo !!`，命令行自动把 `!!`替换成你上一条运行的命令。

# cd -
返回上一次cd到的目录。

# cd
`~` 表示Home目录，但是很少人知道的一个小窍门: 如果你键入 `cd` 命令，依然能回到Home目录。

# 搜索历史命令
你可以通过键盘上的上下键搜索已经键入过的命令，可能你需要连续按15次向上箭头的按键才能找到曾经输入过的`ls` 命令。现在使用反向搜索可以很轻松的实现: 按一下`Ctrl + R`键后开始输入命令，反向搜索功能会从最近历史命令中查找和输入最匹配的命令

# 重用参数
另一个小窍门是 `!$` 它会被替换成前面一个命令的参数。这是很实用的，例如，当你新创建了一个目录并且想进入这个目录：
```bash
mkdir temp
cd !$
```

# 拷贝和粘贴

你可能已经发现了 `Ctrl + C` 和 `Ctrl + V`，这两个组合在终端上是预留给正在运行的进程用的，可以用`Ctrl + Shift + C`和`Ctrl + Shift + V`来替代 `Ctrl + C` 和 `Ctrl + V`的功能。

# 让你的程序后台运行

在终端运行应用程序时，应用程序会随着终端的关闭而退出。使用 `nohup`命令可以实现终端退出，应用程序依然运行着，`nohup` 是 "no hang up"的缩写。  
例如:使用scp命令从本地传输大文件到远程服务器上，假如突然关掉终端的话，如何保证传输不会中断呢？下面的命令会解决这个问题。

`nohup scp big_file user@host:~/big_file`

`nohup`会创建一个nohup.out文件记录命令的输出

# 自动确认

在编写shell脚本自动执行任务时，有时需要人工输入 yes ，命令才会往下执行。在命令前加上 `yes |`就会跳过人工输入的步骤，下面的命令会自动输入 yes

```bash
yes | yum install lrzsz  
```

如果想自动输入 no ,则在命令前加上`no |`,下面的命令会自动输入 no

# 粉碎文件

如果你比较注重隐私的话，那这个命令很适合你。`rm`命令常用来删除文件,删除之后可以通过特殊的软件提取出已经删除的文件数据。想要彻底删除，可以试下下面的命令

```bash
shred -zvu filename
```

# vim为文件设置密码

- 如果文件处于vim编辑状态,切换到命令模式，输入`:X`(注意：这里是大写的X) 输入密码,再次确认密码之后保存退出
- 如果文件没有处于编辑状态,使用 `vim +X filename` 也可以为文件设置密码

下面是为文件 a.txt 设置密码

```ruby
[root@ecs-centos-7 ~]# vim a.txt
:X
Warning: Using a weak encryption method; see :help 'cm'                 
Enter encryption key: ***
Enter same key again: ***
```

设置密码之后，无论是通过cat还是vim都无法直接查看或者编辑 a.txt

```ruby
[root@ecs-centos-7 ~]# cat a.txt 
VimCrypt~01!q,oot@ecs-centos-7 ~]#
[root@ecs-centos-7 ~]# vim a.txt
Need encryption key for "a.txt"
Warning: Using a weak encryption method; see :help 'cm'
Enter encryption key:
```

从上面可以看出，使用 `cat a.txt`命令看到的是一串乱码，通过`vim a.txt` 编辑文件，需要先输入密码

# refs
1. https://www.cnblogs.com/wanng/p/ten-linux-practical-command.html
2. 