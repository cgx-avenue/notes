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

# Output parsers
Again, more than formatting strings.
There are a few main types of `OutputParser`s, including:

- Convert text from `LLM` into structured information (e.g. JSON)
- Convert a `ChatMessage` into just a string
- Convert the extra information returned from a call besides the message (like OpenAI function invocation) into a string

# Composing with LCEL
the `|` syntax to join these components together.
```python
template = "Generate a list of 5 {text}.\n\n{format_instructions}"

chat_prompt = ChatPromptTemplate.from_template(template)
chat_prompt = chat_prompt.partial(format_instructions=output_parser.get_format_instructions())
chain = chat_prompt | chat_model | output_parser
chain.invoke({"text": "colors"})
# >> ['red', 'blue', 'green', 'yellow', 'orange']
```



