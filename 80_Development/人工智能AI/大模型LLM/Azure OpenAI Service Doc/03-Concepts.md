
# Customizing LLMs
There are several techniques for adapting a pre-trained language model to suit a specific task or domain. These include prompt engineering, RAG (Retrieval Augmented Generation), and fine-tuning. These three techniques are not mutually exclusive but are complementary methods that in combination can be applicable to a specific use case.
## Prompt engineering
This process utilizes in-context learning ([zero shot and few shot](https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/prompt-engineering#examples)) and, with iteration, improves accuracy and relevancy in responses, optimizing the performance of the model.
Things to consider:
1. starting point for genAI output
2. Craft clear instructions
3. Experiment and iterate

## RAG
[RAG (Retrieval Augmented Generation)](https://learn.microsoft.com/en-us/azure/ai-studio/concepts/retrieval-augmented-generation) is a method that integrates external data into a Large Language Model prompt to generate relevant responses.

Things to condiser:
- RAG helps ground AI output in real-world data and reduces the likelihood of fabrication.
    
- RAG is helpful when there is a need to answer questions based on private proprietary data.
    
- RAG is helpful when you might want questions answered that are recent (for example, before the cutoff date of when the [model version](https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/models) was last trained).

## Fine-tuning
[Fine-tuning](https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/fine-tuning), specifically [supervised fine-tuning](https://techcommunity.microsoft.com/t5/ai-azure-ai-services-blog/fine-tuning-now-available-with-azure-openai-service/ba-p/3954693?lightbox-message-images-3954693=516596iC5D02C785903595A) in this context, is an iterative process that adapts an existing large language model to a provided training set in order to improve performance, teach the model new skills, or reduce latency.

# Prompt engineering techniques
For Azure OpenAI GPT models, there are currently two distinct APIs where prompt engineering comes into play:

- Chat Completion API.
- Completion API.

The **Chat Completion API** supports the GPT-35-Turbo and GPT-4 models. These models are designed to take input formatted in a [specific chat-like transcript](https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/chatgpt) stored inside an array of dictionaries.

The **Completion API** supports the older GPT-3 models and has much more flexible input requirements in that it takes a string of text with no specific format rules.

## System message
The system message is included at the beginning of the prompt and is used to prime the model with context, instructions, or other information relevant to your use case. You can use the system message to describe the assistant’s personality, define what the model should and shouldn’t answer, and define the format of model responses.

## Few-shot learning
In few-shot learning, a set of training examples is provided as part of the prompt to give additional context to the model.

When using the Chat Completions API, a series of messages between the User and Assistant (written in the [new prompt format](https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/chatgpt?pivots=programming-language-chat-completions#few-shot-learning-with-chat-completion)), can serve as examples for few-shot learning.
![[imgs/Pasted image 20240613134831.png]]

## Start with clear instructions

## Repeat instructions at the end

## Prime the output
This refers to including a few words or phrases at the end of the prompt to obtain a model response that follows the desired form.

## Add clear syntax
Using clear syntax for your prompt—including punctuation, headings, and section markers—helps communicate intent and often makes outputs easier to parse.

## Break the task down
Large language models (LLMs) often perform better if the task is broken down into smaller steps.

## Use of affordances

## Chain of thought prompting
This is a variation on the **break the task down** technique. Instead of splitting a task into smaller steps, in this approach, the model response is instructed to proceed step-by-step and present all the steps involved. Doing so reduces the possibility of inaccuracy of outcomes and makes assessing the model response easier.

## Specifying the output structure

## Temperature and Top_p parameters
Top_probability is another parameter and is similar to Temperature in that it also controls the randomness of the model response, but it does so in a different way. 
The general recommendation is to alter one of these two parameters at a time, not both

## Provide grounding context
One of the most effective ways to provide reliable answers is to give the model data to draw its responses from (grounding data).

# Image prompt engineering techniques

## Fundamentals of crafting your image prompt
1. Contextual specificity
2. Task-oriented prompts
3. Handling refusals
4. Adding examples
5. Break down requests
6. Define output format

# System message templates
as a metaprompt or [system prompt](https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/advanced-prompt-engineering?pivots=programming-language-completions#meta-prompts) that can be used to guide an AI system’s behavior and improve system performance. However, it's important to remember that even when using these templates and guidance, you still need to validate the responses the models generate. Just because a carefully crafted system message worked well for a particular scenario doesn't necessarily mean it will work more broadly across other scenarios.

The LLM system message framework described here covers four concepts:

- Define the model’s profile, capabilities, and limitations for your scenario
- Define the model’s output format
- Provide examples to demonstrate the intended behavior of the model
- Provide additional behavioral guardrails

## Define the model’s profile, capabilities, and limitations for your scenario
1. Define the specific tasks
2. Define how the model should complete the tasks
3. Define the scope and limitations
4. Define the posture and tone

## Define the model's output format
1. Define the language and syntax
2. Define any styling or formatting

## Provide examples to demonstrate the intended behavior of the model
1. Describe difficult use cases
2. Show the potential "inner monologue" and chain-of-thought reasoning

## Define additional safety and behavioral guardrails


## Indirect prompt injection attacks
1. Spotlighting
2. 

