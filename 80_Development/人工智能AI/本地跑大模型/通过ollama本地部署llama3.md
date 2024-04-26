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
3. 运行
运行完上面的指令，就可以在本地的shell里使用了。其本质实在11434端口开了个服务。
如果ollama没跑起来，运行下面的指令
```shell
ollama serve
```

# ollama-webui
docker运行，注意本地跑得llama，所以
```shell
sudo docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```
然后访问本地的8080端口即可。

# Refs
1. https://github.com/ollama/ollama
2. 