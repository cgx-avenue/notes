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
### conda创建python环境
```bash
conda create -n sdwebui python==3.10.9
# activate conda env
conda activate sdwebui
# upgrade pip and change pip source
python -m pip install --upgrade pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```
#### 注意
1. pip source这里有问题，后面有些依赖安装不上的时候（特别是`tb-nightly`和几个txt文件里的），需要手动切换到aliyun的。
```bash
pip install -i tb-nightly https://mirrors.aliyun.com/pypi/simple
```
参照：https://www.fujieace.com/python/error-no-matching-distribution-found-for-tb-nightly.html 
2. torch的安装要手动，https://pytorch.org/get-started/locally/ 。因为我的cuda是12.0,所以选择如下之后，用图里生成的命令直接安装。
![[imgs/Pasted image 20231009155323.png]]



