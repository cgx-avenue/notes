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




