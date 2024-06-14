# 安装
1. Linux安装
```shell
curl -fsSL https://ollama.com/install.sh | sh
```
![[imgs/Pasted image 20240426094927.png]]
2. 下载模型
```shell
ollama run llama3
```
默认是8B参数的，如果是70B的太大了。不行，我得试试70B的，不就是40GB吗，咱不缺。
![[imgs/Pasted image 20240426100607.png]]

![[imgs/Pasted image 20240426125718.png]]
但是运行70B模型机器缓慢。。。放弃了

3. 运行
运行完上面的指令，就可以在本地的shell里使用了。其本质实在11434端口开了个服务。
如果ollama没跑起来，运行下面的指令
```shell
ollama serve
```
4. 其它命令
下载模型用`ollama pull modelname`
```shell
ollama pull llama3:70b
```

# ollama-webui
docker运行，注意本地跑得llama，所以
```shell
sudo docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```
然后访问本地的8080端口即可。

# 中文模型
https://github.com/LlamaFamily/Llama-Chinese#%E5%BF%AB%E9%80%9F%E4%B8%8A%E6%89%8B-%E4%BD%BF%E7%94%A8ollama%E8%BF%90%E8%A1%8C
用下面的命令pull模型
```shell
ollama run llamafamily/llama3-chinese-8b-instruct
```


还有一个模型，没有尝试
https://github.com/CrazyBoyM/llama3-Chinese-chat




# Refs
1. https://github.com/ollama/ollama
2. https://blog.csdn.net/WMX843230304WMX/article/details/136769341
3. https://docs.openwebui.com/
4. https://sspai.com/post/85193#!