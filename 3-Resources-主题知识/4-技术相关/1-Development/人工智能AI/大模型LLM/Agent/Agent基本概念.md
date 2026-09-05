这里侠义的定义为LLM Agent。

## 定义
Agent是一个具有复杂推理能力、记忆和执行任务手段的系统。
![[../../../../../../_assets/img/Pasted image 20241114133812.png]]

## 组成
![[../../../../../../_assets/img/Pasted image 20241114133825.png]]
四个部分：tools，memory，planning，action
### 规划（planning）

- [子目标分解](https://zhida.zhihu.com/search?content_id=238473494&content_type=Article&match_order=1&q=%E5%AD%90%E7%9B%AE%E6%A0%87%E5%88%86%E8%A7%A3&zhida_source=entity)：agent将大任务拆分为更小的可管理的子目标，使得可以有效处理复杂任务。
- 反思与完善：agent对历史动作可以自我批评和自我反思，从错误中学习并在后续步骤里完善，从而改善最终结果的质量。

### 记忆（Memory）

- 短期记忆：上下文学习即是利用模型的短期记忆学习
- 长期记忆：为agent提供保留和召回长期信息的能力，通常利用外部向量存储和检索实现

### 工具使用（tool use）

- 对模型权重丢失的信息，agent学习调用外部[API](https://zhida.zhihu.com/search?content_id=238473494&content_type=Article&match_order=1&q=API&zhida_source=entity)获取额外信息，包括当前信息、代码执行能力、专有信息源的访问等等

### 行动（Action）

- 行动模块是智能体实际执行决定或响应的部分。面对不同的任务，[智能体系统](https://zhida.zhihu.com/search?content_id=238473494&content_type=Article&match_order=1&q=%E6%99%BA%E8%83%BD%E4%BD%93%E7%B3%BB%E7%BB%9F&zhida_source=entity)有一个完整的行动策略集，在决策时可以选择需要执行的行动，比如广为熟知的记忆检索、推理、学习、编程等


## 人机协同模式
三种：embedding，copilot，agent。
![[../../../../../../_assets/img/Pasted image 20241114133951.png]]
（1）嵌入（embedding）模式。用户通过与AI进行语言交流，使用提示词来设定目标，然后AI协助用户完成这些目标，比如普通用户向生成式AI输入提示词创作小说、音乐作品、3D内容等。在这种模式下，AI的作用相当于执行命令的工具，而人类担任决策者和指挥者的角色。

（2）副驾驶（Copilot）模式。在这种模式下，人类和AI更像是合作伙伴，共同参与到工作流程中，各自发挥作用。AI介入到工作流程中，从提供建议到协助完成流程的各个阶段。例如，在软件开发中，AI可以为程序员编写代码、检测错误或优化性能提供帮助。人类和AI在这个过程中共同工作，互补彼此的能力。AI更像是一个知识丰富的合作伙伴，而非单纯的工具。

（3）智能体（Agent）模式。人类设定目标和提供必要的资源（例如计算能力），然后AI独立地承担大部分工作，最后人类监督进程以及评估最终结果。这种模式下，AI充分体现了智能体的互动性、自主性和适应性特征，接近于独立的行动者，而人类则更多地扮演监督者和评估者的角色。

## 面向目标的软件开发
AI Agent将使软件架构的范式从[面向过程](https://zhida.zhihu.com/search?content_id=238473494&content_type=Article&match_order=1&q=%E9%9D%A2%E5%90%91%E8%BF%87%E7%A8%8B&zhida_source=entity)迁移到面向目标。现有的软件（包括APP）通过一系列预定义的指令、逻辑、规则和[启发式算法](https://zhida.zhihu.com/search?content_id=238473494&content_type=Article&match_order=1&q=%E5%90%AF%E5%8F%91%E5%BC%8F%E7%AE%97%E6%B3%95&zhida_source=entity)将流程固定下来，以满足软件运行结果符合用户的预期，即用户按照指令逻辑一步一步操作达成目标。这样一种面向过程的软件架构具有高可靠性、确定性。但是，这种面向目标的架构只能应用于[垂直领域](https://zhida.zhihu.com/search?content_id=238473494&content_type=Article&match_order=1&q=%E5%9E%82%E7%9B%B4%E9%A2%86%E5%9F%9F&zhida_source=entity)，而无法普遍应用到所有领域，因此标准化和定制化之间如何平衡也成为[SaaS](https://zhida.zhihu.com/search?content_id=238473494&content_type=Article&match_order=1&q=SaaS&zhida_source=entity)行业面对的难题之一。

![[../../../../../../_assets/img/Pasted image 20241114134333.png]]

AI Agent范式将原本由人类主导的功能开发，逐渐迁移为以AI为主要驱动力。以大模型为技术基础设施，Agent为核心产品形态，把传统软件预定义的指令、逻辑、规则和启发式算法的任务层级演变成目标导向的智能体自主生成。这样一来，原本的架构只能解决有限范围的任务，未来的架构则可以解决无限域的任务。未来的软件生态，不仅是最上层与所有人交互的媒介是Agent，整个产业的发展，无论是底层技术，商业模式，[中间组件](https://zhida.zhihu.com/search?content_id=238473494&content_type=Article&match_order=1&q=%E4%B8%AD%E9%97%B4%E7%BB%84%E4%BB%B6&zhida_source=entity)，甚至是人们的生活习惯和行为都会围绕Agent来改变，这就是Agent-Centric时代的开启。

![[../../../../../../_assets/img/Pasted image 20241114134427.png]]







## 参考
1. [AI Agent（或者LLM Agent）深度讲解——组成、方法、案例及展望 - 知乎](https://zhuanlan.zhihu.com/p/676544930)
2. [国内智能体（AI Agent）产品、框架试用及综述（持续更新） - 知乎](https://zhuanlan.zhihu.com/p/688727771)
