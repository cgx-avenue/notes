# 2.  Goose
[python-goose](https://github.com/grangier/python-goose)：Goose 用于文章提取器，提取中文内容的示例代码：
```txt
>>> from goose import Goose
>>> from goose.text import StopWordsChinese
>>> url  = 'http://www.bbc.co.uk/zhongwen/simp/chinese_news/2012/12/121210_hongkong_politics.shtml'
>>> g = Goose({'stopwords_class': StopWordsChinese})
>>> article = g.extract(url=url)
>>> print article.cleaned_text[:150]
香港行政长官梁振英在各方压力下就其大宅的违章建筑（僭建）问题到立法会接受质询，并向香港民众道歉。

梁振英在星期二（12月10日）的答问大会开始之际在其演说中道歉，但强调他在违章建筑问题上没有隐瞒的意图和动机。

一些亲北京阵营议员欢迎梁振英道歉，且认为应能获得香港民众接受，但这些议员也质问梁振英有
```



# 7. fasttext
[fastText](https://github.com/facebookresearch/fastText)：fastText 简而言之，就是把文档中所有词通过 lookup table 变成向量，取平均后直接用线性分类器得到分类结果。[fastText 的实现](https://www.zybuluo.com/Wayne-Z/note/460881)


# 10. ltp
语言技术平台（Language Technology Platform，LTP）是哈工大社会计算与信息检索研究中心开源的一整套中文语言处理系统。提供了一系列中文自然语言处理工具，这些工具可以用于中文文本进行分词、词性标注、句法分析等工作


# 13. HanLP
[HanLP](https://github.com/hankcs/HanLP)：一系列模型与算法组成的 NLP 工具包，目标是普及自然语言处理在生产环境中的应用。具备功能完善、性能高效、架构清晰、语料时新、可自定义的特点，功能包括：中文分词、词性标注、命名实体识别、关键词提取等。示例代码：

```java
String[] testCase = new String[]{
    "北川景子参演了林诣彬导演的《速度与激情3》",
    "林志玲亮相网友:确定不是波多野结衣？",
};
Segment segment = HanLP.newSegment().enableJapaneseNameRecognize(true);
for (String sentence : testCase)
{
    List termList = segment.seg(sentence);
    System.out.println(termList);
}
```

# 14. jieba
[jieba](https://github.com/fxsjy/jieba)：强大的 Python 分词库，拿来直接用就好。示例代码如下：
```python
# encoding=utf-8
import jieba

seg_list = jieba.cut("我来到北京清华大学", cut_all=True)
print("Full Mode: " + "/ ".join(seg_list))  # 全模式

seg_list = jieba.cut("我来到北京清华大学", cut_all=False)
print("Default Mode: " + "/ ".join(seg_list))  # 精确模式

seg_list = jieba.cut("他来到了网易杭研大厦")  # 默认是精确模式
print(", ".join(seg_list))

seg_list = jieba.cut_for_search("小明硕士毕业于中国科学院计算所，后在日本京都大学深造")  # 搜索引擎模式
print(", ".join(seg_list))

【全模式】: 我/ 来到/ 北京/ 清华/ 清华大学/ 华大/ 大学

【精确模式】: 我/ 来到/ 北京/ 清华大学

【新词识别】：他, 来到, 了, 网易, 杭研, 大厦    (此处，“杭研”并没有在词典中，但是也被Viterbi算法识别出来了)

【搜索引擎模式】： 小明, 硕士, 毕业, 于, 中国, 科学, 学院, 科学院, 中国科学院, 计算, 计算所, 后, 在, 日本, 京都, 大学, 日本京都大学, 深造

```


# 16. synonyms
[Synonyms](https://github.com/chatopera/Synonyms)：中文近义词工具包。支持自然语言理解的很多任务：文本对齐、推荐算法、相似度计算、语义偏移、关键字提取、概念提取、自动摘要、搜索引擎等。示例代码如下：
```python
import synonyms
synonyms.seg("能量")
```


# 20. stanza
[stanza](https://github.com/stanfordnlp/stanza)：适用于多种人类语言的 Stanford NLP 官方 Python 库。包含用于运行 CoNLL 2018 共享任务的最新完全神经管道以及访问 Java Stanford CoreNLP 服务器的软件包。实例代码

# 26. world_count
[word_cloud](https://github.com/amueller/word_cloud)：Python 的词云生成工具。示例代码：

```python
# 加载内容
text = open(path.join(d, 'constitution.txt')).read()
# 生成词云图片
wordcloud = WordCloud().generate(text)
# 展示生成的图片
image = wordcloud.to_image()
image.show()
```





# 32.  [TqSdk 天勤量化交易策略程序开发包](https://github.com/shinnytech/tqsdk-python#tqsdk-%E5%A4%A9%E5%8B%A4%E9%87%8F%E5%8C%96%E4%BA%A4%E6%98%93%E7%AD%96%E7%95%A5%E7%A8%8B%E5%BA%8F%E5%BC%80%E5%8F%91%E5%8C%85)

# 33. moviepy
[moviepy](https://github.com/Zulko/moviepy)：用于处理视频的 Python 库，它支持视频剪辑、自定义效果、视频合成、格式转化、插入文字等功能。专于注视频但不局限于此，还支持处理音频和 GIF 图片。虽然现在视频剪辑的工具很丰富，但如果要批量处理视频，用 Python+moviepy 写个脚本应该可以一劳永逸，节省时间

# 34. tinker-designer
[Tkinter-Designer](https://github.com/ParthJadhav/Tkinter-Designer)：用拖动的方式创建漂亮的桌面软件。它的操作十分简单，首先在 Figma 网站通过拖拽的方式构建应用，然后把设计好的应用地址和 token 输入到 Tkinter-Designer 自动生成 Python 代码，最后就能得到界面简洁大方的桌面应用啦。不用代码做出基于 tkinter 的桌面应用



# 36. label-studio
[label-studio](https://github.com/HumanSignal/label-studio)：开源的数据标注工具。支持音频、文本、图像、视频、时间序列等，多种类型数据的标注和注释工具。

# 37. schedule
[schedule](https://github.com/dbader/schedule)：简单友好的 Python 任务调度库。该项目人性化的 API 设计，让开发者仅用几行代码就能轻松实现定时任务。它不依赖任何第三方库，全部代码也就一个文件 800 多行，拥有丰富的注释和单元测试，源码阅读起来十分轻松。

# 38. funNLP
中英文敏感词、语言检测、中外手机/电话归属地/运营商查询、名字推断性别、手机号抽取、身份证抽取、邮箱抽取、中日文人名库、中文缩写库、拆字词典、词汇情感值、停用词、反动词表、暴恐词表、繁简体转换、英文模拟中文发音、汪峰歌词生成器、职业名称词库、同义词库、反义词库、否定词库、汽车品牌词库、汽车零件词库、连续英文切割、各种中文词向量、公司名字大全、古诗词库、IT词库、财经词库、成语词库、地名词库、历史名人词库、诗词词库、医学词库、饮食词库、法律词库、汽车词库、动物词库、中文聊天语料、中文谣言数据、百度中文问答数据集、句子相似度匹配算法集合、bert资源、文本生成&摘要相关工具、cocoNLP信息抽取工具、国内电话号码正则匹配、清华大学XLORE:中英文跨语言百科知识图谱、清华大学人工智能技术…
https://github.com/fighting41love/funNLP

# 39. openpilot
[openpilot](https://github.com/commaai/openpilot)：comma.ai 开源的自动驾驶系统

# 40. python-systemd
[python-systemd-tutorial](https://github.com/torfsen/python-systemd-tutorial)：用 Python 编写 systemd 服务的教程。许多 Linux 发行版都用 systemd 来管理系统的服务，比如开机启动、自动重启、守护进程等。该项目讲解了如何入门 systemd，并提供了一个 Python 脚本和 systemd unit 文件，可以在此基础上快速开发出 systemd 服务。

# 41. mercury
[mercury](https://github.com/mljar/mercury)：能够将 Jupyter Notebook 变成 Web 应用的框架。该项目可以让你在 Python Notebook 中添加交互式部件，实现自动生成一个漂亮的 Web 应用，方便分享和展示你的成果。

# 42. musicpy
[musicpy](https://github.com/Rainbow-Dreamer/musicpy)：用 Python 创作音乐。该项目可以用简洁的 Python 代码生成一段音乐，它提供了和弦、音符和音阶等几个基本类型，需要具备一定的音理基础才能上手。

# 43. donkeycar
https://github.com/autorope/donkeycar

# 44. cudf
[cudf](https://github.com/rapidsai/cudf)：支持 GPU 的数据库处理 Python 库。它相当于支持 GPU 的 pandas，处理数据的速度直接起飞。提供了类似 pandas 的 API，支持加载、合并、聚合、过滤等方式操作数据。

# 45. nvitop
[nvitop](https://github.com/XuehaiPan/nvitop)：用 top 命令的方式查看 NVIDIA GPU 和进程状态。这是一款 NVIDIA 设备和进程监控工具，拥有多彩高亮的界面，实时更新的进程和设备信息，支持过滤进程、鼠标控制、发送信号等功能。

# 46. python-weekly 
[python-weekly](https://github.com/chinesehuazhou/python-weekly)：Python 潮流周刊。这是一份由「豌豆花下猫」制作的每周更新的 Python 周刊，内容包括 Python 的精品文章、教程、开源项目、工具、视频和热门话题等。

# 47. python-holidays
[python-holidays](https://github.com/vacanza/python-holidays)：处理假期的 Python 库。该项目支持动态生成国家/地区和省份公布的法定节假日，可以快速地判断指定日期是否为节假日。

# 48. pyetho
Exploring Global Diversity: Pyetho — Python Library for Language and Country Insights
https://medium.com/@i18nsolutionspy/exploring-global-diversity-pyetho-python-library-for-language-and-country-insights-4a688958ea83
返回每个国家的语言，按照ISO标准。
![[imgs/Pasted image 20231124151104.png]]
中国的居然有这么多。

# 49. keep
https://github.com/keephq/keep
报警管理和自动化库，可以连接到不同的前端接受多种报警系统，然后建立workflow来自动化执行一些工作。
>Keep makes it easy to consolidate all your alerts into a single pane of glass and to orchestrate workflows to automate your end-to-end processes.

# 50. cleanlab
https://github.com/cleanlab/cleanlab


# 51. Self-operating-computer
[self-operating-computer：使多模态模型能够操作计算机](https://github.com/OthersideAI/self-operating-computer)

这是近期基于 GPT-4v 的最火项目之一。让大语言模型像人类一样查看屏幕内容，操作鼠标和键盘来实现特定的目标。当前的挑战是 GPT-4v 在鼠标点击位置方面的错误率很高。（star 5.1K）


# 52. wechatmsg
[WeChatMsg：导出微信聊天记录成 HTML/Word/CSV文档](https://github.com/LC044/WeChatMsg)

本周火爆朋友圈的项目，作者是一名在校大学生。支持导出微信聊天记录，支持生成年度聊天报告。Slogan 不错：“我的数据我做主”。可以导出数据用于训练个人 AI！（star 12.5K）

# 53. pywxdump
[PyWxDump：获取微信账号信息、导出聊天记录](https://github.com/xaoyaoo/PyWxDump)

这是上一个项目的依赖，可解密数据库，查看和导出聊天记录，支持微信多开场景获取多用户信息。（star 1.6K）（PS. 总感觉这两个项目会被某信针对，你觉得呢？）

# 54. python-systemd-tutorial
https://github.com/torfsen/python-systemd-tutorial
A tutorial for writing a systemd service in Python



