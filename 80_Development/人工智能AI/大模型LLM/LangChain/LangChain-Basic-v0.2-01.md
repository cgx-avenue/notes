# Runnable interface
Runnable interface is the key behind LCEL, many LangChain components implement the `Runnable` protocol, including chat models, LLMs, output parsers, retrievers, prompt templates, and more.
Standard interface:
- `stream`: stream back chunks of the response
- `invoke`: call the chain on an input
- `batch`: call the chain on a list of inputs

These also have corresponding async methods that should be used with [asyncio](https://docs.python.org/3/library/asyncio.html) `await` syntax for concurrency:

- `astream`: stream back chunks of the response async
- `ainvoke`: call the chain on an input async
- `abatch`: call the chain on a list of inputs async
- `astream_log`: stream back intermediate steps as they happen, in addition to the final response
- `astream_events`: **beta** stream events as they happen in the chain (introduced in `langchain-core` 0.1.14)

![[imgs/Pasted image 20240801150556.png]]
重点看前五个，我还是通过代码才看出来Retriever的结果都是Documents object。。。

All runnables expose input and output **schemas** to inspect the inputs and outputs:

- `input_schema`: an input Pydantic model auto-generated from the structure of the Runnable
- `output_schema`: an output Pydantic model auto-generated from the structure of the Runnable

# Components

## Chat models

比LLM更新的模型，添加了role什么的来更好地应用，比如用户输入的string会变为`HumanMessage` 。

注意ChatModels可以有一些参数，其中可能会很有用，比如：
- `model`: the name of the model
- `temperature`: the sampling temperature
- `timeout`: request timeout
- `max_tokens`: max tokens to generate
- `stop`: default stop sequences
- `max_retries`: max number of times to retry requests
- `api_key`: API key for the model provider
- `base_url`: endpoint to send requests to

## LLMs
老版本模型封装。采用`String in, string out`方式，但也可以用`messages`作为输入，以兼容ChatModel。

## Messages
所有`message`三个重要组成部分：`role`,`content`,`response_metadata`。
种类：
1. HumanMessage：用户的输入
2. AIMessage：model返回的信息，除了`content`之外，还有：
	1. response_metadata：response的一些元信息
	2. tool_calls：模型调用的tool信息，返回内容包含在了AIMessage里。可以使用`.tool_calls`来获取。
3. SystemMessage：控制模型如何表现的输入，不是所有模型都支持。
4. ToolMessage：tool调用的结果信息，除了`role`和`content`之外，还包括
	1. tool_call_id
	2. artifact：可以附加传递给模型的东西

## Prompt templates

Prompt存在的意义，将用户的输入能够模板化、参数化，同时进一步持久化、版本化。
两种类型，如下：
### StringPromptTemplates
针对输入是一个string时候的参数化问题
```python
from langchain_core.prompts import PromptTemplate

prompt_template = PromptTemplate.from_template("Tell me a joke about {topic}")

prompt_template.invoke({"topic": "cats"})
```

### ChatPromptTemplates
可以弄a list of messages，并且可以结合ChatModel当中的role。
```python
from langchain_core.prompts import ChatPromptTemplate

prompt_template = ChatPromptTemplate.from_messages([
    ("system", "You are a helpful assistant"),
    ("user", "Tell me a joke about {topic}")
])

prompt_template.invoke({"topic": "cats"})
```

#### MessagesPlaceholder
可以和HumanMessage结合，实现一系列输入的传递。
```python
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from langchain_core.messages import HumanMessage

prompt_template = ChatPromptTemplate.from_messages([
    ("system", "You are a helpful assistant"),
    MessagesPlaceholder("msgs")
])

prompt_template.invoke({"msgs": [HumanMessage(content="hi!")]})
```
也可以如下显式传递，不用MessagePlaceholder
```python
prompt_template = ChatPromptTemplate.from_messages([
    ("system", "You are a helpful assistant"),
    ("placeholder", "{msgs}") # <-- This is the changed part
])
```

## Output parsers
把LCEL中的输出变成指定格式，注意是否支持streaming，是否需要指示，输入输出格式等等。
支持：JSON，XML，CSV，DataFrame等，具体参见[Conceptual guide | 🦜️🔗 LangChain](https://python.langchain.com/v0.2/docs/concepts/#output-parsers)

## ChatHistory
Keep track of inputs and outputs of underlying chain, and append them as messages to a message database.

## Document
Document object包含两个属性：
1. page_content: str. 
2. metadata: dict. 包括document id，file name等

### Document loaders
就是针对不同文件类型，数据源的加载器。不同的加载器参数不同，参见各自文档。

### Text splitters
数据源被加载之后，文档会被切割、重组和其他操作。但核心问题：如何切割到合适大小，同时保证chunk之内语义相关联，chunk之间相互略微独立。

步骤：
1. 尽可能小的切割，但语义上看有意义（比如句子）。
2. 把小chunk们组合到适当大小。
3. 一个chunk完成，就开始组建下一个，但要在相邻chunk间保持一些overlap。

### Embedding models
把上面提到的这些或大或小的text进行向量化，根据不同的模型。LangChain里面使用`Embedding`类来实现的。这个类里实现两类：
1. 针对documents，这类multiple texts input。
2. 针对query这种string。

### Vector stores
对于非结构化数据，先对其向量化，然后存到向量化数据库，然后在对其进行查询，完成‘相似度’等功能，是常用套路。
大多数向量存储也能存储metadata，可以在‘相似度’检测前先进行metadata匹配和检索。

### Retriever
输入：非结构化query
输出：documents

可以从多种类型中返回documents，不局限于vector store。

### Key-value stores
LangChain提供了`BaseStores` 类来进行扩展。

## Tools

Tools是用来被模型调用的：他们的输入由模型产生，输出被传递回模型。Tools被用来调用外部API。

Tool包括：
1. name
2. description
3. 定义tool input的JSON schema
4. 一个函数

当tool被绑定到llm时候，上述的前三个会变成模型上下文。tool的一般调用方式如下：
```python
tools = [...] # Define a list of tools
llm_with_tools = llm.bind_tools(tools)
ai_msg = llm_with_tools.invoke("do xyz...")  # AIMessage(tool_calls=[ToolCall(...), ...], ...)
```






