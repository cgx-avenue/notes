# python -m 是什么意思
![[../../../00_日记/天/imgs/Pasted image 20240103133437.png]]
把python module当成脚本来执行
对于“python -m name”，一句话解释：**Python 会检索`sys.path` ，查找名字为“name”的模块或者包（含命名空间包），并将其内容当成“__main__”模块来执行。**


Refs：
1. https://pythoncat.top/posts/2019-11-10-m
2. https://www.blog.dailydoseofds.com/p/python-m-the-coolest-python-flag

