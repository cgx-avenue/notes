# 工具
## requests-html
Requests-HTML: HTML Parsing for Humans™
https://github.com/psf/requests-html

# 静态网站
## Pelican
https://docs.getpelican.com/en/latest/
Pelican is a static site generator, written in [Python](https://www.python.org/). Highlights include:

- Write your content directly with your editor of choice in [reStructuredText](http://docutils.sourceforge.net/rst.html) or [Markdown](https://daringfireball.net/projects/markdown/) formats




# python做web（或前后端一起）
就是后台写好一切，然后推送到client渲染。最开始通过nicegui注意到，然后发现了更强大的fastui，找机会试试看。
## nicegui
https://github.com/zauberzeug/nicegui
Create web-based user interfaces with Python. The nice way.
vue+fastapi

## fastui
https://github.com/pydantic/FastUI
Build better UIs faster.

## reflex
web apps in pure python
https://github.com/reflex-dev/reflex
https://reflex.dev/blog/2024-03-21-reflex-architecture/
react+fastapi

# restful接口
## fastapi
[fastapi](https://github.com/tiangolo/fastapi)：基于 Python 3.6+ 的高性能 Web 框架。“人如其名”用 FastAPI 写接口那叫一个快、调试方便，Python 在进步而它基于这些进步，让 Web 开发变得更快、更强。示例代码：

```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def read_root():
    return {"Hello": "World"}

@app.get("/items/{item_id}")
async def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}

# 启动命令：uvicorn main:app --reload
```



# 现成框架
## flask-admin
[flask-admin](https://github.com/flask-admin/flask-admin)：我工作中需要写一个微型的管理系统，用的就是这个框架。简直快餐型，页面都写好了，只要设置好相关配置就可以跑起来了。唯一缺点就是文档中的例子少，开发一些特定的需求需要自己看源码，才能知道如何改。[文档](https://flask-admin.readthedocs.io/en/latest/)，下面是我跑起来之后的样子：
![[../../../_assets/img/Pasted image 20231102145459.png]]





