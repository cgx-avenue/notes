来自微软：https://github.com/microsoft/autogen，文档地址：https://microsoft.github.io/autogen/0.2/docs/Getting-Started/。 0.4版本的是preview。
对话式agent。

# 安装
```shell
# create env
conda create -n autogen python=3.10
conda activate autogen
# install autogen-agentchat
pip install autogen-agentchat~=0.2
# install autogenstudio
pip install autogenstudio
# start autogen studio
autogenstudio ui --port 12345 --host 0.0.0.0
# visit http://localhost:12345 in broswer
```

## autogenstudio设置
参见https://microsoft.github.io/autogen/0.2/blog/2023/12/01/AutoGenStudio/

1. models里我用的qwen-turbo
![[../../../../../../_assets/img/Pasted image 20241030145231.png]]
2. agents里修改每个agent的models，改成qwen

# 概念
参见官方文档和参考4
主要是对话式agent，代码执行器和工具tool。代码执行可以分为local和docker环境。tool工具可以自定义，并且绑定。
因为是对话式，所以有group chat的方式。当然支持人机交互。

# 架构




# 使用



# 参考
1. https://microsoft.github.io/autogen/0.2/docs/Getting-Started/
2. https://blog.csdn.net/wshzd/article/details/135959061
3. https://hingsli.github.io/gen-ai-wiki/posts/autogen-getting-started/
4. https://zhuanlan.zhihu.com/p/664937747