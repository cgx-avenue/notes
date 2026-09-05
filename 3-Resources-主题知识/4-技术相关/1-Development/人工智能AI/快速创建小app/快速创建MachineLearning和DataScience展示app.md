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

## Gradio
用于构建机器学习演示的 Python
可能是此列表中与Streamlit最相似的替代品。与Streamlit一样，Gradio是一个Python库，用于将数据集和机器学习模型转换为交互式Web UI。主要区别在于Gradio更多地是为机器学习演示而设计的，而Streamlit是为创建数据仪表板而设计的。
参见[[Gradio]]

优点：  

- **适用于ML模型**：Gradio现在是[Hugging](https://link.zhihu.com/?target=https%3A//huggingface.co/) Face的一部分，Hugging Face集成使加载ML模型和数据集变得时尚而简单。
- 轻松共享应用：**轻松共享应用**。您可以快速生成链接以发送给其他用户，但此链接将在 72 小时后过期，并在您自己的计算机上运行所有代码。要共享您的应用，您需要将其托管在其他地方，例如[拥抱面部空间](https://link.zhihu.com/?target=https%3A//huggingface.co/spaces)。
- 嵌入**笔记本：**Gradio可以嵌入到Python笔记本中。这使得共享代码和与代码交互变得容易。

缺点：  

- **过时的外观**： Gradio 应用程序具有非常基本和过时的外观。可以自定义它们，但您需要知道如何编写一些 CSS
- **开箱即用的云托管选项是有限的：托管**Gradio应用程序的最简单方法是在Hugging Face Spaces上，但是托管在Spaces上的应用程序非常清楚地托管在Hugging Face网站中，这使得很难为自己或您的公司打造您的应用程序品牌。
- **非独立应用**：Gradio 应用嵌入到另一个网页中时效果最佳，这与 Streamlit 应用不同，后者可作为独立应用运行良好。


## Plotly  
Plotly是一个绘图库，[Dash](https://link.zhihu.com/?target=https%3A//dash.plotly.com/)是他们的开源框架，用于使用Python，R或Julia构建数据应用程序。（Dash也有[企业版](https://link.zhihu.com/?target=https%3A//plotly.com/dash/)，但我们将在这里重点介绍开源库。  

![](https://pic2.zhimg.com/80/v2-b0fe0682c71772d2018fb322157b1345_720w.webp)

优点：  

- **比流光更快**：达世币只需要运行与应用程序交互时调用的功能。使用 Streamlit，整个脚本会在每次交互时重新运行。
- **在 Jupyter** 笔记本中工作：如果你更喜欢在 Jupyter 笔记本中工作，该库允许你在 Jupyter 笔记本中运行仪表板。`[jupyter-dash](https://link.zhihu.com/?target=https%3A//pypi.org/project/jupyter-dash/)`
- **更灵活的设计**：如果您了解一些HTML和CSS，则可以更轻松地按照自己的方式设置Dash应用程序的样式。
- **不仅限于**Python：Dash也是R和Julia的框架，因此您不仅限于使用Python构建应用程序。

缺点：  

- **没有HTML的有限布局选项**：Dash有一个Python包装器，用于构建UI，但你仍然需要了解HTML才能使用它。
- **更大的学习曲线**：Dash比Streamlit复杂一些（例如，你需要使用[“回调”](https://link.zhihu.com/?target=https%3A//dash.plotly.com/basic-callbacks)和一些HTML），所以它不那么容易上手。
- **主要限于** Plotly：Dash 是 Plotly 产品，因此该框架旨在与该绘图库配合使用。从技术上讲，您可以将Dash与其他绘图库一起使用，但不像Plotly那样容易和流畅。

还有其他的可以参见Refs1

# Shiny
https://shiny.posit.co/
这个标题说明了一切
> Easy web apps for data science without the compromises
    No web development skills required




# Refs
1. https://zhuanlan.zhihu.com/p/622987790
2. https://www.cnblogs.com/goldsunshine/p/17827556.html#%E4%BD%BF%E7%94%A8%E5%BB%BA%E8%AE%AE
3. 


