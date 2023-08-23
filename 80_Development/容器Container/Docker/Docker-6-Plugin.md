Docker plugin是从engine层面支持的，在Docker的安装目录里有plugin文件夹，docker从中发现新插件。

Docker的插件类型大概分为:
* Access authorization plugin
* Network driver plugin
* Volume plugin

Docker plugin本质上也是docker image，可以放在Docker hub或者私有仓库。
插件在本地安装后，可以被作为Docker操作的选项，比如network或者volume。

# Managed plugin system

## install and use plugin
```bash
# install a plugin
docker plugin install plugin-name
# list installed plugin
docker plugin ls
# remove a pluin
docker volume rm plugin-name
```

## develop a plugin
### rootfs 目录
`rootfs`目录代表的是plugin的根文件系统，是docker和插件文件系统通信的基础。下面的例子是官网的，我加了注释。
```bash
git clone https://github.com/vieux/docker-volume-sshfscd docker-volume-sshfs
# 先build成image
docker build -t rootfsimage .
# 建立container，获取container id
id=$(sudo docker create rootfsimage true) # id was cd851ce43a403 when the image was created

sudo mkdir -p myplugin/rootfssudo docker export "$id" | sudo tar -x -C myplugin/rootfs
docker rm -vf "$id"
docker rmi rootfsimage
```

# Refs
1. https://docs.docker.com/engine/extend/
2. 