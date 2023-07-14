# JDK
## windows
[(43条消息) JDK18下载、安装和环境配置教程（Windows）_自信的阿星的博客-CSDN博客](https://blog.csdn.net/qq_32972847/article/details/126511645)
JDK的安装，主要是配置JAVA_HOME和CLASSPATH环境变量，同时把JDK\\bin加入到PATH环境变量。
## ubuntu
直接安装openjdk，版本需要确定下，命名格式类似于openjdk-17-jdk。
```bash
apt search openjdk-17-jdk
sudo apt install openjdk-17-jdk
```
# Gradle
## windows
[Gradle安装与配置教程 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/626806226)
配置GRADLE_HOME和添加GRADLE_HOME\\bin到PATH。
还需要更换国内源，也参照上面链接。
## ubuntu
[Gradle Distributions](https://services.gradle.org/distributions/)
[如何在Ubuntu 20.04安装Gradle | myfreax](https://www.myfreax.com/how-to-install-gradle-on-ubuntu-20-04/)
用的是bin.zip,里面有win也有linux的启动脚本。

