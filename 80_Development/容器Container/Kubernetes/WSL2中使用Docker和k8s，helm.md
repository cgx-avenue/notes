https://zhuanlan.zhihu.com/p/407560411
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
出现这一堆说明安装成功。


