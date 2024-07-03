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
LangChain也说了Tools和OpenAI functions很像，而且可以转换。参见：https://python.langchain.com/v0.1/docs/modules/tools/tools_as_openai_functions/
## Builtin Tools
[Tools | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/integrations/tools/)
有这些，看看吧，有一些预置功能了相当于。比如：SQL database，bing和google的search

# Agents
From LangChain v0.1: Agents use a language model to decide actions to take, often defined by a tool. They require an `executor`, which is the runtime for the agent. The executor is what actually calls the agent, executes the tools it chooses, passes the action outputs back to the agent, and repeats. The agent is responsible for parsing output from the previous results and choosing the next steps.
For LangChain v0.2, please refer to `agentic approach` and LangGraph.



# Chains


