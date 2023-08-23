Docker plugin是从engine层面支持的，在Docker的安装目录里有plugin文件夹，docker从中发现新插件。

Docker的插件类型大概分为:
* Access authorization plugin
* Network driver plugin
* Volume plugin

Docker plugin本质上也是docker image，可以放在Docker hub或者私有仓库。
插件在本地安装后，可以
# Managed plugin system

## install and use plugin

