# 教程和资源
1. https://github.com/eclipse-edc
2. https://github.com/eclipse-tractusx/tutorial-resources/tree/main/mxd
3. https://github.com/eclipse-edc/MinimumViableDataspace
4. Introductory videos: https://www.youtube.com/@eclipsedataspaceconnector9622/featured full videos: https://www.youtube.com/@eclipsedataspaceconnector9622/videos
5. https://eclipse-edc.github.io/docs/#/documentation/developer/handbook?id=the-data-plane

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

##### Contract aggrements
双方都达到`FINALIZED`状态才行，永远是provider给最终approval。包含最终policy，asset id和签发日期。

#### Catalog
The catalog contains the "data offerings" of a connector and one or multiple service endpoints to initiate a negotiation for those offerings.
Dataset object标识了every data offerring。

#### Tranfer process
记录数据传送。

### Data plane
纯粹的数据传输数据流，实际当中类似于使用http server。

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
~~7. terraform~~

# EDC documentation
https://eclipse-edc.github.io/docs/#/README
再看一遍EDC的文档。

## 关于protocol和policy
EDC will implement the International Data Spaces (IDS) standard as well as relevant protocols and requirements associated with Gaia-X, and thereby provide implementation and feedback to these initiatives.

## 开箱即用？
Eclipse Dataspace Components projects is not a ready-to-use application, but rather a comprehensive collection of libraries and modules, that are published as Maven artifacts, and that developers can use and extend.