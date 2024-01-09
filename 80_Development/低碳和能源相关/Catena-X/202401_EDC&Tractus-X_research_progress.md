# Topics
1. EDC vs. Tractus-X EDC
2. Tractus-X vs. Catena-X
3. EDC 概念和组成
4. 现在存在的问题
	1. EDC
	2. Tractus-X
5. Discussion：Use case
6. Competencies needed
7. 其它
	1. 代码quick look
		1. EDC，TX目录结构，json配置
		2. samples
	2. Catena-X blockchain[[Catena-X_blockchain]]


# 1. EDC 对比Tractus-X EDC
| EDC                           | Tractus-X                        |
| ----------------------------- | -------------------------------- |
| Eclipse Foundation            | Catena-X                         |
| MVD: minimum viable dataspace | MXD: minimum Tractus-X Dataspace |
| Java                          | K8S, helm charts                 |
| various                       | Azure, AWS                       |
|                               | EDR API for simplified negotiation                                 |

EDC是基类，Tractus-X是子类。

## TX-EDC比EDC多封装了什么？
* K8s环境
* helm charts
* identity key vault
* 数据库
* 各种extension https://eclipse-tractusx.github.io/docs-kits/kits/tractusx-edc/docs/kit/operation-view/page10_extensions
举例：
3种control-plane
2种data-plane

![[imgs/Pasted image 20240109094408.png]]



# 2. Tractus-X vs. Catena-X
Tractus-X是Catena-X开源项目。
从不同的角度出发，Tractux-X聚焦在Developer和App provider。
![[imgs/Pasted image 20240109095158.png]]
https://eclipse-tractusx.github.io/
EDC 是
![[imgs/Pasted image 20240109162447.png]]




# 3. EDC概念和组成
[[Eclipse-EDC_notes]]
以Contract negotiation&transfer process为例。
# 4. 目前存在的问题
## EDC
[[Eclipse-EDC_notes]]

## TX
[[Tractus-X_ntoes]]

# 5. Discussion：Use case
[[我们能做的]]

# 6. Competecies needed
## EDC
Java, gradle, json-ld, dcat, ordl, etc.
## TX
docker, k8s, kind, terraform, stern, etc.
## Others
OpenTelemetry, jaegar, micrometer, prometheus

# 7. 其它
## 1. 代码quick look
https://github.com/eclipse-edc/Connector
https://github.com/eclipse-edc/Samples
https://github.com/eclipse-tractusx/tractusx-edc
https://github.com/eclipse-edc/MinimumViableDataspace/tree/main
https://github.com/eclipse-tractusx/tutorial-resources/blob/main/mxd/README.md
## 2. catena-x blockchain
[[Catena-X_blockchain]]
