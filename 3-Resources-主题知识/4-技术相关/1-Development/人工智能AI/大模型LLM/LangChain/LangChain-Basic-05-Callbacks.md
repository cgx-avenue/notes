[Callbacks | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/modules/callbacks/)

LLM的不同生命周期当中的钩子，在LangChain中是`CallbackHandlers`， 具体的基类可以参见链接。
最基础的handler是`StdOutCallbackHandler`，会输出所有events的log。这个和在定义LLMChain时候设置`verbose=True`效果一致。
示例代码：
```python
from langchain_core.callbacks import StdOutCallbackHandler
from langchain.chains import LLMChain
from langchain_openai import OpenAI
from langchain_core.prompts import PromptTemplate

handler = StdOutCallbackHandler()
llm = OpenAI()
prompt = PromptTemplate.from_template("1 + {number} = ")

# Constructor callback: First, let's explicitly set the StdOutCallbackHandler when initializing our chain
chain = LLMChain(llm=llm, prompt=prompt, callbacks=[handler])
chain.invoke({"number":2})

# Use verbose flag: Then, let's use the `verbose` flag to achieve the same result
chain = LLMChain(llm=llm, prompt=prompt, verbose=True)
chain.invoke({"number":2})

# Request callbacks: Finally, let's use the request `callbacks` to achieve the same result
chain = LLMChain(llm=llm, prompt=prompt)
chain.invoke({"number":2}, {"callbacks":[handler]})

```
