
# 1. 安装WLS2和Ubuntu
[[Windows10工作环境搭建]]
[[WSL2]]
# 2. Docker desktop for WSL2
从docker官网下载并安装完成后，打开docker desktop，选择setting->General，确保Use the WSL 2 based engine选项被勾选，然后选择右下角Apply&Restart。
![](imgs/2023-07-13-15-26-23.png)
重启docker desktop后，再次打开设置，确保setting->Resources->WSL INTEGRATION选项页中你的WSL发行版被勾选。
![](imgs/2023-07-13-15-26-48.png)
完成以上步骤之后，打开你的wsl, 输入docker
![](imgs/2023-07-13-15-27-04.png)
出现这一堆说明安装成功。（如果不成功就重启ubuntu，或者重启docker desktop）
# 3. k8s for docker desktop
安装了docker desktop后，可以通过setting->Kubernetes，勾选Enable Kubernetes来为你的wsl提供k8s服务，但由于网络问题，通常不可能成功。
## 先换源（我挂的代理）
打开setting->Docker Engine，将右侧配置文件改为：
```json
{
  "registry-mirrors": [
    "https://docker.mirrors.ustc.edu.cn",
    "https://registry.docker-cn.com"
  ],
  "insecure-registries": [],
  "debug": false,
  "experimental": false,
  "features": {
    "buildkit": true
  }
}
```
![](imgs/2023-07-13-15-31-09.png)
Apply&Restart，重启docker desktop。
换源之后其实也不成功，这时候docker desktop左下角的图标是红色的。但是没关系，继续往下走。
## 执行k8s-for-docker-desktop的脚本
找个path放下面的git clone。
```shell
git clone https://github.com/AliyunContainerService/k8s-for-docker-desktop.git
```
> 注意：这里需要保持k8s-for-docker-desktop和docker desktop里的k8s版本要一致。一般我们都是直接最新的，所以应该是一致的。不一致的话参照refs里第一个。

在当前目录下执行：
```shell
.\load_images.ps1
```

> 如果因为安全策略无法执行 PowerShell 脚本，请在 “以管理员身份运行” 的 PowerShell 中执行 Set-ExecutionPolicy RemoteSigned 命令
或者你也可以在WSL内部切换到这个目录执行load_images.sh

最后一步，setting->Kubernetes 确保Enable Kubernetes被勾选，然后Apply&Restart，这时候你的docker desktop左下角会出现k8s的图标，并逐渐从黄色变成绿色，代表你的k8s环境启动成功。
如果不成功的话，点击setting->Kubernetes->Reset Kubernetes Cluster, 至少我是这么搞了才成功的。
![](imgs/2023-07-13-15-40-41.png)

# 安装helm


# Refs
https://zhuanlan.zhihu.com/p/407560411