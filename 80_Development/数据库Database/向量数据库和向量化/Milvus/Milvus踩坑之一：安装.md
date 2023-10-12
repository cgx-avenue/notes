# Windows
需要利用**Docker for desktop**
参照的 [强大的向量数据库：Milvus - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/405186060) 
用的docker-compose方式，官网上用的k8s，我不想装k8s。
也安装了文中的可视化管理的docker image，这里用的是milvus-insight。（2023-10-12： milvus-insight已经貌似不能用了，官网更新成了Attu，下文会有提及）
为了装这个先装了Windows上的WSL2和Docker
![](imgs/2023-05-18-15-02-23.png)

# Ubuntu 20.04
Prerequisites: Docker
参照： https://milvus.io/docs/install_standalone-docker.md
按照官网下载Docker compose file之后，直接`sudo docker compose up -d` 运行。安装好后去portainer里把standalone，etcd和minio一起多重启几次，终于跑起来了。状态都是healthy的话也没关系，如下图。
![[imgs/Pasted image 20231012134616.png]]
## 注意
注意portainer里IP Address一栏里standalone 这个container的地址，如果使用Towhee、Attu等连接到


