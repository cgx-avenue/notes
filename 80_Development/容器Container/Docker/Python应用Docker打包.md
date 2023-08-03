主要是根据Refs 1
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