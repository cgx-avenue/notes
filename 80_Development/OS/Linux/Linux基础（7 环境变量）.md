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
```bash
# list all
export
```
![[imgs/Pasted image 20230913153709.png]]



# 设置环境变量
## export临时修改
通过 `export` 可配置环境变量
```bash
export A=3
echo $A

export NODE_ENV=production
echo $NODE_ENV

# 增加一个到PATH里
export PATH=/home/uusama/mysql/bin:$PATH
#或者把PATH放在前面
export PATH=$PATH:/home/uusama/mysql/bin
```

注意事项：
- 生效时间：立即生效
- 生效期限：当前终端有效，窗口关闭后无效
- 生效范围：仅对当前用户有效
- 配置的环境变量中不要忘了加上原来的配置，即$PATH部分，避免覆盖原来配置
## 长期修改1：vim ~/.bashrc
**「如果需要使得配置的环境变量永久有效，需要写入 `~/.bashrc` 或者 `~/.zshrc`」**
通过修改用户目录下的~/.bashrc文件进行配置：

```bash
vim ~/.bashrc
# 在最后一行加上
export PATH=$PATH:/home/uusama/mysql/bin
```

注意事项：
- 生效时间：使用相同的用户打开新的终端时生效，或者手动source ~/.bashrc生效
- 生效期限：永久有效
- 生效范围：仅对当前用户有效
- 如果有后续的环境变量加载文件覆盖了PATH定义，则可能不生效
## 长期修改2：
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
