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

# 6.

