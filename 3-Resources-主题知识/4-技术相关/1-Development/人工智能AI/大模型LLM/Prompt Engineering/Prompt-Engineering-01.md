# 原则
1. 编写清晰、具体的指令
2. 给予模型充足的思考时间
3. 越长越好

## Best practices

- **Be Specific**. Leave as little to interpretation as possible. Restrict the operational space.
- **Be Descriptive**. Use analogies.
- **Double Down**. Sometimes you might need to repeat yourself to the model. Give instructions before and after your primary content, use an instruction and a cue, etc.
- **Order Matters**. The order in which you present information to the model might impact the output. Whether you put instructions before your content (“summarize the following…”) or after (“summarize the above…”) can make a difference in output. Even the order of few-shot examples can matter. This is referred to as recency bias.
- **Give the model an “out”**. It can sometimes be helpful to give the model an alternative path if it is unable to complete the assigned task. For example, when asking a question over a piece of text you might include something like "respond with "not found" if the answer is not present." This can help the model avoid generating false responses.


## Space efficiency
Given this limited space, it is important to use it as efficiently as possible.

- Tables – As shown in the examples in the previous section, GPT models can understand tabular formatted data quite easily. This can be a space efficient way to include data, rather than preceding every field with name (such as with JSON).
- White Space – Consecutive whitespaces are treated as separate tokens which can be an easy way to waste space. Spaces preceding a word, on the other hand, are typically treated as part of the same token as the word. Carefully watch your usage of whitespace and don’t use punctuation when a space alone will do.



- [Introduction to prompt engineering](https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/prompt-engineering)
- [Prompt engineering techniques](https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/advanced-prompt-engineering)
- [15 tips to become a better prompt engineer for generative AI](https://techcommunity.microsoft.com/t5/ai-azure-ai-services-blog/15-tips-to-become-a-better-prompt-engineer-for-generative-ai/ba-p/3882935)
- [The basics of prompt engineering (video)](https://www.youtube.com/watch?v=e7w6QV1NX1c)




