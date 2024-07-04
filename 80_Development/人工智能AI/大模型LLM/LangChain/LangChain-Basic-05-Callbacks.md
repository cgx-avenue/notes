[Callbacks | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/modules/callbacks/)

LLM的不同生命周期当中的钩子，在LangChain中是`CallbackHandlers`， 具体的基类可以参见链接。
最基础的handler是`StdOutCallbackHandler`，会输出所有events的log。这个和在定义LLMChain时候设置verbose
