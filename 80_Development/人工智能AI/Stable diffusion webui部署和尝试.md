Date： 2023-10-09
# 部署环境
Thinkpad X1 Extreme Gen3
![[imgs/Pasted image 20231009153101.png]]
![[imgs/Pasted image 20231009153138.png]]
显卡4GB显存，官方推荐6GB以上，这也导致了后面发生的一系列问题。

# Stable diffusion webui
## 官方
https://github.com/AUTOMATIC1111/stable-diffusion-webui
# 安装
参照了：
* https://blog.csdn.net/formaever/article/details/129649684
* https://github.com/AUTOMATIC1111/stable-diffusion-webui
## 我的成功步骤
### 安装cuda
ubuntu里可以通过`nvidia-smi`查看，我之前已经安装过了cuda，显示如下：
![[imgs/Pasted image 20231009153723.png]]
## conda创建python环境
