# Linux 是多用户系统
Windows是单用户，Linux是多用户。多用户的含义是可以同时登录，会有资源访问、使用等冲突，因此用户管理和权限管理就很重要。

# 角色划分
Linux中一切都是文件，所有的管理都是针对“文件”的管理，根据这一特征，划分成了4种用户。
## 文件所有者 Owner
当一个用户创建了一个文件，这个用户就是这个文件的文件所有者。文件所有者对文件拥有最高权限，同时排他性地拥有该文件。

换句话说，除非文件所有者开放权限，否则其他人无法对文件执行查看、修改等操作。

**这也是 Linux 系统能够保护用户隐私的最关键的原因。**

在文件所有者占有文件之后，需要文件所有者对其他用户开放权限，其他用户才能查看、修改文件。

如果仅区分 “文件所有者” 和 “其他用户”，那么文件所有者对其他用户开放权限后，所有其他用户均能查看、修改文件。

但是，若文件所有者希望仅对部分用户开放，那么仅仅区分 “用户所有者” 和 “其他用户” 显然不满足需求。

这就引入了 “用户组的概念”。

## 用户组成员 Group
将 “其他用户” 区分为用户组成员和其他人后，若文件所有者希望对部分用户开放权限，而对其他人继续保持私有，则只需要将这部分用户与文件所有者划入一个用户组。

这样，这部分用户就成了与文件所有者同组的用户组成员。用户可以对用户组成员开放文件权限，用户组成员则具备了查看、修改文件的权限，而对其他无关用户保持私有。

用户组成员在团队开发中非常有帮助。

例如，团队成员之间保持文件资源共享，但对非团队成员保持私有，这就需要将文件所有者与团队成员用户划分为同一个用户组，再对用户组成员开放权限即可。

需要注意的是，**一个用户可在多个用户组中**。


## 其他人 Others

顾名思义，就是与文件所有者没有任何联系的其他用户。

## 0号用户 root

