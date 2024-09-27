# 1.  Goose
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

# 2. fasttext
[fastText](https://github.com/facebookresearch/fastText)：fastText 简而言之，就是把文档中所有词通过 lookup table 变成向量，取平均后直接用线性分类器得到分类结果。[fastText 的实现](https://www.zybuluo.com/Wayne-Z/note/460881)


# 3. ltp
语言技术平台（Language Technology Platform，LTP）是哈工大社会计算与信息检索研究中心开源的一整套中文语言处理系统。提供了一系列中文自然语言处理工具，这些工具可以用于中文文本进行分词、词性标注、句法分析等工作


# 4. HanLP
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

# 5. jieba
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


# 6. synonyms
[Synonyms](https://github.com/chatopera/Synonyms)：中文近义词工具包。支持自然语言理解的很多任务：文本对齐、推荐算法、相似度计算、语义偏移、关键字提取、概念提取、自动摘要、搜索引擎等。示例代码如下：
```python
import synonyms
synonyms.seg("能量")
```


# 7. stanza
[stanza](https://github.com/stanfordnlp/stanza)：适用于多种人类语言的 Stanford NLP 官方 Python 库。包含用于运行 CoNLL 2018 共享任务的最新完全神经管道以及访问 Java Stanford CoreNLP 服务器的软件包。实例代码

# 8. world_count
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


# 9. funNLP
中英文敏感词、语言检测、中外手机/电话归属地/运营商查询、名字推断性别、手机号抽取、身份证抽取、邮箱抽取、中日文人名库、中文缩写库、拆字词典、词汇情感值、停用词、反动词表、暴恐词表、繁简体转换、英文模拟中文发音、汪峰歌词生成器、职业名称词库、同义词库、反义词库、否定词库、汽车品牌词库、汽车零件词库、连续英文切割、各种中文词向量、公司名字大全、古诗词库、IT词库、财经词库、成语词库、地名词库、历史名人词库、诗词词库、医学词库、饮食词库、法律词库、汽车词库、动物词库、中文聊天语料、中文谣言数据、百度中文问答数据集、句子相似度匹配算法集合、bert资源、文本生成&摘要相关工具、cocoNLP信息抽取工具、国内电话号码正则匹配、清华大学XLORE:中英文跨语言百科知识图谱、清华大学人工智能技术…
https://github.com/fighting41love/funNLP

# 10. pyltp
pyltp 是 [语言技术平台（Language Technology Platform, LTP）](https://github.com/HIT-SCIR/ltp)的 Python 封装。来自于哈工大。目前这个库也有限维护了，转到了pytorch版本。
> **目前基于Pytorch的LTP4 已经发布，而PyLTP将会只有非常有限的维护，请大家移步使用**[LTP 4]([LTP 4](https://github.com/HIT-SCIR/ltp))

# 11. wordfreq
Access a database of word frequencies, in various natural languages.
统计各种语言中词出现频率的一个library，好玩的地方在于，作者停止更新了，因为大多数新增网络内容都是垃圾。
https://github.com/rspeer/wordfreq

