
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
## 执行k8s-for-docker-desktop的脚本
找个path放下面的git clone。
```shell
git clone https://github.com/AliyunContainerService/k8s-for-docker-desktop.git
```



# Refs
https://zhuanlan.zhihu.com/p/407560411