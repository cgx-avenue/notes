#SPARQL #knowledgegraph #知识图谱 #Gremlin #RDF
# 背景
学习知识图谱绕不过去的图数据查询语言。由W3C定义。https://www.w3.org/TR/sparql11-query/ 

# 概念
## 核心思想
给定谓语动词，从三元组提取合适的主语或宾语。
```SPARQL
SELECT <variables>
WHERE {
	<graph pattern>
}
```



## RDF 
RDF的英语全称为Resource Description Framework，中文名称为**资源描述框架。RDF是一种描述数据文件储存的数据模型，该数据模型通常描述由三个部分组成的事实，被称为三元组（triples）**。三元组由主语（subject）、谓语（predicate）和宾语（object）组成，看上去很像一个简单的句子。

# PS：不好用
每次整理RDF，都要去很繁琐的看这些定义，过程。
RDF必须定义谓语，而不同的人，不同的语种，不同的文化下的人对于谓语的选择千变万化。同时，谓语并不能很好的体现所有的关系。我个人还是更倾向于更广阔的property方式。

# 资料
https://blog.csdn.net/weixin_53580595/article/details/126899714?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-126899714-blog-116237249.pc_relevant_multi_platform_whitelistv3&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-126899714-blog-116237249.pc_relevant_multi_platform_whitelistv3&utm_relevant_index=1
https://www.w3.org/TR/sparql11-query/
https://www.ruanyifeng.com/blog/2020/02/sparql.html

其余资料参照Microsoft Edge里的收藏夹吧。
