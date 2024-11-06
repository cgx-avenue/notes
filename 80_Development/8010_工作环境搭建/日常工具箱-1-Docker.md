
# 汇总
- 能共用的组件需要尽量共用，比如postgresql，mysql等。
- 端口设置，不能重复。
- 用户名除了应用固定的，大多数都用`admin`之类即可。
- 密码要求高的，就用`WJZHNL7F3@Wx`，简单的就用`siemens`之类。

| 分类  | 容器               | 端口       | 用户名      | 密码           | 其他设置               |
| --- | ---------------- | -------- | -------- | ------------ | ------------------ |
| 管理  | Portainer        | 9443     | admin    | WJZHNL7F3@Wx | windows平台不需要       |
| 管理  | Heimdall         | 180,1443 |          |              |                    |
| 数据库 | MySQL 8.3        | 3306     | root     | siemens      |                    |
| 数据库 | Postgres14       | 5432     | postgres | postgres     |                    |
| 数据库 | Neo4J            | 7687     | neo4j    | siemens      | bolt://neo4j:7687' |
| 工具  | MyIP             | 18966    |          |              | dell上是8966端口       |
|     | manyfold         | 3214     |          |              |                    |
|     | it-tools         | 18080    |          |              |                    |
|     | strling-pdf      | 28080    |          |              |                    |
|     | qinglong         | 5700     | admin    | siemens      |                    |
|     | OpenWebUI        | 3080     |          |              |                    |
| 工作  | Node-red         | 1880     |          |              |                    |
|     | jupyter notebook | 10000    |          |              |                    |
| 生活  | how-to-cook      | 15000    |          |              |                    |




# 管理
## 1. Portainer
https://github.com/portainer/portainer
https://docs.portainer.io/

Linux安装:
https://docs.portainer.io/start/install-ce/server/docker/linux
```bash
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.4
```

我过去的安装教程
[[../../20_瞎折腾/小小服务器/树莓派4B]]
如果有局域网环境，别忘了使用`portainer_agent`来互相访问[[../../20_瞎折腾/小小服务器/Portainer访问加载其他Docker环境]]

## 2. Docker Desktop
Windows平台专属

## 3. Heimdall
应用导航的，https://github.com/linuxserver/Heimdall
注意配置应用时候可能需要`http(s)://docker_name:port` 格式。
```shell
docker run -d \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 180:80 \
  -p 1443:443 \
  -v /path/to/heimdall/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/heimdall:latest

```


# 数据库
## 1. MySQL
要8.0版本的
https://blog.csdn.net/donkor_/article/details/139879575
windows上的
https://blog.csdn.net/github_39770867/article/details/141949580
记得设置允许远程访问

Linux版本
```shell
docker run \
-p 3306:3306 \
--restart=always \
--name mysql \
--privileged=true \
-v /home/mysql/log:/var/log/mysql \
-v /home/mysql/data:/var/lib/mysql \
-v /home/mysql/conf/my.cnf:/etc/mysql/my.cnf \
-e MYSQL_ROOT_PASSWORD=siemens \
-d mysql:8.3.0  

```


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
图数据库的唯一选择？注意下面的安装了apoc插件，允许跨域访问。

```yml
neo4j:

	image: neo4j:5.22.0
	
	# container_name: neo4j
	
	restart: always
	
	# ports:
	
	# - 7474:7474
	
	# - 7687:7687
	
	volumes:
	
	- "./data:/var/lib/neo4j/data"
	
	- "./logs:/var/lib/neo4j/logs"
	
	environment:
	
	# initial username: neo4j, password: hackathontemplates
	
	- NEO4J_AUTH=neo4j/siemens
	
	# install apoc plugin to allow remote access to neo4j
	
	- NEO4J_PLUGINS=["apoc"]
```


# 工具
## 1. MyIP
https://github.com/jason5ng32/MyIP
查看真实ip的
```shell
docker run -d -p 18966:18966 --name myip --restart always jason5ng32/myip:latest
```

