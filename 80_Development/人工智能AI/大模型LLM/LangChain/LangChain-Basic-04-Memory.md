即如何在LLM应用当中存储一些information，特别是对话的历史。LangChain中把这些信息叫做Memory。目前Memory是Beta版本，原因有两个：
1. 大多数功能还不能用在生产环境下。
2. 大多数功能只能和legacy chain一起用，不能和LCEL一起。
有一个例外，是`ChatMessageHistory`，这个已经可以用在生产环境和LCEL中了。

![[imgs/Pasted image 20240704100747.png]]





