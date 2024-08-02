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

# Prompt templates

Prompt存在的意义，将用户的输入能够模板化、参数化，同时进一步持久化、版本化。
两种类型，如下：
## StringPromptTemplates
针对输入是一个string时候的参数化问题
```python
from langchain_core.prompts import PromptTemplate

prompt_template = PromptTemplate.from_template("Tell me a joke about {topic}")

prompt_template.invoke({"topic": "cats"})
```

## ChatPromptTemplates
可以弄a list of messages，并且可以结合ChatModel当中的role。
```python
from langchain_core.prompts import ChatPromptTemplate

prompt_template = ChatPromptTemplate.from_messages([
    ("system", "You are a helpful assistant"),
    ("user", "Tell me a joke about {topic}")
])

prompt_template.invoke({"topic": "cats"})
```

### MessagesPlaceholder
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

