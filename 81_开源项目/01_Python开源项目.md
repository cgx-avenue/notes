# 1. tushare
[tushare](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/waditu/tushare)：TuShare 是一个免费、开源的 Python 财经数据接口包，[TuShare 文档](http://tushare.org/index.html)
![[imgs/Pasted image 20231102142643.png]]

# 2.  Goose
[python-goose](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/grangier/python-goose)：Goose 用于文章提取器，提取中文内容的示例代码：
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

# 3. flask-admin
[flask-admin](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/flask-admin/flask-admin)：我工作中需要写一个微型的管理系统，用的就是这个框架。简直快餐型，页面都写好了，只要设置好相关配置就可以跑起来了。唯一缺点就是文档中的例子少，开发一些特定的需求需要自己看源码，才能知道如何改。[文档](https://flask-admin.readthedocs.io/en/latest/)，下面是我跑起来之后的样子：
![[imgs/Pasted image 20231102145459.png]]


# 4. superset
[superset](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/apache/superset)：企业级的数据探索、展示平台。功能很强大，可以用来做数据分析、展示。如下图：
![[imgs/Pasted image 20231102151037.png]]

# 5. amazing-qr
[amazing-qr](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/x-hw/amazing-qr)：Python 写的生成动态、彩色、各式各样的二维码，详细的[中文文档](https://github.com/sylnsfar/qrcode/blob/master/README-cn.md)，通过 `qrcode` 生成的二维码样式如下

# 6. flask-limiter
[flask-limiter](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/alisaifee/flask-limiter)：一个 Flask 的扩展库，它可以根据访问者的 IP 限制其访问频率、次数等

# 7. fasttext
[fastText](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/facebookresearch/fastText)：fastText 简而言之，就是把文档中所有词通过 lookup table 变成向量，取平均后直接用线性分类器得到分类结果。[fastText 的实现](https://www.zybuluo.com/Wayne-Z/note/460881)

# 8. sh
[sh](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/amoffat/sh)：sh 是一个成熟，用于替代 subprocess，它允许你调用任何程序，就像它是一个函数，支持 Python2.6 - 3.5
```python
from sh import ifconfig
print ifconfig("eth0")
```

# 9. python-fire
[python-fire](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/google/python-fire)：Fire 是 Google 开源的 Python 库，可自动将您的代码转变成 CLI，无需您做任何额外工作。您不必定义参数，设置帮助信息，或者编写定义代码运行方式的 main 函数。相反，您只需从 main 模块调用“Fire”函数，其余工作全部交由 Python Fire 来完成。示例代码如下：

# 10. ltp
语言技术平台（Language Technology Platform，LTP）是哈工大社会计算与信息检索研究中心开源的一整套中文语言处理系统。提供了一系列中文自然语言处理工具，这些工具可以用于中文文本进行分词、词性标注、句法分析等工作

# 11. freezegun
[freezegun](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/spulec/freezegun)：时间漫步模块，模拟到某一个时间，使用简单方式多样，实现了装饰器、上下文等调用方式。示例代码如下：

```python
from freezegun import freeze_time
import datetime
import unittest


@freeze_time("2012-01-14")
def test():
    assert datetime.datetime.now() == datetime.datetime(2012, 1, 14)
```

# 12. faker
[faker](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/joke2k/faker)：用于生成假数据的库，支持多种语言，你值得拥有。示例代码：
```python
fake.address()
# '辽宁省雪市静安廉街b座 998259'

fake.street_address()
# '巢湖街U座'

fake.building_number()
# 'x座'

fake.city_suffix()
# '市'

fake.latitude()
# Decimal('-0.295126')

fake.province()
# '湖北省'
```

# 13. HanLP
[HanLP](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/hankcs/HanLP)：一系列模型与算法组成的 NLP 工具包，目标是普及自然语言处理在生产环境中的应用。具备功能完善、性能高效、架构清晰、语料时新、可自定义的特点，功能包括：中文分词、词性标注、命名实体识别、关键词提取等。示例代码：

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
[jieba](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/fxsjy/jieba)：强大的 Python 分词库，拿来直接用就好。示例代码如下：
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

# 15. tqdm
python 进度条 https://github.com/tqdm/tqdm

# 16. synonyms
[Synonyms](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/chatopera/Synonyms)：中文近义词工具包。支持自然语言理解的很多任务：文本对齐、推荐算法、相似度计算、语义偏移、关键字提取、概念提取、自动摘要、搜索引擎等。示例代码如下：
```python
import synonyms
synonyms.seg("能量")
```

# 17. wtfpython
[wtfpython](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/satwikkansal/wtfpython)：有趣、令人惊讶（坑爹）、鲜为人知的 Python 代码片段集合。[中文](https://github.com/leisurelicht/wtfpython-cn)

# 18. awesome-python
[awesome-python-applications](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/mahmoud/awesome-python-applications)：（英文）介绍 Python 有趣、神奇的开源项目。目前涵盖多个领域、项目丰富

# 19. click
[click](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/pallets/click)：Python 的第三方库，用于快速创建命令行。支持装饰器方式调用、多种参数类型、自动生成帮助信息等。示例代码如下：
```bash
import click

@click.command()
@click.option("--count", default=1, help="Number of greetings.")
@click.option("--name", prompt="Your name",
              help="The person to greet.")
def hello(count, name):
    """Simple program that greets NAME for a total of COUNT times."""
    for _ in range(count):
        click.echo("Hello, %s!" % name)

if __name__ == '__main__':
    hello()

# 下面为运行效果
$ python hello.py --count=3
Your name: Click
Hello, Click!
Hello, Click!
Hello, Click!
```

# 20. stanza
[stanza](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/stanfordnlp/stanza)：适用于多种人类语言的 Stanford NLP 官方 Python 库。包含用于运行 CoNLL 2018 共享任务的最新完全神经管道以及访问 Java Stanford CoreNLP 服务器的软件包。实例代码

# 21. dash
[dash](https://hellogithub.com/periodical/statistics/click/?target=https://github.com/plotly/dash)：一款只用几百行 Python 代码就可以轻易实现数据分析可视化的利器，是目前 Python 社区数据可视化主要的工具之一。具有：使用简单、易于扩展、开发团队活跃等特点




