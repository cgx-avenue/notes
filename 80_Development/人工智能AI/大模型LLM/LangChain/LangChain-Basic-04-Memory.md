[[Beta] Memory | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/modules/memory/)
即如何在LLM应用当中存储一些information，特别是对话的历史。LangChain中把这些信息叫做Memory。目前Memory是Beta版本，原因有两个：
1. 大多数功能还不能用在生产环境下。
2. 大多数功能只能和legacy chain一起用，不能和LCEL一起。
有一个例外，是`ChatMessageHistory`，这个已经可以用在生产环境和LCEL中了。

![[imgs/Pasted image 20240704100747.png]]

任何memory系统都要支持两个功能：写入和读取。结合到LLM，如上图，
1. Prompt是由用户输入和memory中存储的之前的内容拼接而成，共同作为输入。
2. 执行完相关逻辑后，输出会添加到memory中。

## 使用
可以用在LLM和ChatModel中，调用方法基本一致，即初始化一个memory，完整代码如下

