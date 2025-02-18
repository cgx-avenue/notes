#DeepSeek #LLM #Reasoning

官网： [DeepSeek | 深度求索](https://www.deepseek.com/)
Github: [DeepSeek · GitHub](https://github.com/deepseek-ai)
# DeepSeek模型
## DeepSeek-Coder V2（代码专家）

**发布时间：2024 年 4 月**

**功能特点：专治「写代码手残党」。**

- 比如你写程序卡壳了，它能帮你补全代码、找 Bug，甚至从零生成一个小程序。
- 它的训练数据里 87%都是代码，堪称程序员的好基友。

## DeepSeek-Math（数学学霸）
[GitHub - deepseek-ai/DeepSeek-Math: DeepSeekMath: Pushing the Limits of Mathematical Reasoning in Open Language Models](https://github.com/deepseek-ai/DeepSeek-Math)
**发布时间：2024 年 2 月**

**功能特点：数学学霸。**

- 数学竞赛级选手，能解高难度数学题，连解题步骤都能写得明明白白。
- 官方说它的水平接近 GPT-4 和谷歌 Gemini，而且不用查资料，纯靠“脑力”做题。

## DeepSeek-V3（全能战士）
[GitHub - deepseek-ai/DeepSeek-V3](https://github.com/deepseek-ai/DeepSeek-V3)
We present DeepSeek-V3, a strong Mixture-of-Experts (MoE) language model with 671B total parameters with 37B activated for each token. To achieve efficient inference and cost-effective training, DeepSeek-V3 adopts Multi-head Latent Attention (MLA) and DeepSeekMoE architectures。

**发布时间：2024 年 12 月**

**功能特点：六边形战士。**

- 综合能力最强，能推理、能写文案、能分析数据，甚至和 GPT-4、Claude 3.5 掰手腕。
- 不过它训练成本也最高，烧了 500 多万美元，用了两千多块顶级显卡，堪称“氪金大佬”。

## DeepSeek-R1（经济适用型）
[GitHub - deepseek-ai/DeepSeek-R1](https://github.com/deepseek-ai/DeepSeek-R1)
**发布时间：**2025 年 1 月

**功能特点：**经济适用

- 主打性价比，性能和 OpenAI 的商用模型差不多，但开源免费！
- 还分不同体型，小到手机能跑，大到服务器专用，丰俭由人。

## DeepSeek-R1-Zero
However, DeepSeek-R1-Zero encounters challenges such as endless repetition, poor readability, and language mixing. To address these issues and further enhance reasoning performance, we introduce DeepSeek-R1, which incorporates cold-start data before RL.
说中文，R1-Zero有不能停止推理、语言混淆、可读性差等缺点。为了解决这些问题，R1采用了冷启动的方式。

## DeepSeek-R1-Distill

已被DeepSeek证明了，大型模型的推理模式可以被蒸馏到小型模型中，从而使其推理能力优于直接在小型模型上通过强化学习（RL）获得的推理模式。

利用 DeepSeek-R1 生成的推理数据，对多个广泛应用于研究领域的稠密模型进行了微调。评测结果表明，这些蒸馏后的小型稠密模型在基准测试中表现出色。DeepSeek向社区开源了基于 Qwen2.5 和 Llama3 系列的 1.5B、7B、8B、14B、32B 和 70B 规模的模型检查点，以促进研究与发展。

![](https://i-blog.csdnimg.cn/direct/c1e410ac6854436581dc6a7a83dd3260.png)

DeepSeek-R1-Distill 模型是在开源模型的基础上进行微调的，使用了 DeepSeek-R1 生成的样本。他们对其配置和分词器进行了轻微调整。

## R1 vs V3



## DeepSeek-VL
**发布时间：2024 年 4 月**
多模态模型
[GitHub - deepseek-ai/DeepSeek-VL: DeepSeek-VL: Towards Real-World Vision-Language Understanding](https://github.com/deepseek-ai/DeepSeek-VL)
Towards Real-World Vision-Language Understanding

只有1.7B和7B模型


## DeepSeek-V2
**发布时间：2024 年 9 月**

[GitHub - deepseek-ai/DeepSeek-V2: DeepSeek-V2: A Strong, Economical, and Efficient Mixture-of-Experts Language Model](https://github.com/deepseek-ai/DeepSeek-V2)
A Strong, Economical, and Efficient Mixture-of-Experts Language Model
It comprises 236B total parameters, of which 21B are activated for each token.


## DeepSeek-LLM
**发布时间：2024 年 2 月**
Introducing DeepSeek LLM, an advanced language model comprising 67 billion parameters. It has been trained from scratch on a vast dataset of 2 trillion tokens in both English and Chinese.

# DeepSeek API
## 官网
[DeepSeek 开放平台](https://platform.deepseek.com/usage)
[Models & Pricing | DeepSeek API Docs](https://api-docs.deepseek.com/quick_start/pricing)
1M tokens，8块
## 阿里
1M tokens，8块

# 模型尺寸
DeepSeek-R1 系列有从 1.5B 到 671B 不同“体型”（B = 10 亿参数），你可以理解为：

## 1.5B-14B（迷你版）

相当于“智能小助手”，装在手机里就能用。反应快、省电，但遇到复杂问题容易卡壳。适合查天气、简单聊天、写个短文案。

## 32B-70B（中杯版）

像“专业顾问”，能处理法律文件分析、行业报告生成这类工作。需要中等配置的电脑或服务器才能跑得动。

## 671B（巨无霸）

妥妥的“学霸体质”，能解竞赛题、写长篇小说、做商业决策分析。但必须用顶级显卡服务器，普通电脑根本带不动。


# 所需配置
![[imgs/Pasted image 20250218101937.png]]





