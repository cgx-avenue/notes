# Ubuntu Wi-Fi 无线网络问题
买的绿联的usb无线网卡AC1300（https://www.lulian.cn/download/65-cn.html），网卡芯片型号8812au，github上有相关的驱动。
https://github.com/morrownr/8812au-20210629
下载之后运行里面的install-driver.sh
每次没了也重新运行这个即可。

# grafana
用户名 admin
密码 siemens

# jupyter lab 安装
## 原因
这么多年来一直使用的是vs code的自带集成jupyter notebook（90%），或者是原生jupyter notebook，但基本没怎么用过jupyter lab。现在有了强劲的tower+zerotier，决定装一个jupyter lab开个服务。同时也可以异地办公。
根本原因是vs code自带的不是完全版的，很多库并不支持（比如pyecharts）。jupyter lab也自成生态，值得一试。
## 步骤
1. 安装jupyter lab
一步就可以搞定，参照官网即可。
2. 配置jupyter lab
	1. 生成配置文件，开启远程，开机运行等https://www.cnblogs.com/Tsingwaa/articles/14681660.html
	2. 安装各种插件等。https://www.cnblogs.com/ccsvip/p/17926245.html 这里有个坑，我装的jupyter lab是4.x版本，很多插件已经自动集成了。这个可以通过插件的github仓库的说明一类的获取到信息。
3. 使用和尝试。比如测试一下git好用不好用之类的。

