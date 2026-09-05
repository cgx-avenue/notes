# 简介
pgvector是postgresql的一款扩展，用来实现存储vector数据。本质是添加了vector这种数据类型来支持。
[pgvector/pgvector: Open-source vector similarity search for Postgres (github.com)](https://github.com/pgvector/pgvector)

# 安装
我没使用git clone，然后make这种方式。我是参照的[pgvector/pgvector: Open-source vector similarity search for Postgres (github.com)](https://github.com/pgvector/pgvector#installation-notes---windows) 里apt的安装方式，我用的postgres14版本，因此
```bash
sudo apt install posgresql-14-pgvector
```
之后在需要添加的数据库里
```sql
create extension vector;
```
# 使用
[Pgvector：如何轻松将PostgreSQL转变为矢量数据库 – AI StartUps Product Information, Reviews, Latest Updates (cheatsheet.md)](https://cheatsheet.md/zh/vector-database/pgvector.zh)
[pgvector/pgvector: Open-source vector similarity search for Postgres (github.com)](https://github.com/pgvector/pgvector)
1. 注意几种距离的定义和使用：
- `<->` - L2 distance
- `<#>` - (negative) inner product
- `<=>` - cosine distance
- `<+>` - L1 distance (added in 0.7.0)

2. 可以在vector列上建立索引，提升检索速度。
本质是建立内存缓冲区，详细使用参见页面。


# 库
## pgvector-python
[pgvector/pgvector-python: pgvector support for Python (github.com)](https://github.com/pgvector/pgvector-python)
上面有很多例子，慢慢看吧


