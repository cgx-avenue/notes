# 怎么用
1. The Eclipse Dataspace Components projects is **not** a ready-to-use application, but rather a comprehensive collection of libraries and modules, that are published as Maven artifacts, and that developers can use and extend.
2. 分发的是什么？distribution。 
```markdown
In the EDC terminology, a "distribution" is an executable fat jar file, that consists of a compilation of specific EDC modules. It is sometimes sloppily referred to as "runtime", which is not _quite_ correct, but it does loosely compare to the notion of a Linux distribution.

Typically, distributions consist of a [control plane](https://eclipse-edc.github.io/docs/#/documentation/developer/handbook?id=the-control-plane) and one or more [data planes](https://eclipse-edc.github.io/docs/#/documentation/developer/handbook?id=the-data-plane). The former takes care of data manipulation, contract negotiation and transfer setup, and is geared toward reliability, whereas the job of the latter is to actually shovel bits from A to B.
```
举个例子，是一个gradle build 文件。https://eclipse-edc.github.io/docs/#/documentation/docs/samples/basic/basic-01-basic-connector/
3. JSON-LD文件的作用，和ORDL，DCAT等。

# 问题列表
1. 缺失high-level表述
https://github.com/eclipse-edc/docs/blob/main/developer/handbook.md
Therefore, if you are a solution architect looking for a high-level description on how to integrate EDC, or a developer wanting to contribute to the project itself, this guide is not for you. More suitable resources can be found [here](https://github.com/eclipse-edc/docs/blob/main/docs/documentation) and [here](https://github.com/eclipse-edc/docs/blob/main/docs/documentation/CONTRIBUTING.md) respectively.
两个超链接失效了。除此外，缺失architecture diagram，比如为什么选择用IDS数据，JSON-LD的数据类型选择依据等。
2. 文档不全，文档缺失。比如 https://eclipse-edc.github.io/docs/#/documentation/developer/handbook?id=advanced-policy-concepts
4. provider和consumer是单项的，则如果要实现双向通信，必须要在两个服务器的每个点上，即安装provider，又安装consumer。
5. 一个contract只能一个asset，所以数据源怎么控制？
6. 怎么理解下面这句话？contract definition居然不是双向保存的？！Negotiate时候不是由consumer发起的吗？
```markdown
It is important to note that contract definitions are a _internal objects_, i.e. they **never** leave the realm of the provider, and they are **never** sent to the consumer.
```

4. 为了云环境而adapter，比如dataAddress指向http data
5. 怎么理解下面这句话？
```markdown
contract offers are _ephemeral_ objects as they are generated on-the-fly for a particular participant, and they are never persisted in a database and thus cannot be queried through any API.
```
contract offer是什么？是contract definition不会被存储？还是协商过程中的具体细节和结果不会被存储？