在这里不得不提 Linux 系统中，具有最高权限的用户——root。
超级用户的[命令提示符](https://so.csdn.net/so/search?q=%E5%91%BD%E4%BB%A4%E6%8F%90%E7%A4%BA%E7%AC%A6&spm=1001.2101.3001.7020)是“#”，普通用户的命令提示符是“$”。

root的UID=0，root组的GID=0.
![[imgs/Pasted image 20230914135548.png]]

root 用户是系统中唯一的一个超级管理员，拥有了系统中的所有权限，可以执行任何想要执行的操作，也正因为如此，处于安全考虑，一般情况下不推荐使用 root 用户进行日常使用。

root 用户所在的用户组称为 “root组”，处于 root 组的普通用户，能够通过 sudo 命令获取 root 权限。

但是root组里的其他成员，并没有和root一样的高权限，参见refs2. 但要注意，比root组更高的wheel组，在ubuntu中并不存在。refs3


# Linux 用户管理相关文件
Linux 将用户账号、密码等相关的信息分别存储在四个文件夹下：

- /etc/passwd —— 管理用户UID/GID重要参数
- /etc/shadow —— 管理用户密码
- /etc/group —— 管理用户组相关信息
- /etc/gshadow —— 管理用户组管理员相关信息

这些文件中，每一行代表一个用户或一个用户组，并存储了相关的用户或用户组信息。

## /etc/passwd
![[imgs/Pasted image 20230914135752.png]]

该文件中，每一行的存储格式为：

```text
账号名称 : 密码 : UID : GID : 用户信息说明列 : 主文件夹 : shell

root : x : 0 : 0 : root : /root : /bin/bash
```

其中，密码项显示 “x” 是出于安全考虑，Linux 将密码信息移到 /etc/shadow 进行存储；

每一个用户都有一个UID、GID，对应的含义就是UserID、GroupID，UID 会映射到 /etc/shadow 以获得密码信息，GID 会映射到 /etc/group 以获取用户的用户组信息。

## /etc/shadow
![[imgs/Pasted image 20230914135831.png]]
该文件中，每一行的存储格式为：

```text
账号名称 : 密码 : 最近改动密码的日期 : 密码不可被改变的天数 : 密码需要重新更改的天数 : 更改提醒天数 : 密码过期后账号的宽限时间 : 账号失效日期 : 保留

root : (字符串，此处打码) : 200 : 0 : 99999 : 7 : : :
```

其中，第二列表示密码加密后的字符串。

/etc/passwd 通过 UID，在该文件中找出对应 UID 的用户，并提取对应密码用于登陆验证。

## /etc/group
该文件中，每一行的存储格式为：

```text
用户组名称 : 用户组密码 : GID : 此用户组包含的账号名称

root : x : 0 : root
```

其中，

用户组密码通常是为了设置用户组管理员存在的，其信息也移动到 /etc/gshadow 中；

/etc/passwd 通过 GID，在该文件中找到对应的用户组，并提取用户组相关信息；

另外，由于一个用户可以在多个用户组中，因此就有一个初始用户组的有效用户组的概念。

所谓的初始用户组，就是用户所记录的 GID，是在创建用户时生成或指定的用户组；

所谓的有效用户组，就是利用命令 groups 查看并输出的首个用户组，即有效用户组；

用户在登录的时候，以初始用户组身份工作，用户可以用 newgrp 命令实现有效用户组的切换。


## /etc/gshadow
该文件中，每一行的存储格式为：

```text
用户组名 : 密码 : 用户组管理员账号 : 该用户组包含的账号名称

root : : : root
```

一般用户组不使用用户组管理员，相应地也就不需要设置密码。


# 查询用户信息
涉及用户信息查询的命令主要有：

```text
id <user>                           # 展示指定user的UID、GID、用户组信息等，默认为当前有效用户
who am i                            # 等同于 who -m，仅显示当前登录用户相关信息
whoami                              #   仅显示当前有效用户的用户名
w                                           # 展示当前正在登录主机的用户信息及正在执行的操作
who                                     # 展示当前正在登录主机的用户信息
last <user>                     # 展示指定用户的历史登录信息，默认为当前有效用户
lastlog -u <user>           # 展示指定用户最近的一次登录信息，默认显示所有用户
```

# 命令
## 用户
### useradd
```bash
useradd [options] [username]
```

在使用 useradd 时，可以通过不同的参数 options，达到不同的创建用户的效果，例如指定UID、指定初始用户组、指定次要用户组、指定主文件夹等。

具体参数请利用 man 命令进行查询。

useradd 在不指定任何参数的时候，会参考两个主要配置文件的默认值来新增用户

```text
文件路径：/etc/default/useradd
GROUP = 100                                 # 默认的用户组
HOME = /home                                # 默认的主文件夹所在目录
INACTIVE = -1                               # 密码失效日
EXPIRE =                                        # 账号失效日
SHELL = /bin/shell                  # 默认shell
SKEL = /etc/skel                        # 用户主文件夹的内容数据参考目录
CREATE_MAIL_SPOOL = yes         # 是否创建邮件信箱


文件路径：/etc/login.defs
PASS_MAX_DAYS           99999               # 多久必须重设密码（天）
PASS_MIN_DAYS       0                       # 距上次修改密码多久不可重设密码（天）
PASS_MIN_LEN            5                       # 密码最短的字符长度
PASS_WARN_AGE           7                       # 距离多少天过期会报警提示
UID_MIN                     500                 # 创建用户的UID默认最小值
UID_MAX                     60000               # 创建用户的UID上限
GID_MIN                     500                 # 创建用户的GID默认最小值
GID_MAX                     60000               # 创建用户的GID上限
USERGROUPS_ENAB     yes                 # 删除用户时是否删除初始用户组（组内不再有其他成员）
MD5_CRYPT_ENAB      yes                 # 密码是否经过MD5加密
```

useradd 通过参考这两个文件的配置信息，赋予创建的用户默认值。
另外，useradd 默认不会在 /home 下创建用户同名的主目录；
同时，useradd 创建的用户还没有设置登录密码，需要利用passwd进行密码设置。

### passwd
利用 passwd 命令，可以设置或重置密码

```text
passwd [options] [username]
```

与 useradd 相同，不同的 options 参数能够满足不同的密码设置需求，包括失效时间、密码改动时间等。

具体请查询 passwd 命令的帮助手册。

### adduser
adduser 与 useradd 的功能一样，都是为了创建新用户而存在的命令，但是 adduser 与 useradd 在一些方面存在不同。

1. useradd 创建用户，但是不创建密码等其他用户信息，需要使用 passwd 设置密码才能使用；而 adduser 能通过交互界面，由用户直接输入密码等，设置用户信息。
2. useradd 默认不在 /home 下创建用户同名的主文件夹，而 adduser 默认创建。
3. useradd 是一个命令，而 adduser 被理解为一个 “简单的应用程序”。

在实用性上，adduser 确实要实用不少。

**相似地，有 addgroup、deluder、delgroup 命令，与 adduser 的性质相似，下面不再赘述**。

### change
chage 命令用来修改与用户密码相关的过期信息，如密码失效日、密码最短保留天数、失效前警告天数等。

```text
chage [option] [username]
```

当然，passwd 也可以做相应的修改.

### usermod
usermod 命令用来修改用户信息。

```text
usermod [options] [username]
```

usermod 通过选用不同的 options 参数，可以修改存储在 etc/passwd 内的用户信息。

### userdel
userdel 命令用来删除用户的相关的所有数据。

```text
userdel [options] [username]
```

### deluser
与 adduser 性质相似

## 用户组
### groupadd
使用方式与 useradd 非常相似，与 useradd 不同的是，新建的用户组通常不需要设置密码。

```text
groupadd [options] [groupname]
```

### addgroup

与 adduser 性质相似。

### groupmod

groupmod 命令用来修改 group 相关的参数，不过通常不建议修改 GID

```text
groupmod [options] [groupname]
```

### groupdel

groupdel 删除用户组之前，**必须保证没有任何一个用户使用这个用户组作为初始用户组，否则无法删除**。

```text
groupdel [options] [groupname]
```

### delgroup

与 deluser 性质相似。

### gpasswd
用户组管理的命令是gpasswd，通常用来给用户组添加或移除用户，其基本语法如下：
```bash
gpasswd [option] GroupName
gpasswd -a user1 Group2 #将用户user1添加到用户组Group2中；
gpasswd -d user1 Group1 #将用户user1从用户组Group1中移除；
```
![[imgs/Pasted image 20230914144730.png]]

# 用户身份切换
涉及用户身份切换的命令有两个：su、sudo
## su

```text
su [options] [username]

options：
-：代表使用 login-shell 的变量文件读取方式来登录系统
-l：同上
-m：表示使用当前的环境设置，而不读取新用户的配置文件
-c：仅进行一次命令，执行完后直接回到目前的用户身份
```

如果 username 为空，则默认切换为 root 用户。

这里需要十分注意，**options 中是否带 “-” 的区别是很大的**。

“su” 表示读取变量设置方式为 non-login shell，即切换身份但不读取目标用户的 shell 变量，因此很多变量不会发生改变，例如 PATH、MAIL 等重要变量，仍然保持切换前用户的变量信息。

“su -” 表示切换身份的同时读取目标用户的 login-shell ，通常建议使用这一方式切换身份。

完成工作后，可以以 exit 命令返回到原用户。

另外，在普通用户切换到 root 用户时，需要 root 用户的登录密码，才能成功切换。这里又涉及到一个安全问题，如何让指定的普通用户具备 root 权限的同时，不让其知道 root 的登录密码呢？这就需要使用 sudo 命令了。

## sudo

普通用户可以通过 sudo 命令，使用 root 用户权限来执行命令。

当然，不是所有的用户都能执行 sudo 命令的，而是在 /etc/sudoers 文件内的用户才能执行这个命令。

sudo 的执行流程大致为：

- 系统到 /etc/sudoers 下检查用户是否有执行 sudo 的权限
- 若有 sudo 权限，则需要输入本用户的密码（root 用户执行 sudo 不需要密码）
- 验证成功后执行命令

因此，关键在于执行 sudo 的用户是否存在于 /etc/sudoers 文件内。

我们不妨打开 sudoers 文件查看相关信息。
![[imgs/Pasted image 20230914143650.png]]

在 sudoers 文件中，我们发现两行关键信息

图中第一行，表示可执行 sudo 的单个用户白名单

```text
root                                            ALL=(ALL:ALL)                                           ALL
用户账号            登录者来源主机名=(可切换身份：身份所在用户组)             可执行命令
```

图中第二行，表示可执行 sudo 的用户组白名单

```text
root                                            ALL=(ALL:ALL)                                           ALL
用户账号            登录者来源主机名=(可切换身份：身份所在用户组)             可执行命令
```

通过修改 ”可切换身份“，可以限制用户执行 sudo 的目标身份；

通过修改 ”可执行命令“，可以限制用户利用 sudo 执行的命令内容，达到局部授权的作用。

以下为样例：

```text
testuser            ALL=(ALL:ALL)                   ALL
testuser            ALL=(root:root)             ALL
testuser            ALL=(root:root)             /usr/bin/passwd
```

第一行表示 testuser 可以利用 sudo 以任何身份执行任何命令

第二行表示 testuser 仅可以以 root 身份执行任何命令

第三行表示 testuser 仅可以以 root 身份执行 passwd 命令


# Refs
1. https://zhuanlan.zhihu.com/p/105482468
2. https://blog.csdn.net/iamwayne10/article/details/109464971
3. https://cn.bing.com/search?q=ubuntu+wheel&cvid=0753dd7a7cf64925980b9fc68fcdf7c2&aqs=edge.0.0l9.2808j0j1&FORM=ANNTA1&PC=U531
4. 