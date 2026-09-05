# Video notes
[[Catena-X_notes_Videos]]

# 仓库
1. tutorial-resources mxd https://github.com/eclipse-tractusx/tutorial-resources/tree/main/mxd 跟着这个走 https://github.com/eclipse-tractusx/tutorial-resources/blob/main/mxd/README.md
2. EDC policy playground https://eclipse-tractusx.github.io/tutorial-resources/policy-playground/
3. 

# Database
## Flyway构建工具
[Documentation - Flyway by Redgate • Database Migrations Made Easy. (flywaydb.org)](https://flywaydb.org/documentation/)



# Secret management
## HashiCorp vault
[HashiCorp Vault - Manage Secrets & Protect Sensitive Data](https://www.hashicorp.com/products/vault)


# 名词和tech
1. keycloak
2. kind https://developer.aliyun.com/article/1112675
3. terraform https://www.terraform.io/ https://help.aliyun.com/document_detail/95820.html
4. stern https://github.com/stern/stern

## opentelemetry
官网 https://opentelemetry.io/docs/what-is-opentelemetry/
入门介绍 https://cloud.tencent.com/developer/article/2327988
obserability 介绍， ot背景和历史介绍 https://zhuanlan.zhihu.com/p/365398397

## opentelemetry + jaegar
ot是一组api和sdk，用来监控metrics，log，traces
jaegar是一组backend服务，用来转接和处理数据

## micrometer + promethus
前者是类似slf4j，但不关注log，更多的关注metrics。 后者是内存中的数据库，可以用来存储一些指标