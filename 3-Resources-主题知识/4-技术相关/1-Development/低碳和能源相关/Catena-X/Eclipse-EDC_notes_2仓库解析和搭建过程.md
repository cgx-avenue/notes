# 仓库和目录解析
## Connector
https://github.com/eclipse-edc/Connector
视频讲解列表
https://www.youtube.com/watch?v=_YiSzTALTCA&list=PLw-f_YoTxWJVVPkuj1vDb6tLPM2_Cm1hR&index=2
### 目录结构
1. spi
service provider interface. 最重要的目录，修改啥都要改里面的东西。
2. core
各种基础服务。
3. data-protocol
包含connector-to-connector通信的内容。
4. extensions
为了各种功能的扩展，比如扩展不同类型的数据库。

## core classes and items
1. vault
something that can store secrets securely
vault.java and other .java files
2. monitor
a monitor is essentially a logger
3. Transfer process manager
4. Provision manager
5. 

# Contract negotiation & transfer process
![[../../../../../_assets/img/Pasted image 20240109110619.png]]



# 搭建过程

## EDC samples
三个层级：
1. basic
2. transfer
3. advanced




## EDC samples transfer chapter
### 大坑！ 关于transfer-01-negotiatian {{contract-negotiation-id}}
![[../../../../../_assets/img/Pasted image 20240102132914.png]]
这里有一个{{contract-negotiation-id}},看原文以为是之前第五步输出的id，例如下图：
![[../../../../../_assets/img/Pasted image 20240102133005.png]]
其实不是！其实不是！其实不是！
在翻看transfer/transfer-01-negotiation/resources/negotiate-contract.json文件时候发现了这个字段，
![[../../../../../_assets/img/Pasted image 20240102133049.png]]
再查看这里的git commit历史，结合教程页面，发现这里需要输入的是第四步，fetch catalog里，这个id
![[../../../../../_assets/img/Pasted image 20240102133530.png]]
ok，执行第五步negotiate a contract之前，json里改这个id，然后执行第五步。
consumer端的输出如下，变得不一样了。
![[../../../../../_assets/img/Pasted image 20240102133710.png]]

再试试第六步里，url的id也换成这个，报错。但是换成上图里的id，也就是之前理解的，第五步输出里的id，就成功了。
![[../../../../../_assets/img/Pasted image 20240102133906.png]]
故：
1. negotiate-contract.json里的{{contract-negotiation-id}}需要用第四步输出里的odrl:hasPolicy里的id
2. url里的{{contract-negotiation-id}}需要用第五步输出里的id。
3. 如此得到的id是contract-agreement-id

### 02 consumer pull
没跑起来，provider端报错。
![[../../../../../_assets/img/Pasted image 20240102140833.png]]
看截图是找不到source和dest。

### 03 provider push
这个居然神奇的跑起来了！！！我的天啊

### 04和05没跑
05需要aws的东西

## EDC samples advanced chapter
### 01
没跑起来，报错
![[../../../../../_assets/img/Pasted image 20240102151233.png]]
不想看了

## MVD
Minimum Viable Dataspace
```markdown
The MVD backend and MVD UI (Data Dashboard) can be run locally for testing and development.

1. Check out the repository [eclipse-edc/DataDashboard](https://github.com/eclipse-edc/DataDashboard) or your corresponding fork.
2. Set the environment variable `MVD_UI_PATH` to the path of the DataDashboard repository. (See example below.)
3. Use the instructions in section `Publish/Build Tasks` [system-tests/README.md](https://github.com/eclipse-edc/MinimumViableDataspace/blob/main/system-tests/README.md) to set up a local MVD environment with the exception to use the profile `ui`. (See example below.)
    - In order to verify your local environment works properly, also follow section `Local Test Execution` in `system-tests/README.md` .
```
实际操作：
1. 为什么要checkout DataDashboard？是不是依赖？结合设定`MVD_UI_PATH`，算了，先checkout。
2. 第三步跑docker compose时候，报错，如下
![[../../../../../_assets/img/Pasted image 20240104165617.png]]
