https://blog.csdn.net/Magician0619/article/details/118527949
https://prometheus.io/docs/guides/node-exporter/#installing-and-running-the-node-exporter
× https://cloud.tencent.com/developer/article/2277441
https://blog.csdn.net/dragonQuncle/article/details/133983718


# prometheus安装
坑就是需要按上面第三行，前面有x的方式设立成systemd开机启动。
## node_exporter
树莓派本来想装一个，但是出错了，不知道为啥，哦，架构问题，不是amd64. 算了，不care了。

# grafana里添加prometheus
注意prometheus数据源的ip地址，比如说我这里grafana用的docker，那么prometheus的地址就不能用localhost:9090，因为localhost这里指的不是宿主机，而是docker内部。但是prometheus是装在宿主机环境里的。