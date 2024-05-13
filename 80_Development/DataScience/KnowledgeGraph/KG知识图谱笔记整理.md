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
1. RDF的英语全称为Resource Description Framework，中文名称为**资源描述框架。RDF是一种描述数据文件储存的数据模型，该数据模型通常描述由三个部分组成的事实，被称为三元组（triples）**。三元组由主语（subject）、谓语（predicate）和宾语（object）组成，看上去很像一个简单的句子。
2. 可以使用RDFlib库操作
3. 任何网络**资源**都可以唯一的用URI表示
Triples: 属性值--(属性)--资源--(属性)--属性值
其中，资源 -> subject, 属性名称 -> Predicate谓语，属性值 -> Object宾语
4. RDF表示：xml
5. 任何组织和个人，均可自定义谓语。RDF要求：
	1. 谓语（事物间关系）必须有明确定义
	2. 谓语每套必须有一个明确的URL，存在->w3c官方谓语
	3. RDF前缀: PREFIX rdf 代表官方前缀
	4. 经常将rdf:type 直接简写成a
6. 每个RDF结尾是英文的句号"."，用来区分多个三元组。主语相同时，采用分号";"分开。
7. 

## RDFs
RDF Schema，RDF+固定关键词
1. describing properties & classes of RDF resources
2. providing a type system for RDF

## Ontology
1. Definition: in general, an ontology fornally describes a cusually finite domain of related concepts(class of objects) and their relationships
2. Ontologies may include:
	1. classes & subclasses
	2. properties
	3. value restrictions
	4. disjointness statements
	5. specs of logical replationships between objects
3. O = <C,R,I,A>
	1. C: classes
	2. R: relations
	3. I: instances
	4. A: axioms

## Logic & inference
1. Logic programming -> resoner（推理机）, "if...then...."
2. predicate logic

## Resoning strategies
2 principle strategies for rule-based inference


## OWL
Ontology web language，支持推理，有很多dialects





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



