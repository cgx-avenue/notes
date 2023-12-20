# 教程和资源
1. https://github.com/eclipse-edc
2. https://github.com/eclipse-tractusx/tutorial-resources/tree/main/mxd
3. https://github.com/eclipse-edc/MinimumViableDataspace
4. Introductory videos: https://www.youtube.com/@eclipsedataspaceconnector9622/featured
5. 


# 新的知识点和术语
1. JSON-LD https://json-ld.org/
2. Terminology
- runtime: a Java process executing code written in the EDC programming model (e.g. a control plane)
- distribution: a specific assortment of modules, compiled into a runnable form, e.g. a JAR file, a Docker image etc.
- launcher: a runnable Java module, that pulls in other modules to form a distribution, sometimes used synonymously with distribution.
- connector: a control plane runtime and 1...N data plane runtimes. Sometimes used interchangeably with _distribution_.

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



# 搭建过程

















# 问题列表
1. 缺失high-level表述
https://github.com/eclipse-edc/docs/blob/main/developer/handbook.md
Therefore, if you are a solution architect looking for a high-level description on how to integrate EDC, or a developer wanting to contribute to the project itself, this guide is not for you. More suitable resources can be found [here](https://github.com/eclipse-edc/docs/blob/main/docs/documentation) and [here](https://github.com/eclipse-edc/docs/blob/main/docs/documentation/CONTRIBUTING.md) respectively.
两个超链接失效了。
3. asdf