[补全Completion – OpenAI接口文档中文版 (openaidoc.com.cn)](https://www.openaidoc.com.cn/docs/guides/completion)

# Completion
## 提示词设计 (Prompt design)
### 基础 Basics
创建提示三原则：
1. 提供示例或者指令
2. 提供优质数据
3. 检查你的设置 （温度和top_k)

### 对话
尽管它看起来很简单，但有几件事值得关注：

- **我们告诉API意图，但也告诉它如何行动。**
- **我们赋予API身份**
### 限制API捏造答案的可能性
- **为API提供基础事实。**

如果你为API提供了一个文本体来回答问题（如维基百科条目），它就不太可能捏造一个回答。

- **使用较低的概率（probability），并展示给API如何表达“我不知道”。**

如果API理解，在不太确定答案的情况下，说“我不知道”或某种变体是合适的，它就不太可能编造答案。

## 聊天指南 chat guide
[对话任务 Beta – OpenAI接口文档中文版 (openaidoc.com.cn)](https://www.openaidoc.com.cn/docs/guides/chat)
```python
 # Note: you need to be using OpenAI Python v0.27.0 for the code below to work
 import openai
 
    openai.ChatCompletion.create(
     model="gpt-3.5-turbo",
   messages=[
     {"role": "system", "content": "You are a helpful assistant."},
  {"role": "user", "content": "Who won the world series in 2020?"},
  {"role": "assistant", "content": "The Los Angeles Dodgers won the World Series in 2020."},
  {"role": "user", "content": "Where was it played?"}
     ]
    )
```
注意： 
1. 上面是chatcompletion接口
2. message里面的role和content，role=system类似于系统设置，后面交替是user和assistant
3. 通常情况下，`gpt-3.5-turbo-0301`不会高度关注系统消息，因此重要的指令通常最好放在用户消息中。

## 图像指南 Images Guide
DALL E相关的接口`openai.Image`,下面还有一些子接口。

## 微调指南 Fine-tuning guide
### 原理
只有一些例子的提示情况下，它通常可以直观地了解您试图执行的任务并生成一个合理的完成（completion）。这通常被称为"few-shot learning"。
**一旦模型被微调，您将不需要再在提示中提供例子。**
### 模型
目前仅以下基础模型可以进行微调：`davinci`、`curie`、`babbage`和`ada`。这些是没有任何后续指令的原始模型（例如，`text-davinci-003`就是这样的）。您还可以[从微调模型继续微调](https://www.openaidoc.com.cn/docs/guides/fine-tuning/continue-fine-tuning-from-a-fine-tuned-model)，以添加其他数据而无需从头开始。
### 数据
您的数据必须是[JSONL(opens in a new tab)](https://jsonlines.org/)文档，其中每一行是与训练示例对应的提示完成（completion）对。

您可以使用我们的[CLI数据准备工具](https://www.openaidoc.com.cn/docs/guides/fine-tuning/cli-data-preparation-tool)轻松将数据转换为此文件格式。

```
{"prompt": "<prompt text>", "completion": "<ideal generated text>"}{"prompt": "<prompt text>", "completion": "<ideal generated text>"}{"prompt": "<prompt text>", "completion": "<ideal generated text>"}...
```
### CLI工具
python里的接口，通过接口来启动微调作业。
#### 创建
使用OpenAI CLI:启动微调作业。

```
openai api fine_tunes.create -t <TRAIN_FILE_ID_OR_PATH> -m <BASE_MODEL>
```

#### 使用
您可以通过将模型名称作为完成（completion）请求的`model`参数传递来开始发出请求：

OpenAI CLI:

```
openai api completions.create -m <FINE_TUNED_MODEL> -p <YOUR_PROMPT>
```

## 嵌入指南 Embeddings
### 模型
OpenAI提供一个第二代嵌入（Embeddings）模型（模型ID中用`-002`表示），以及16个第一代模型（模型ID中用`-001`表示）。

我们建议在几乎所有情况下使用`text-embedding-ada-002`。

注意，根据不同的use case，所需要使用的模型略有区别
### 向量数据库
向量数据库选项包括：

- [Pinecone(opens in a new tab)](https://github.com/openai/openai-cookbook/tree/main/examples/vector_databases/pinecone)，一个完全管理的向量数据库
- [Weaviate(opens in a new tab)](https://github.com/openai/openai-cookbook/tree/main/examples/vector_databases/weaviate)，一个开源向量搜索引擎
- 将Redis用作向量数据库
- [Qdrant(opens in a new tab)](https://github.com/openai/openai-cookbook/tree/main/examples/vector_databases/qdrant)，一个向量搜索引擎
- [Milvus(opens in a new tab)](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/Using_vector_databases_for_embeddings_search.ipynb)，一种为可扩展相似度搜索构建的向量数据库
- [Chroma(opens in a new tab)](https://github.com/chroma-core/chroma)，一个开源嵌入（Embeddings）式存储库
- [Typesense(opens in a new tab)](https://typesense.org/docs/0.24.0/api/vector-search)，快速开源向量搜索
- [Zilliz(opens in a new tab)](https://github.com/openai/openai-cookbook/tree/main/examples/vector_databases/zilliz)，由Milvus驱动的数据基础架构

### 该使用什么距离函数
我们推荐使用[余弦相似度(opens in a new tab)](https://en.wikipedia.org/wiki/Cosine_similarity)。距离函数的选择通常不太重要。

OpenAI的嵌入（Embeddings）是归一化到长度为1的，这意味着：

- 使用点积可以更快地计算余弦相似度
- 余弦相似度和欧几里得距离将得到相同的排名
## 语音转文字 speech-to-text
语音转文本API提供了两个端点——`transcriptions`和`translations`——基于我们最先进的开源large-v2 [(Whisper模型)(opens in a new tab)](https://openai.com/blog/whisper/)。它们可以用于：

- 将音频转录为任何语言
- 将音频翻译并转录为英语。

都在`openai.Audio`接口里

## 内容监管 Moderation
可以对内容进行归类，但主要针对英语。





