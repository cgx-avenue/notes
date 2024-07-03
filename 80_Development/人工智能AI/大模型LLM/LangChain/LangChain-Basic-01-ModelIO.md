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

# Prompt Templates
More than just formatting string. Chat prompts could include roles.
```python
from langchain_core.prompts.chat import ChatPromptTemplate

template = "You are a helpful assistant that translates {input_language} to {output_language}."
human_template = "{text}"

chat_prompt = ChatPromptTemplate.from_messages([
    ("system", template),
    ("human", human_template),
])

chat_prompt.format_messages(input_language="English", output_language="French", text="I love programming.")
```


