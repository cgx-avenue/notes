下面的在SQL查询IDE当中使用，
```postgresql
--查看版本
select VERSION();
--查看当前PG库所安装的插件
select * from pg_available_extensions;
--查看插件信息
select * from pg_availabe_extensions where name like 'timescaledb'
```


