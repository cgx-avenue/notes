# 工具
## requests-html
Requests-HTML: HTML Parsing for Humans™
https://github.com/psf/requests-html


# python做界面
## nicegui



## fastui


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
![[imgs/Pasted image 20231102145459.png]]





