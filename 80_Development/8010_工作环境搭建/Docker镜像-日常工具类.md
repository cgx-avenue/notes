
# 导航



# 管理
## 1. Portainer
https://github.com/portainer/portainer
https://docs.portainer.io/

我过去的安装教程
[[../../20_瞎折腾/小小服务器/树莓派4B]]
如果有局域网环境，别忘了使用`portainer_agent`来互相访问[[../../20_瞎折腾/小小服务器/Portainer访问加载其他Docker环境]]

## 2. Docker Desktop
Windows平台专属

# 数据库
## 1. MySQL
要8.0版本的
https://blog.csdn.net/donkor_/article/details/139879575
windows上的
https://blog.csdn.net/github_39770867/article/details/141949580
记得设置允许远程访问



## 2. postgresql
同样要注意版本，最好是14.0，同时最好把pgvector的插件也带上（timescaleDB呢？）
docker-compose部分如下，注意image name
```yml
db:

	# below image contains postgres + pgvector
	
	image: ankane/pgvector
	
	restart: always
	
	healthcheck:
	
	test: [ "CMD-SHELL", "pg_isready -U postgres" ]
	
	interval: 3s
	
	timeout: 3s
	
	retries: 10
	
	environment:
	
	- POSTGRES_USER=postgres
	
	- POSTGRES_PASSWORD=postgres
	
	- POSTGRES_DB=postgres
	
	# ports:
	
	# - 5432:5432
	
	volumes:
	
	- database_data:/var/lib/postgresql/data
```

## 3. Neo4J



# 参考
1. https://github.com/coracoo/awesome_docker_cn
2. 