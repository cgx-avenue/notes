[Model I/O | 🦜️🔗 LangChain](https://python.langchain.com/v0.1/docs/modules/model_io/)
![[imgs/Pasted image 20240703135736.png]]
# ChatModels vs. LLM
## ChatModels
input: list of chat message
output: AI Message

## LLM
input: string
output: string completion

```python
from langchain_core.messages import HumanMessage

text = "What would be a good company name for a company that makes colorful socks?"
messages = [HumanMessage(content=text)]

llm.invoke(text)
# >> Feetful of Fun

chat_model.invoke(messages)
# >> AIMessage(content="Socks O'Color")
```

