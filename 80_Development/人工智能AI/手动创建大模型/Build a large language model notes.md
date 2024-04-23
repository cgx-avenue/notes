在线书籍：https://livebook.manning.com/book/build-a-large-language-model-from-scratch/chapter-1/v-6/29

# CH1
## 1.3 Stages of building and using LLMs
The general process of creating an LLM includes pretraining and finetuning. The term "pre" in "pretraining" refers to the initial phase where a model like an LLM is trained on a large, diverse dataset to develop a broad understanding of language. This pretrained model then serves as a foundational resource that can be further refined through finetuning, a process where the model is specifically trained on a narrower dataset that is more specific to particular tasks or domains.
![[imgs/Pasted image 20240423150603.png]]
The two most popular categories of finetuning LLMs include _instruction-finetuning_ and finetuning for _classification_ tasks. In instruction-finetuning, the labeled dataset consists of instruction and answer pairs, such as a query to translate a text accompanied by the correctly translated text. In classification finetuning, the labeled dataset consists of texts and associated class labels, for example, emails associated with _spam_ and _non-spam_ labels.

## 1.4 Using LLMs for different tasks
### transformer
Attention is all you need.
![[imgs/Pasted image 20240423163351.png]]

BERT (short for _bidirectional encoder representations from transformers_) and the various GPT models (short for _generative pretrained transformers_).

BERT, which is built upon the original transformer's encoder submodule, differs in its training approach from GPT. While GPT is designed for generative tasks, BERT and its variants specialize in masked word prediction, where the model predicts masked or hidden words in a given sentence as illustrated in Figure 1.5. This unique training strategy equips BERT with strengths in text classification tasks, including sentiment prediction and document categorization. As an application of its capabilities, as of this writing, Twitter uses BERT to detect toxic content.

![[imgs/Pasted image 20240423164334.png]]

GPT, on the other hand, focuses on the decoder portion of the original transformer architecture and is designed for tasks that require generating texts.

Zero-shot, few-shot.
Zero-shot learning refers to the ability to generalize to completely unseen tasks without any prior specific examples. On the other hand, few-shot learning involves learning from a minimal number of examples the user provides as input.

![[imgs/Pasted image 20240423164649.png]]

## 1.6 A closer look at the GPT architecture
GPT stands for _**G**_enerative _**P**_retrained _**T**_ransformer and was originally introduced in the following paper:

- _Improving Language Understanding by Generative Pre-Training_ (2018) by _Radford et al._ from OpenAI, [http://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf](http://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf)

![[imgs/Pasted image 20240423165547.png]]


