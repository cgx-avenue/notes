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
1. Gremlin是图遍历语言，所以查询时考虑更多的是如何从顶点vertex沿着边edge走到某个vertex或者edge上去寻找对应的property和value。而SPARQL是基于RDF三元组，查询时类似SQL的语法。从逻辑上而言，Gremlin更贴合图本身的特点。而SPARQL还是传统的SQL思维。
2. 两者都需要提前知道要查找的东西，或者说预定义好要查找的东西。比如Gremlin的property，RDF中的谓语组。
3. 从语法上而言，Gremlin更简洁和易读易用。SPARQL单单那一堆问号定义的变量，看起来就让人头疼。Gremlin更符合面向对象和函数式编程的写法，简洁流畅。
4. 从数据集和数据库的支持上，SPARQL明显多一些。但真相是Graph数据库到目前为止，没有统一的标准，或者说不像RDBMS那样在范式上统一。所以实际使用时都需要结合具体使用的数据库。