## 2. manyfold
https://github.com/manyfold3d/manyfold
存放3d打印的models，挺好用
https://manyfold.app/get-started/docker
用docker-compose，依赖一个postgres，一个redis
```yml
services:
  app:
    image: ghcr.io/manyfold3d/manyfold:latest
    ports:
      - 3214:3214
    volumes:
      - /path/to/your/libraries:/libraries
    environment:
      DATABASE_ADAPTER: postgresql # mysql2 or sqlite3 are also supported
      DATABASE_HOST: postgres-server
      DATABASE_NAME: manyfold # or the path to the database file if using sqlite3
      DATABASE_USER: manyfold
      DATABASE_PASSWORD: password
      SECRET_KEY_BASE: a_nice_long_random_string
      REDIS_URL: redis://redis-server:6379/1
      PUID: 1000
      PGID: 1000
      # For details of other optional environment variables, including features such
      # as multiuser mode, visit https://manyfold.app/sysadmin/configuration.html
    restart: unless-stopped
    depends_on:
      - postgres-server
      - redis-server
    networks:
      - manyfold
    # Optional, but recommended for better security
    security_opt:
      - no-new-privileges:true
    cap_drop:
      - ALL
    cap_add:
      - CHOWN
      - DAC_OVERRIDE
      - SETUID
      - SETGID

  postgres-server:
    image: postgres:15
    volumes:
      - db_data:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: manyfold
      POSTGRES_PASSWORD: password
    restart: unless-stopped
    networks:
      - manyfold

  redis-server:
    image: redis:7
    restart: unless-stopped
    networks:
      - manyfold

volumes:
  db_data:

networks:
  manyfold:

```

## 3. it-tools
https://github.com/CorentinTh/it-tools
```shell
docker run -d --name it-tools --restart unless-stopped -p 18080:80 corentinth/it-tools:latest
```

## 4. Stirling-PDF
https://github.com/Stirling-Tools/Stirling-PDF
```shell
docker run -d \
  -p 28080:8080 \
  -v ./trainingData:/usr/share/tessdata \
  -v ./extraConfigs:/configs \
  -v ./logs:/logs \
# Optional customization (not required)
# -v /location/of/customFiles:/customFiles \
  -e DOCKER_ENABLE_SECURITY=false \
  -e INSTALL_BOOK_AND_ADVANCED_HTML_OPS=false \
  -e LANGS=en_GB \
  --name stirling-pdf \
  frooodle/s-pdf:latest
```

## 5. qinglong
青龙面板，不用说了。https://github.com/whyour/qinglong
库每次自己找就行了
```shell
# curl -sSL get.docker.com | sh
docker run -dit \
  -v $PWD/ql/data:/ql/data \
  # 冒号后面的 5700 为默认端口，如果设置了 QlPort, 需要跟 QlPort 保持一致
  -p 5700:5700 \
  # 部署路径非必须，比如 /test
  -e QlBaseUrl="/" \
  # 部署端口非必须，当使用 host 模式时，可以设置服务启动后的端口，默认 5700
  -e QlPort="5700" \
  --name qinglong \
  --hostname qinglong \
  --restart unless-stopped \
  whyour/qinglong:latest
```

## 6. OpenWebUI
https://docs.openwebui.com/#quick-start-with-docker--recommended
这个需要先安装ollama[[日常工具箱-2-单体软件]]
```shell
docker run -d -p 3080:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```

## 7. HivisionIDPhotos
https://github.com/Zeyi-Lin/HivisionIDPhotos
HivisionIDPhotos: a lightweight and efficient AI ID photos tools. 一个轻量级的AI证件照制作算法。
关键是快速使用，换底色等等

# 工作相关
## 1. Node-red
https://nodered.org/docs/getting-started/docker
```shell
docker run -it -p 1880:1880 -v node_red_data:/data --name mynodered nodered/node-red
```
https://blog.csdn.net/zonghengzhikong/article/details/140017649

## 2. jupyterlab
https://jupyter-docker-stacks.readthedocs.io/en/latest/
https://docs.docker.com/guides/jupyter/
当然支持docker部署，但我没用过，下次试试。
```shell
docker run -p 10000:8888 quay.io/jupyter/scipy-notebook:2024-10-07
```

# 生活
## 1. 程序员做饭指南
https://github.com/Anduin2017/HowToCook
```shell
docker pull ghcr.io/anduin2017/how-to-cook:latest
docker run -d -p 15000:5000 ghcr.io/anduin2017/how-to-cook:latest
```



# 参考
1. https://github.com/coracoo/awesome_docker_cn
2. 