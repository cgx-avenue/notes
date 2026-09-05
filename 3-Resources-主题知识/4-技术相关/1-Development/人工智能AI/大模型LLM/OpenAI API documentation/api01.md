# 助手assistant
### 什么是助手？[](https://www.openaidoc.com.cn/api-reference/Assistants_QAS#%E4%BB%80%E4%B9%88%E6%98%AF%E5%8A%A9%E6%89%8B)

助手是一个特定目的的人工智能，使用 OpenAI 的模型，访问文件，维持持久的线程并调用工具。

### 什么是线程？[](https://www.openaidoc.com.cn/api-reference/Assistants_QAS#%E4%BB%80%E4%B9%88%E6%98%AF%E7%BA%BF%E7%A8%8B)

线程是助手与用户之间的对话会话。线程通过存储消息历史和在对话变得过长超出模型上下文长度时截断消息，简化了应用程序开发。

## 助手api
Assistants API 允许你在自己的应用程序内构建 AI 助手。助手拥有指令，并能利用模型、工具和知识来响应用户查询。Assistants API 目前支持三种工具：代码解释器、检索和函数调用。

Assistants API 的典型集成流程如下：

- 在 API 中创建一个助手，通过定义自定义指令和选择一个模型。如果有帮助的话，启用如代码解释器、检索和函数调用等工具。
- 当用户开始对话时，创建一个线程。
- 随着用户提问，向线程添加消息。
- 在线程上运行助手以触发响应。这将自动调用相关工具。

具体示例参见[Assistants API – OpenAI接口文档中文版 (openaidoc.com.cn)](https://www.openaidoc.com.cn/api-reference/Assistants_run)
![[../../../../../../_assets/img/Pasted image 20240613101931.png]]

