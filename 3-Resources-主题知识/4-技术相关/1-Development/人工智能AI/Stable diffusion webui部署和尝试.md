Date:        2023-10-09
update:    2023-11-02
# 部署环境
## Thinkpad X1 Extreme Gen3
![[../../../../_assets/img/Pasted image 20231009153101.png]]
![[../../../../_assets/img/Pasted image 20231009153138.png]]
显卡4GB显存，官方推荐6GB以上，这也导致了后面发生的一系列问题。

## Dell Tower 5820
鸟枪换炮，张总非常给力的升级了塔式工作站，显卡3090.
![[../../../../_assets/img/Pasted image 20231102134857.png]]
![[../../../../_assets/img/Pasted image 20231102134949.png]]



# Stable diffusion webui
## 官方
https://github.com/AUTOMATIC1111/stable-diffusion-webui
# 安装--我的成功步骤
重点参照Refs1

## 安装cuda
cuda其实在安装好nvidia的driver之后就有了，ubuntu里可以通过`nvidia-smi`查看，第一行：
![[../../../../_assets/img/Pasted image 20231009153723.png]]
T5820的图在上面。


## conda创建python环境

```bash
# use python 3.10.6 recommended by official git repo
conda create -n sdwebui python=3.10.6
# activate conda env
conda activate sdwebui
# upgrade pip and change pip source
python -m pip install --upgrade pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```

## 安装torch
torch的安装要手动，https://pytorch.org/get-started/locally/ 。因为我的cuda是12.0,所以选择如下之后，用图里生成的命令直接安装。
![[../../../../_assets/img/Pasted image 20231009155323.png]]
```bash
pip3 install torch torchvision torchaudio
```
## 安装stable-diffusion-webui
切换到当前用户目录下，使用git命令下载stable-diffusion-webui源码

```bash
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
```

### 安装
```bash
cd stable-diffusion-webui/
pip install -r requirements_versions.txt
pip install -r requirements.txt
```

**注意**
1. 上面的模型可能后面加载不了，那就在安装好stable-diffusion-webui之后重新下载模型，再copy到所需目录。
2. 安装那两个txt时候可能会不停出问题，多重复几次，搞不定的依赖就用aliyun的源手动安装。
3. 第一个txt文件安装时后，pip source这里有问题，后面有些依赖安装不上的时候（特别是`tb-nightly`和几个txt文件里的），需要手动切换到aliyun的。
```bash
pip install tb-nightly -i https://mirrors.aliyun.com/pypi/simple
```
参照：
1. https://www.fujieace.com/python/error-no-matching-distribution-found-for-tb-nightly.html
2. https://blog.csdn.net/lsb2002/article/details/131646853

### 下载模型
打开[v2-1_768-ema-pruned.ckpt · stabilityai/stable-diffusion-2-1 at main](https://huggingface.co/stabilityai/stable-diffusion-2-1/blob/main/v2-1_768-ema-pruned.ckpt)，下载训练模型。下载完成后，把v2-1_768-ema-pruned.ckpt这个训练模型放入stable-diffusion-webui的models/Stable-diffusion目录下，这个目录专门存放用于生成AI绘图的绘图元素的基础模型库。后续如果在其他网站比如civitai之类的地方下载的ckpt或者safetensors文件也是放在这个文件夹里面。
https://huggingface.co/stabilityai/stable-diffusion-2-1/blob/main/v2-1_768-ema-pruned.ckpt
![[../../../../_assets/img/Pasted image 20231009155613.png]]

# 启动
注意还是推荐参考1, 官方是推荐`webui.sh` 但是实际上这个要重新build一个python环境。
## X1EG3
由于我的显卡只有4G VRAM，所以我也只能用--lowvram（https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/7018），同时只能把精度降低，用--no-half和--disable-nan-check.
不用launch.py 是因为webui.sh里调用了launch.py.
不用webui-user.py是因为我这跑不起来（权限不够，懒得改了），同时webui.sh也接受命令行参数。反正跑起来了就是了。
```bash
# 用webui.sh
./webui.sh --lowvram --no-half --disable-nan-check
```
![[../../../../_assets/img/Pasted image 20231009160229.png]]

## T5820
参照的Refs1
```bash
python launch.py --no-half --disable-nan-check
```

# 初步使用感受
## Thinkpad X1EG3
### 只能生成512×512的图
一大了就out of memory。
### 生成图片的速度
如下，说快不快说慢不满
![[../../../../_assets/img/Pasted image 20231009161254.png]]
比较玄学的事不知道训练几次之后，也会out of memory。
### 例子
![[../../../../_assets/img/Pasted image 20231009161721.png]]


## T5820
爽，爽，爽，待我弄几个提示词学习之后再搞定。


# 一些坑和解决办法
1. https://zhuanlan.zhihu.com/p/610773810
2. https://www.krwoo.com/ai-hui-hua-jiao-cheng/stable-diffusion-sheng-cheng-chu-xian-cuo-wu-nansexception-a-tensor-with-all-nans-was-produced-in/

# 模型下载
1. https://civitai.com/



# Refs
1. https://blog.csdn.net/formaever/article/details/129649684
2. https://github.com/AUTOMATIC1111/stable-diffusion-webui