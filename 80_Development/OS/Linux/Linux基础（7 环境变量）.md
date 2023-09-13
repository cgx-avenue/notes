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

## env
查看当前系统定义的所有环境变量。
![[imgs/Pasted image 20230913155020.png]]

## set
查看所有本地定义的环境变量。
![[imgs/Pasted image 20230913155229.png]]

# 设置环境变量
设置环境变量时，需要考虑：
1. 生效时间，是否立即
2. 生效期限，是否永久
3. 生效范围，是否只针对当前用户
4. 配置范围，是否保留原配置并添加
## 1. export临时配置
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
## 2. 长期配置1：vim ~/.bashrc
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
## 3. 长期配置2：vim ~/.bash_profile
和修改~/.bashrc文件类似，也是要在文件最后加上新的路径即可：

```text
vim ~/.bash_profile
# 在最后一行加上
export PATH=$PATH:/home/uusama/mysql/bin
```

注意事项：
- 生效时间：使用相同的用户打开新的终端时生效，或者手动source ~/.bash_profile生效
- 生效期限：永久有效
- 生效范围：仅对当前用户有效
- 如果没有~/.bash_profile文件，则可以编辑~/.profile文件或者新建一个

## 4. 长期配置3： vim /etc/bashrc
该方法是修改系统配置，需要管理员权限（如root）或者对该文件的写入权限：

```text
# 如果/etc/bashrc文件不可编辑，需要修改为可编辑
chmod -v u+w /etc/bashrc
vim /etc/bashrc
# 在最后一行加上
export PATH=$PATH:/home/uusama/mysql/bin
```

注意事项：
- 生效时间：新开终端生效，或者手动source /etc/bashrc生效
- 生效期限：永久有效
- 生效范围：对所有用户有效

## 5. 长期配置4：vim /etc/profile
该方法修改系统配置，需要管理员权限或者对该文件的写入权限，和vim /etc/bashrc类似：
```text
# 如果/etc/profile文件不可编辑，需要修改为可编辑
chmod -v u+w /etc/profile
vim /etc/profile
# 在最后一行加上
export PATH=$PATH:/home/uusama/mysql/bin
```

注意事项：
- 生效时间：新开终端生效，或者手动source /etc/profile生效
- 生效期限：永久有效
- 生效范围：对所有用户有效

## 6. 长期配置5：vim /etc/environment
该方法是修改系统环境配置文件，需要管理员权限或者对该文件的写入权限：
```text
# 如果/etc/bashrc文件不可编辑，需要修改为可编辑
chmod -v u+w /etc/environment
vim /etc/profile
# 在最后一行加上
export PATH=$PATH:/home/uusama/mysql/bin
```

注意事项：
- 生效时间：新开终端生效，或者手动source /etc/environment生效
- 生效期限：永久有效
- 生效范围：对所有用户有效




## 前置环境变量

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

# 删除环境变量
**使用 `unset` 删除指定的环境变量**，`set` 也可以设置某个环境变量的值。清除环境变量的值用 unset 命令。如果未指定值，则该变量值将被设为 NULL。示例如下：

```bash
export TEST="Test..."  # 增加一个环境变量 TEST
env | grep TEST  # 此命令有输入，证明环境变量 TEST 已经存在了
TEST=Test...
unset  TEST  # 删除环境变量 TEST
env |grep TEST  # 此命令没有输出，证明环境变量 TEST 已经删除
```

# 环境变量原理和顺序
环境变量的分类

环境变量可以简单的分成用户自定义的环境变量以及系统级别的环境变量。

- 用户级别环境变量定义文件：~/.bashrc、~/.profile（部分系统为：~/.bash_profile）
- 系统级别环境变量定义文件：/etc/bashrc、/etc/profile(部分系统为：/etc/bash_profile）、/etc/environment

另外在用户环境变量中，系统会首先读取~/.bash_profile（或者~/.profile）文件，如果没有该文件则读取~/.bash_login，根据这些文件中内容再去读取~/.bashrc。

可以推测出Linux加载环境变量的顺序如下：

```ini
/etc/environment
/etc/profile
/etc/bash.bashrc
/etc/profile.d/test.sh
~/.profile
~/.bashrc
```

由上面的测试可容易得出Linux加载环境变量的顺序如下，：

系统环境变量 -> 用户自定义环境变量 /etc/environment -> /etc/profile -> ~/.profile


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


```

# Refs
1. https://cloud.tencent.com/developer/article/2149492
2. https://zhuanlan.zhihu.com/p/317282094
3. 
