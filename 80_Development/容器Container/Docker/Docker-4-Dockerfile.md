# 本质
分层构建docker image，每一行一条指令，每一条指令一个分层（新建）。
1. FROM 基础镜像or FROM scratch
2. RUN 执行命令
	注意写法，不要一条一个RUN，要用&& 连接。Dockerfile不等于写Shell脚本，而是在定义每一层该如何构建。
3. Docker build 
	注意上下文路径


# Refs
1. https://docs.docker.com/engine/reference/builder/
2. https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
3. https://docs.docker.com/get-started/02_our_app/