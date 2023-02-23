#wget #curl #deb #rpm #apt #源码包
https://blog.csdn.net/weixin_44614230/article/details/127577130

# wget
wget是Linux提供的`在线下载工具`，可以理解为Windows中的迅雷，一般是用作`源码包的下载`，完成后还需要用户编译安装。只会下载文件，不做其他操作

# curl
https://cloud.tencent.com/developer/news/112323
支持更多的协议，比如http，https，ftp等，所以可以被封装起来作为其他工具的底层。

wget是个专职的下载利器，简单，专一，极致；而curl可以下载，但是长项不在于下载，而在于模拟提交web数据，POST/GET请求，调试网页，等等。在下载上，也各有所长，wget可以递归，支持断点；而curl支持URL中加入变量，因此可以批量下载。个人用途上，我经常用wget来下载文件，加 -c选项不怕断网；使用curl 来跟网站的API 交互，简便清晰。
