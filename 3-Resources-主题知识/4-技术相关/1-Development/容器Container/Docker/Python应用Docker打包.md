主要是根据Refs 1

# Debug模式
``` txt
但是呢，在开发应用程序的过程中，更重要的是要快速重新构建和测试，以检查验证过程中的每个中间步骤。为此，web应用程序的开发人员需要依赖于Flask等框架提供的自动重启功能（Debug模式下，修改代码自动重启）。而这一功能也可以在容器中使用。

为了启用自动重启，在启动Docker容器时将主机中的开发目录映射到容器中的app目录。这样Flask就可以监听主机中的文件变化(通过映射)来发现代码更改，并在检测到更改时自动重启应用程序。
```



# 注意
## 使用pipreqs替代 pip freeze
```bash
pip install pipreqs
# generate the dependency of current folder
# format: pip
# e.g. the folder where app.py locates
pipreqs .

```

注意生成的路径，和在dockerfile里面的requirement.txt的路径
## Dockerfile
路径，路径，还是路径。


# Refs
1. https://blog.csdn.net/songlh1234/article/details/110400673
2. https://stackoverflow.com/questions/32390291/pip-freeze-for-only-project-requirements