# KG history
1960 Semantics Network
1980s Ontology本体论
1989 Web(Tim Bernes-Lee)
1998 the Semantic web
2006 Linked Data
2012 KG: A KG consists of a set of interconnected typed entities&therir contributes

# 三要素
Subject——Predicate——Object

# 一些名词
## RDF
1. resource description framework，用来表示三元关系
2. 可以使用RDFlib库操作


## RDFs
RDF+固定关键词
## OWL
Ontology web language， = RDF + schema，支持推理

# 一些笔记
1. 项目中需要生成、预定义、协商userdict
2. 三元组抽取=》基于依存句法分析
3. NER：有监督的命名实体识别

# 生成步骤
四步：
句子分割，依赖解析，词性标注，实体识别。

Quote：jieba可以做分词+词性标注，可以通过预定义的词行模板进行RDF抽取。又因为存在许多词属低频词，所以可以添加自定义词表。

# 图数据库
西门子选用的是neo4j。
## GraphDB
free版本最多支持2个并发查询，SE版本不限。
RDF4J 发行了GraphDB，使用Java，支持W3C SPARQL。
Domain-Range graph：Connectedness 连通性



