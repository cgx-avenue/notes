# ~~milvus-insight
已弃用

# Attu
https://github.com/zilliztech/attu
## 踩坑过程
千万别用下面的这个！！！官方教程里只有一个命令：
```bash
docker run -p 8000:3000 -e MILVUS_URL={milvus server IP}:19530 zilliz/attu:v2.3.1
```
安装好后，可以用`http://{ Attu IP }:8000`打开，注意这里`Attu IP`用的是172开头的ip才可以。
但是打开后怎么也连不上本机的Milvus，要么`no connection`，要么`Milvus not ready`，虽然官网里说了这么一句：
> Note that "127.0.0.1" or "localhost" will not work when running Attu on Docker.

但是换成本机真实IP也还是不行，所以我就猜应该也是要用Docker network里的172开头的地址。但Attu的container就需要