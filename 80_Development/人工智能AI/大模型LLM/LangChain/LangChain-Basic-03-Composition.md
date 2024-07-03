# Tools
Interface between components(LLM, agent, chain) and other systems. Examples: Wikipedia, calculator, Python REPL.


# Agents
From LangChain v0.1: Agents use a language model to decide actions to take, often defined by a tool. They require an `executor`, which is the runtime for the agent. The executor is what actually calls the agent, executes the tools it chooses, passes the action outputs back to the agent, and repeats. The agent is responsible for parsing output from the previous results and choosing the next steps.
For LangChain v0.2, please refer to `agentic approach` and LangGraph.



# Chains


