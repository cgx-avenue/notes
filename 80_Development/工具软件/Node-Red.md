#node-red #iot #流处理 #flow-control
官网： https://nodered.org/
# 初步接触感受
1. 全平台安装，依赖于node，甚至可以安装在树莓派上。但在我的树莓派3B上性能不够，官网推荐的也是树莓派4.
2. 流控制的理念非常好用，容易理解。组件类型非常多，还可以通过插件扩展，兼容诸如home assistant等。把小米的通过插件形式安装后，非常好用。所以通过与ha等智能家居的组合，居然达到了意想不到的效果。看得我真是跃跃欲试。
3. 居然是IBM在2013年才推出的，新的东西推广和使用是越来越快了。

# 安装
用的是docker，这样可以避开node.js的安装和版本问题，推荐。
```sh
sudo docker run -it -p 1880:1880 --name mynodered nodered/node-red
```

# 概念
https://nodered.org/docs/user-guide/concepts
## 流
输入->处理->输出
## 插件
![](imgs/2023-02-16-16-16-33.png)

## 部署deploy
任何对节点的修改，都应该点击部署。
目前我对部署的理解类似于：commit + deploy。点了部署才能开始真正用。
