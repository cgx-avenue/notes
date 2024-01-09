# 教程和资源
1. https://github.com/eclipse-edc
2. https://github.com/eclipse-tractusx/tutorial-resources/tree/main/mxd
3. https://github.com/eclipse-edc/MinimumViableDataspace
4. Introductory videos: https://www.youtube.com/@eclipsedataspaceconnector9622/featured
5. 

# 概念和组成
## Dataspace
Data spaces allow organizations to securely share data with others. They enable data cooperation in a multi-cloud federation by focusing on identity, trust, sovereignty, and interoperability.

- Identity: Each participant remains in control of their identity.
- Trust: Each participant decides who to trust.
- Sovereignty: Each participant decides under what policies their data is shared.
- Interoperability: Each participant remains in control of their deployment.

## Dataspace connector
mainly focuses on these aspects while ensuring data sovereignty along the entire data supply and value chain.
![[imgs/Pasted image 20240104093340.png]]
### About EDC
A data-sharing system requires a protocol implementation for policy enforcement among participants. The EDC will implement the **International Data Spaces (IDS) standard** as well as relevant protocols and requirements associated with **Gaia-X**.

### EDC vs. DSC
DSC is Dataspace Connector. 两者code不同，但是遵循同样的sovereign data spaces理念。DSC之前是Fraunhofer ISST开发的，目标是给catana-x,gaia-x等等提供IDS兼容的connector。后来搞不下去了，决定由Eclipse Foundation继续。交接之后，Thereby, the EDC can support IDS(A)-based components like the DAPS (Identity), or Metadata Broker (Catalog) as well as other approaches like WEB-DID (Identity) or Federated Catalog (Catalog).

### Distribution
参见下面怎么用第2点。

### Extention
new capabilities -> Extention
they are dynamically loaded at startup to extend the functionality of a runtime. For example, adding you favorite authentication backend can be done through extensions.

### Control plane
API object in detail. API here menas Management API.
这里就牵扯到JSON-LD，ODRL和DCAT等等。这些组合起来定义了Asset，policy，contract等等。

#### Assets
存储metadata，不包含实际数据。比如`DataAddress`字段。
例子参见文档。
#### Policy
Policies are used to express what requirements a subject (e.g. a communication partner) must satisfy in order to be able to perform an action.
Policies are [ODRL](https://www.w3.org/TR/odrl-model/) serialized as JSON-LD.
例子参见文档。
Policy可以多个，可以组合。

#### Contract definition
Contract definitions are how [assets](https://eclipse-edc.github.io/docs/#/documentation/developer/handbook?id=assets) and [policies](https://eclipse-edc.github.io/docs/#/documentation/developer/handbook?id=policies) are linked together, comprised of a _contract policy_ and an _access policy_. 
- **access policy**: determines whether a particular consumer is offered an asset or not. For example, we may want to restrict certain assets such that only consumers within a particular geography can see them. Consumers outside that geography wouldn't even have them in their [catalog](https://eclipse-edc.github.io/docs/#/documentation/developer/handbook?id=catalog).
- **contract policy**: determines the conditions for initiating a contract negotiation for a particular asset. Note that does not automatically guarantee the successful _creation_ of a contract, it merely expresses the _eligibility_ to start the negotiation.
首先要有access，其次再检查是不是满足contract policy。
例子参见文档。

#### Contract negotiations
满足了contract policy，才能发起negotiate。
Contract negotiations have a few key aspects:
- they target _one_ asset
- they take place between a _provider_ and a _consumer_ connector
- they cannot be changed by the user directly
- users can only be decline, terminate or cancel them
注意，contract offers不会被存储，更不会背查询。换句话说，不会被追溯？

Contract aggrements
双方都达到`FINALIZED`状态才行，永远是provider给最终approval。包含最终policy，asset id和签发日期。

#### Catalog
The catalog contains the "data offerings" of a connector and one or multiple service endpoints to initiate a negotiation for those offerings.
Dataset object标识了every data offerring。

#### Tranfer process
记录数据传送。

### Data plane
纯粹的数据传输数据流，实际当中类似于使用http server。

# 怎么用
1. The Eclipse Dataspace Components projects is **not** a ready-to-use application, but rather a comprehensive collection of libraries and modules, that are published as Maven artifacts, and that developers can use and extend.
2. 分发的是什么？distribution。 
```markdown
In the EDC terminology, a "distribution" is an executable fat jar file, that consists of a compilation of specific EDC modules. It is sometimes sloppily referred to as "runtime", which is not _quite_ correct, but it does loosely compare to the notion of a Linux distribution.

Typically, distributions consist of a [control plane](https://eclipse-edc.github.io/docs/#/documentation/developer/handbook?id=the-control-plane) and one or more [data planes](https://eclipse-edc.github.io/docs/#/documentation/developer/handbook?id=the-data-plane). The former takes care of data manipulation, contract negotiation and transfer setup, and is geared toward reliability, whereas the job of the latter is to actually shovel bits from A to B.
```
举个例子，是一个gradle build 文件。https://eclipse-edc.github.io/docs/#/documentation/docs/samples/basic/basic-01-basic-connector/
3. JSON-LD文件的作用，和ORDL，DCAT等。



# 知识点和术语
~~1. JSON-LD https://json-ld.org/~~
2. Terminology
* connector: can be a standalone application. could be run in docker container or embedded into another java application. `A concept of a gateway into a data space`. 
	* connector: a control plane runtime and 1...N data plane runtimes. Sometimes used interchangeably with _distribution_.
* extension: an implementation of an interface which resides in the api which enriches the core with functionality
- runtime: a Java process executing code written in the EDC programming model (e.g. a control plane)
	- a class defines a main method
- distribution: a specific assortment of modules, compiled into a runnable form, e.g. a JAR file, a Docker image etc.
	- Typically, consists of a control plane and one or more data planes.
- launcher: a runnable Java module, that pulls in other modules to form a distribution, sometimes used synonymously with distribution.
~~3. OpenTelemetry~~
~~4. jaegar~~
~~5. micrometer~~
~~6. prometheus~~
7. terraform




# 仓库和目录解析
## Connector
https://github.com/eclipse-edc/Connector
视频讲解列表
https://www.youtube.com/watch?v=_YiSzTALTCA&list=PLw-f_YoTxWJVVPkuj1vDb6tLPM2_Cm1hR&index=2
### 目录结构
1. spi
service provider interface. 最重要的目录，修改啥都要改里面的东西。
2. core
各种基础服务。
3. data-protocol
包含connector-to-connector通信的内容。
4. extensions
为了各种功能的扩展，比如扩展不同类型的数据库。

## core classes and items
1. vault
something that can store secrets securely
vault.java and other .java files
2. monitor
a monitor is essentially a logger
3. Transfer process manager
4. Provision manager
5. 

# Contract negotiation & transfer process
![[imgs/Pasted image 20240109110619.png]]



# 搭建过程



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

