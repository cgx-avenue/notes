# 微软官方文档
包含了安装，改版本，运行多个Linux发行版的方法
https://learn.microsoft.com/zh-cn/windows/wsl/install

# 开发环境备份
可以使用`wsl --export <DistributionName> <fileName>`， 例如，我们使用`Ubuntu18.04`的Linux版本，那么使用如下命令导出：

```shell
# --export <分发版> <文件名>
wsl --export Ubuntu18.04 ubuntuLinux
```

那么就会在当前文件夹下生成一个名为ubuntuLinux的文件，这就是我们的WSL开发环境了。

如何导入？

```shell
# --import <分发版> <安装位置> <文件名> 
wsl --import Ubuntu18.04 . ubuntuLinux
```

> 导入的WSL默认用户会被设置为root，但是有时候使用root会比较麻烦，比如我们使用普通账户开发的项目，如果用root打开的话，可能有些文件的所有人和所有组会变成root，这时候如果再使用普通账户读写就会产生问题。因此要设置默认用户为普通用户。

```bash
sudo vim /etc/wsl.conf
```

文件内容如下：

```ini
[user]
default=lc
```

# 启用systemd
Refer to Refs.1

# WSL和windows共享文件
参照Refs.2
```
\\wsl$
``` 

# Refs
1. https://cloud.tencent.com/developer/article/1645054
2. https://blog.csdn.net/Caoyang_He/article/details/107898883