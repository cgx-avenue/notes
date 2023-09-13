在任何操作系统中，环境变量都是很重要的组成部分。环境变量一般全部为大写。
# 显示环境变量
## printenv
```bash
# 显示所有环境变量
printenv
# 获取某个环境变量的值
printenv HOME
```
![[imgs/Pasted image 20230913152249.png]]
## echo $var 或者 ${var}
```bash
# 显示HOME环境变量的值
echo $HOME
echo ${HOME}
```
![[imgs/Pasted image 20230913152309.png]]

## export




# 设置环境变量
通过 `export` 可配置环境变量

```bash
$ export A=3
$ echo $A
3
$
$ export NODE_ENV=production
$ echo $NODE_ENV
production
```

**「如果需要使得配置的环境变量永久有效，需要写入 `~/.bashrc` 或者 `~/.zshrc`」**

### 前置环境变量

在执行命令之前置入环境变量，可以用以指定仅在该命令中有效的环境变量。

```javascript
# 该环境变量仅在当前命令中有效
$ NODE_ENV=production printenv NODE_ENV
production

# 没有输出
$ printenv NODE_ENV
```

在前端中大量使用，如

```javascript
$ NODE_ENV=production npm run build
```

# 常用环境变量
```bash
# 当前用户目录，等与 ~
echo $HOME
# 当前用户名, equals to `id --user --name`
echo $USER
# 当前shell工具
echo $SHELL

# PATH
echo $PATH


#航班查询 


```

# Refs
1. https://cloud.tencent.com/developer/article/2149492
2. 
