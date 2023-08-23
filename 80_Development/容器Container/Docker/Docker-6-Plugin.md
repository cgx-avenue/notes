Docker plugin是从engine层面支持的，在Docker的安装目录里有plugin文件夹，docker从中发现新插件。

我换了下官网文档的顺序。

Docker的插件类型大概分为:
* Access authorization plugin
* Network driver plugin
* Volume plugin

Docker plugin本质上也是docker image，可以放在Docker hub或者私有仓库。
插件在本地安装后，可以被作为Docker操作的选项，比如network或者volume。

# Managed plugin system

## Install and use plugin
```bash
# install a plugin
docker plugin install plugin-name
# list installed plugin
docker plugin ls
# remove a pluin
docker volume rm plugin-name
```

## Develop a plugin
### rootfs 目录
`rootfs`目录代表的是plugin的根文件系统，是docker和插件文件系统通信的基础。下面的例子是官网的，我加了注释。
```bash
git clone https://github.com/vieux/docker-volume-sshfscd docker-volume-sshfs
# 先build成image
docker build -t rootfsimage .
# 建立container，获取container id
id=$(sudo docker create rootfsimage true) # id was cd851ce43a403 when the image was created
# 把container里的文件系统解压到这个目录里，再加上config.json就可以重新build新plugin了
sudo mkdir -p myplugin/rootfssudo docker export "$id" | sudo tar -x -C myplugin/rootfs
# 删掉container和image
docker rm -vf "$id"
docker rmi rootfsimage
```

### config.json 文件
The `config.json` file describes the plugin. See the [plugins config reference](https://docs.docker.com/engine/extend/config/).
里面放着描述插件细节和能力的选项。

### Create the plugin
A new plugin can be created by running `docker plugin create <plugin-name> ./path/to/plugin/data` where the plugin data contains a plugin configuration file `config.json` and a root filesystem in subdirectory `rootfs`.

After that the plugin `<plugin-name>` will show up in `docker plugin ls`. Plugins can be pushed to remote registries with `docker plugin push <plugin-name>`.

在rootfs目录的例子里，实际场景和操作如下：
![[imgs/Pasted image 20230823143312.png]]

## Debugging plugins
主要使用的是docker-runc等工具来显示logfiles，参见Refs1.

# Extending Docker Engine plugins
主要介绍有哪些plugin。

## 种类
* Authorization
* Volume
* Network driver

## 举例
参见Refs2.

## 写插件
see the [docker plugins reference](https://docs.docker.com/engine/extend/plugin_api/).

# Docker plugin API
## 什么是插件
运行在与Docker daemon相同或者不同的host的进程，在plugin目录里放置对应的文件。
插件通常都是小写字符串，比如`weave`。
插件可以在容器内或外运行，目前推荐在容器外。

## 插件发现
Docker通过寻找在插件目录里的对应文件来发现插件。
There are three types of files which can be put in the plugin directory.

- `.sock` files are UNIX domain sockets.
- `.spec` files are text files containing a URL, such as `unix:///other.sock` or `tcp://localhost:8080`.
- `.json` files are text files containing a full json specification for the plugin.

其他细节参见Refs3.

## 插件生命周期
插件在Docker启动前启动，在Docker停止后停止。
升级插件时，必须先停止Docker daemon，然后升级插件，再启动Docker。

## 插件激活



# Refs
1. https://docs.docker.com/engine/extend/
2. https://docs.docker.com/engine/extend/legacy_plugins/
3. https://docs.docker.com/engine/extend/config/
4. https://docs.docker.com/engine/extend/plugin_api/