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

## 更新
我用的手动更新，没有用watchtower，后者我运行了，但是每反应。后来发现可能是docker pull image太大了。
https://docs.openwebui.com/getting-started/updating
Follow these steps to manually update your Open WebUI:

1. **Pull the Latest Docker Image**:
    
    ```
    sudo docker pull ghcr.io/open-webui/open-webui:main
    ```
    
2. **Stop and Remove the Existing Container**:
    
    - This step ensures that you can create a new container from the updated image.
    
    ```
    sudo docker stop open-webui
    sudo docker rm open-webui
    ```
    
3. **Create a New Container with the Updated Image**:
需要和之前开启时候用到的命令一样，也就是上面的命令。
```shell
sudo docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```


## 搜索引擎
https://docs.openwebui.com/tutorial/web_search
添加的是searxng，原理是本地部署一个searxng的聚合搜索网站，然后openwebui去掉用。
我用的是step3 alternatice: Docker run，端口改成了8087，即http://localhost:8087
其余的配置和图4里一样，但是与到了403错误，查询之后参照https://github.com/searxng/searxng/issues/1162，定位到是searxng的配置文件没有配置输出为json格式，再经过一点点debug，发现 searxng的配置文件就在我pull docker image时候的路径下的searxng文件夹里，也就是`~/searxng`，修改里面的`settings.yml`, 在-formats里增加 - json，如下
![[imgs/Pasted image 20240614153101.png]]

修改后重启镜像即可。
searxng文档：
https://docs.searxng.org/admin/installation-docker.html

最终效果：
![[imgs/Pasted image 20240614153242.png]]





# 中文模型
https://github.com/LlamaFamily/Llama-Chinese#%E5%BF%AB%E9%80%9F%E4%B8%8A%E6%89%8B-%E4%BD%BF%E7%94%A8ollama%E8%BF%90%E8%A1%8C
用下面的命令pull模型
```shell
ollama pull llamafamily/llama3-chinese-8b-instruct
```

pull之后就可以在openwebui里选择和使用了

还有一个模型，没有尝试
https://github.com/CrazyBoyM/llama3-Chinese-chat




# Refs
1. https://github.com/ollama/ollama
2. https://blog.csdn.net/WMX843230304WMX/article/details/136769341
3. https://docs.openwebui.com/
4. https://sspai.com/post/85193#!
5. 