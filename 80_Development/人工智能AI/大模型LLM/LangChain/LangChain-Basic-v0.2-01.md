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


