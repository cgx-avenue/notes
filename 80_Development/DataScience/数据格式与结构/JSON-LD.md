# 为什么需要JSON-LD
https://zhuanlan.zhihu.com/p/523020892
这篇文章里介绍的已经很好了，基本是里面提到的第二个文章的翻译。
[JSON-LD官网](https://link.zhihu.com/?target=https%3A//json-ld.org/)
[一篇很好介绍JSON-LD的文章](https://link.zhihu.com/?target=https%3A//www.cloudbees.com/blog/json-ld-building-meaningful-data-apis%23)

简单说，JSON的自由度过高，为了统一大家的用语习惯，提前规定好格式，也就是@context和@vocab里规定好的，然后使用这些约定好的用语进行定义和解析。通过这种方式，数据`link`到了一起。

Refs.1 介绍的挺好的。

# 语法
## Schema
可以自己定义，也可以从别的地方引用。比如Refs.2 就是一个定义schema的地方。


# 用处
## 网站SEO
最早JSON-LD就是google提出的，用来优化搜索引擎检索。数据规范好之后，自然有利于高校检索。
https://zhuanlan.zhihu.com/p/30621156
## 知识图谱
JSON-LD可以用来规范三元组的用词之类的，所以可以作为知识图谱的基础数据格式。
https://swordair.com/rdfa-json-ld/
## 作为configuration文件
例如EDC（Eclipse dataspace connector）里使用的一样。
![[imgs/Pasted image 20240103101544.png]]




# Refs
1. https://csvbase.com/blog/13
2. https://schema.org/
