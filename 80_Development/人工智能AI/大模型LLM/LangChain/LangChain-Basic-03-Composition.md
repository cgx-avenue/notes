# Tools
Interface between components(LLM, agent, chain) and other systems. Examples: Wikipedia, calculator, Python REPL.

我的理解tool就是function calling，连需要填写的内容都一样。
```txt
1. The name of the tool
2. A description of what the tool is
3. JSON schema of what the inputs to the tool are
4. The function to call
5. Whether the result of a tool should be returned directly to the user
```

## Tools as OpenAI functions
LangChain也说了Tools和OpenAI functions很像，而且可以转换。参见：https://python.langchain.com/v0.1/docs/modules/tools/tools_as_openai_functions/
类似于一句话：
```python
from langchain_core.utils.function_calling import convert_to_openai_function
tools = [MoveFileTool()]
functions = [convert_to_openai_function(t) for t in tools]
```

## tool的调用
tool可以单独调用，比如
```python
tool.run({"query": "langchain"})
```
## Builtin Tools
[Tools | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/integrations/tools/)
有这些，看看吧，有一些预置功能了相当于。比如：SQL database，bing和google的search，graphql等等。
Would be useful:
1. [Python REPL | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/integrations/tools/python/)
2. [GraphQL | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/integrations/tools/graphql/)
3. 
## Custom Tools
[Defining Custom Tools | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/modules/tools/custom_tools/)

### @tool decorator
最方便，直接使用一些约定俗成的东西
```python
@tool
def search(query: str) -> str:
    """Look up things online."""
    return "LangChain"
print(search.name)
print(search.description)
print(search.args)
```
也可以自定义tool name等等
```python
class SearchInput(BaseModel):
    query: str = Field(description="should be a search query")


@tool("search-tool", args_schema=SearchInput, return_direct=True)
def search(query: str) -> str:
    """Look up things online."""
    return "LangChain"
    
```

### Subclass BaseTool
继承BaseTool类，然后自定义
```python
from typing import Optional, Type

from langchain.callbacks.manager import (
    AsyncCallbackManagerForToolRun,
    CallbackManagerForToolRun,
)


class SearchInput(BaseModel):
    query: str = Field(description="should be a search query")


class CalculatorInput(BaseModel):
    a: int = Field(description="first number")
    b: int = Field(description="second number")


class CustomSearchTool(BaseTool):
    name = "custom_search"
    description = "useful for when you need to answer questions about current events"
    args_schema: Type[BaseModel] = SearchInput

    def _run(
        self, query: str, run_manager: Optional[CallbackManagerForToolRun] = None
    ) -> str:
        """Use the tool."""
        return "LangChain"

    async def _arun(
        self, query: str, run_manager: Optional[AsyncCallbackManagerForToolRun] = None
    ) -> str:
        """Use the tool asynchronously."""
        raise NotImplementedError("custom_search does not support async")


class CustomCalculatorTool(BaseTool):
    name = "Calculator"
    description = "useful for when you need to answer questions about math"
    args_schema: Type[BaseModel] = CalculatorInput
    return_direct: bool = True

    def _run(
        self, a: int, b: int, run_manager: Optional[CallbackManagerForToolRun] = None
    ) -> str:
        """Use the tool."""
        return a * b

    async def _arun(
        self,
        a: int,
        b: int,
        run_manager: Optional[AsyncCallbackManagerForToolRun] = None,
    ) -> str:
        """Use the tool asynchronously."""
        raise NotImplementedError("Calculator does not support async")

```

### StructuredTool dataclass
mix of above 2 methods
```python
def search_function(query: str):
    return "LangChain"


search = StructuredTool.from_function(
    func=search_function,
    name="Search",
    description="useful for when you need to answer questions about current events",
    # coroutine= ... <- you can specify an async method if desired as well
)
```

### Handling tool errors
see the doc if needed

## Toolkits
就是为了某个共同的目的，可以一起使用的一组tool。一般是给agent用的，不会单独使用。
```python
# Initialize a toolkit
toolkit = ExampleTookit(...)

# Get list of tools
tools = toolkit.get_tools()

# Create agent
agent = create_agent_method(llm, tools, prompt)
```

## Builtin Toolkits
[Toolkits | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/integrations/toolkits/)
可能有用的：
1. [CSV | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/integrations/toolkits/csv/)，这个在demo里用到了
2. [JSON | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/integrations/toolkits/json/)
3. [Pandas Dataframe | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/integrations/toolkits/pandas/)
4. [Python | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/integrations/toolkits/python/)， would be useful to run python code
5. [SQL Database | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/integrations/toolkits/sql_database/)
6. 

# Agents
From LangChain v0.1: Agents use a language model to decide actions to take, often defined by a tool. They require an `executor`, which is the runtime for the agent. The executor is what actually calls the agent, executes the tools it chooses, passes the action outputs back to the agent, and repeats. The agent is responsible for parsing output from the previous results and choosing the next steps.
For LangChain v0.2, please refer to `agentic approach` and LangGraph.

这个文档里就记录v0.1版本的吧，agentic等着放到其他文档或者参见LangGraph。

## vs. Chain
Chain里执行顺序是固定的，hardcoded in code，agents使用toolkits只限定范围，由LLM确定用哪个以及顺序。




# Chains


