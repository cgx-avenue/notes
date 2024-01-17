# Video notes
[[Catena-X_Videos_notes]]


# 名词和tech
1. keycloak
2. kind
3. terraform
4. 

## opentelemetry
官网 https://opentelemetry.io/docs/what-is-opentelemetry/
入门介绍 https://cloud.tencent.com/developer/article/2327988
obserability 介绍， ot背景和历史介绍 https://zhuanlan.zhihu.com/p/365398397

## opentelemetry + jaegar
ot是一组api和sdk，用来监控metrics，log，traces
jaegar是一组backend服务，用来转接和处理数据

## micrometer + promethus
前者是类似slf4j，但不关注log，更多的关注metrics。 后者是内存中的数据库，可以用来存储一些指标