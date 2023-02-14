#knowledgegraph #知识图谱 #Apache #TinkerPop #Gremlin #SPARQL #Neptune #graph
# 背景
在SEWC的知识图谱项目中，他们使用的是AWS上的Netpune作为Graph database，在PPT中其使用的是Gemlin查询语言。之前只接触过Neo4j的Cypher，以及W3C规定的SPARQL，故学习了一下，发现还挺好用。

# Apache TinkerPop
Apache TinkerPop™ is a graph computing framework for both graph databases (OLTP) and graph analytic systems (OLAP).
简单说TinkerPop是个框架，只要支持这个框架，就支持Gremlin语言，就可以实现write once，run everywhere。但现实是截至目前，各个图数据库对Gremlin的支持程度不一，实现的颗粒度和细节也不一致。
官网： https://tinkerpop.apache.org/index.html

# Tutorial
https://tinkerpop.apache.org/docs/3.6.2/tutorials/getting-started/
跟着做就可以，比SPARQL容易得多。

# 与SPARQL区别
1. Gremlin是图遍历语言，所以在