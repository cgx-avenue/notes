主要方向是利用web，以前是直接用jupyter做分析，做完了分析直接导出成html。
在导出的时候把code隐藏掉，也可以做一个不错的静态展示。但如果是牵扯到动态内容，比如改改时间轴进度条什么的，就不方便了。偶然间先看到了gradio，试了试，[[Gradio]]笔记在此。后来有看到了streamlit，觉得这两个东西功能上差不多。就顺手做个整理。

# 优劣势
和传统的使用web框架进行开发，或者和jupyter等数据分析工具对比：
优势：
1. 建立动态页面
2. 有基本的输入输出，选择和过滤即可
3. 不需要复杂的web框架
4. 自己集成了图表组件，不需要自己再写echarts之类的。
5. 很直观的展示和调整结果

劣势：
1. 肯定不够灵活，页面布局也不够好看
2. 扩展困难，如果需要集成到其它系统里，就得重新来做

# 常用
## Streamlit
[Streamlit](https://link.zhihu.com/?target=https%3A//streamlit.io/)是一个将Python脚本转换为可共享的Web应用程序的库。Streamlit 应用专为数据科学和机器学习社区而设计，可轻松构建仪表板和交互式 ML 模型。Streamlit之所以如此受欢迎，是因为它的简单性。使用 Streamlit 库既快速又直观，这意味着您无需任何 Web 开发经验即可创建数据应用程序。  
虽然 Streamlit 是一个很棒的工具，但它可能会不足，具体取决于您的用例。Streamlit应用程序的布局和样式非常僵化，所以除非你愿意编写一些HTML，JS和CSS，否则你所有的应用程序看起来都差不多。Streamlit也存在[速度问题](https://link.zhihu.com/?target=https%3A//medium.com/%40ramiromedina/like-streamlit-but-fast-enabling-low-latency-data-apps-948b95b098a2)，因为它在前端的每次交互后重新运行为应用程序提供服务的Python脚本。

# Gradio
用于构建机器学习演示的 Python





