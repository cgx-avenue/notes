


# 4. superset
[superset](https://github.com/apache/superset)：企业级的数据探索、展示平台。功能很强大，可以用来做数据分析、展示。如下图：
![[imgs/Pasted image 20231102151037.png]]

# 5. amazing-qr
[amazing-qr](https://github.com/x-hw/amazing-qr)：Python 写的生成动态、彩色、各式各样的二维码，详细的[中文文档](https://github.com/sylnsfar/qrcode/blob/master/README-cn.md)，通过 `qrcode` 生成的二维码样式如下

# 6. flask-limiter
[flask-limiter](https://github.com/alisaifee/flask-limiter)：一个 Flask 的扩展库，它可以根据访问者的 IP 限制其访问频率、次数等


# 8. sh
[sh](https://github.com/amoffat/sh)：sh 是一个成熟，用于替代 subprocess，它允许你调用任何程序，就像它是一个函数，支持 Python2.6 - 3.5
```python
from sh import ifconfig
print ifconfig("eth0")
```

# 9. python-fire
[python-fire](https://github.com/google/python-fire)：Fire 是 Google 开源的 Python 库，可自动将您的代码转变成 CLI，无需您做任何额外工作。您不必定义参数，设置帮助信息，或者编写定义代码运行方式的 main 函数。相反，您只需从 main 模块调用“Fire”函数，其余工作全部交由 Python Fire 来完成。示例代码如下：

# 11. freezegun
[freezegun](https://github.com/spulec/freezegun)：时间漫步模块，模拟到某一个时间，使用简单方式多样，实现了装饰器、上下文等调用方式。示例代码如下：

```python
from freezegun import freeze_time
import datetime
import unittest


@freeze_time("2012-01-14")
def test():
    assert datetime.datetime.now() == datetime.datetime(2012, 1, 14)
```

# 12. faker
[faker](https://github.com/joke2k/faker)：用于生成假数据的库，支持多种语言，你值得拥有。示例代码：
```python
fake.address()
# '辽宁省雪市静安廉街b座 998259'

fake.street_address()
# '巢湖街U座'

fake.building_number()
# 'x座'

fake.city_suffix()
# '市'

fake.latitude()
# Decimal('-0.295126')

fake.province()
# '湖北省'
```



# 15. tqdm
python 进度条 https://github.com/tqdm/tqdm


# 17. wtfpython
[wtfpython](https://github.com/satwikkansal/wtfpython)：有趣、令人惊讶（坑爹）、鲜为人知的 Python 代码片段集合。[中文](https://github.com/leisurelicht/wtfpython-cn)

# 18. awesome-python
[awesome-python-applications](https://github.com/mahmoud/awesome-python-applications)：（英文）介绍 Python 有趣、神奇的开源项目。目前涵盖多个领域、项目丰富

# 19. click
[click](https://github.com/pallets/click)：Python 的第三方库，用于快速创建命令行。支持装饰器方式调用、多种参数类型、自动生成帮助信息等。示例代码如下：
```bash
import click

@click.command()
@click.option("--count", default=1, help="Number of greetings.")
@click.option("--name", prompt="Your name",
              help="The person to greet.")
def hello(count, name):
    """Simple program that greets NAME for a total of COUNT times."""
    for _ in range(count):
        click.echo("Hello, %s!" % name)

if __name__ == '__main__':
    hello()

# 下面为运行效果
$ python hello.py --count=3
Your name: Click
Hello, Click!
Hello, Click!
Hello, Click!
```


# 21. dash
[dash](https://github.com/plotly/dash)：一款只用几百行 Python 代码就可以轻易实现数据分析可视化的利器，是目前 Python 社区数据可视化主要的工具之一。具有：使用简单、易于扩展、开发团队活跃等特点

# 22. city-vein
[city-vein](https://github.com/antct/city-vein)：用公交路线数据，还原城市结构。通过数据可视化手段，还原了 30 多个城市的城市结构。该项目中有数据获取和处理的脚本，而且该项目充分体现了数据可视化带来的便利和效果，易于激发学习编程的热情。

# 23. arrow
[arrow](https://github.com/arrow-py/arrow)：还在为处理时间、时区、转化、夏令时等问题而头疼吗？这个 Python 的第三方时间库。提供了更便捷的方式来创建、操作和格式化时间和日期，用更少的代码来处理时间和日期。

# 24. psutil
一个跨平台库的进程和系统资源监控、管理库。用于查看有关正在运行的进程和系统利用率，如 CPU、内存、磁盘、网络等信息。 实现了 UNIX 命令行工具提供的许多功能，例如：ps、top、lsof、netstat、ifconfig 等，支持 Linux、Windows、macOS 等系统。学会了这个库，就可以通过 Python 脚本做更多有趣的事情了。

# 25.  merory_profile
[memory_profiler](https://github.com/pythonprofilers/memory_profiler)：Python 程序内存占用分析工具。示例代码：
```python
# 采用装饰器的方式引用，不影响现有代码
@profile
def my_func():
    a = [1] * (10 ** 6)
    b = [2] * (2 * 10 ** 7)
    del b
    return a

if __name__ == '__main__':
    my_func()

# 运行命令：python -m memory_profiler example.py
# 输出：
Line #    Mem usage  Increment   Line Contents
==============================================
     3                           @profile
     4      5.97 MB    0.00 MB   def my_func():
     5     13.61 MB    7.64 MB       a = [1] * (10 ** 6)
     6    166.20 MB  152.59 MB       b = [2] * (2 * 10 ** 7)
     7     13.61 MB -152.59 MB       del b
     8     13.61 MB    0.00 MB       return a
```


# 28. python-small-examples
https://github.com/jackzhenguo/python-small-examples


# 30. python-dotenv
[python-dotenv](https://github.com/theskumar/python-dotenv)：帮你更好的管理 Python 项目中敏感配置信息的开源三方库。在项目中会有一些数据库、账户、KEY 等敏感信息，这些信息最好不要写在源代码中。为了降低泄漏风险，一般会通过环境变量来设置，这个库可以很方便帮你在 Python 项目中管理这些信息。示例代码：

```python
# 安装：pip install -U python-dotenv
# 目录结构：
.
├── .env
└── settings.py
# 示例代码
# settings.py
import os
from dotenv import load_dotenv
load_dotenv()

SECRET_KEY = os.getenv("EMAIL")
DATABASE_PASSWORD = os.getenv("DATABASE_PASSWORD")
```



# 33. moviepy
[moviepy](https://github.com/Zulko/moviepy)：用于处理视频的 Python 库，它支持视频剪辑、自定义效果、视频合成、格式转化、插入文字等功能。专于注视频但不局限于此，还支持处理音频和 GIF 图片。虽然现在视频剪辑的工具很丰富，但如果要批量处理视频，用 Python+moviepy 写个脚本应该可以一劳永逸，节省时间

# 34. tinker-designer
[Tkinter-Designer](https://github.com/ParthJadhav/Tkinter-Designer)：用拖动的方式创建漂亮的桌面软件。它的操作十分简单，首先在 Figma 网站通过拖拽的方式构建应用，然后把设计好的应用地址和 token 输入到 Tkinter-Designer 自动生成 Python 代码，最后就能得到界面简洁大方的桌面应用啦。不用代码做出基于 tkinter 的桌面应用



# 36. label-studio
[label-studio](https://github.com/HumanSignal/label-studio)：开源的数据标注工具。支持音频、文本、图像、视频、时间序列等，多种类型数据的标注和注释工具。

# 37. schedule
[schedule](https://github.com/dbader/schedule)：简单友好的 Python 任务调度库。该项目人性化的 API 设计，让开发者仅用几行代码就能轻松实现定时任务。它不依赖任何第三方库，全部代码也就一个文件 800 多行，拥有丰富的注释和单元测试，源码阅读起来十分轻松。


# 39. openpilot
[openpilot](https://github.com/commaai/openpilot)：comma.ai 开源的自动驾驶系统

# 40. python-systemd
[python-systemd-tutorial](https://github.com/torfsen/python-systemd-tutorial)：用 Python 编写 systemd 服务的教程。许多 Linux 发行版都用 systemd 来管理系统的服务，比如开机启动、自动重启、守护进程等。该项目讲解了如何入门 systemd，并提供了一个 Python 脚本和 systemd unit 文件，可以在此基础上快速开发出 systemd 服务。

# 41. mercury
[mercury](https://github.com/mljar/mercury)：能够将 Jupyter Notebook 变成 Web 应用的框架。该项目可以让你在 Python Notebook 中添加交互式部件，实现自动生成一个漂亮的 Web 应用，方便分享和展示你的成果。

# 42. musicpy
[musicpy](https://github.com/Rainbow-Dreamer/musicpy)：用 Python 创作音乐。该项目可以用简洁的 Python 代码生成一段音乐，它提供了和弦、音符和音阶等几个基本类型，需要具备一定的音理基础才能上手。

# 43. donkeycar
https://github.com/autorope/donkeycar

# 44. cudf
[cudf](https://github.com/rapidsai/cudf)：支持 GPU 的数据库处理 Python 库。它相当于支持 GPU 的 pandas，处理数据的速度直接起飞。提供了类似 pandas 的 API，支持加载、合并、聚合、过滤等方式操作数据。

# 45. nvitop
[nvitop](https://github.com/XuehaiPan/nvitop)：用 top 命令的方式查看 NVIDIA GPU 和进程状态。这是一款 NVIDIA 设备和进程监控工具，拥有多彩高亮的界面，实时更新的进程和设备信息，支持过滤进程、鼠标控制、发送信号等功能。


# 47. python-holidays
[python-holidays](https://github.com/vacanza/python-holidays)：处理假期的 Python 库。该项目支持动态生成国家/地区和省份公布的法定节假日，可以快速地判断指定日期是否为节假日。

# 48. pyetho
Exploring Global Diversity: Pyetho — Python Library for Language and Country Insights
https://medium.com/@i18nsolutionspy/exploring-global-diversity-pyetho-python-library-for-language-and-country-insights-4a688958ea83
返回每个国家的语言，按照ISO标准。
![[imgs/Pasted image 20231124151104.png]]
中国的居然有这么多。

# 49. keep
https://github.com/keephq/keep
报警管理和自动化库，可以连接到不同的前端接受多种报警系统，然后建立workflow来自动化执行一些工作。
>Keep makes it easy to consolidate all your alerts into a single pane of glass and to orchestrate workflows to automate your end-to-end processes.

# 50. cleanlab
The standard data-centric AI package for data quality and machine learning with messy, real-world data and labels.
https://github.com/cleanlab/cleanlab


# 51. Self-operating-computer
[self-operating-computer：使多模态模型能够操作计算机](https://github.com/OthersideAI/self-operating-computer)

这是近期基于 GPT-4v 的最火项目之一。让大语言模型像人类一样查看屏幕内容，操作鼠标和键盘来实现特定的目标。当前的挑战是 GPT-4v 在鼠标点击位置方面的错误率很高。（star 5.1K）


# 52. wechatmsg
[WeChatMsg：导出微信聊天记录成 HTML/Word/CSV文档](https://github.com/LC044/WeChatMsg)

本周火爆朋友圈的项目，作者是一名在校大学生。支持导出微信聊天记录，支持生成年度聊天报告。Slogan 不错：“我的数据我做主”。可以导出数据用于训练个人 AI！（star 12.5K）

# 53. pywxdump
[PyWxDump：获取微信账号信息、导出聊天记录](https://github.com/xaoyaoo/PyWxDump)

这是上一个项目的依赖，可解密数据库，查看和导出聊天记录，支持微信多开场景获取多用户信息。（star 1.6K）（PS. 总感觉这两个项目会被某信针对，你觉得呢？）

# 54. python-systemd-tutorial
https://github.com/torfsen/python-systemd-tutorial
A tutorial for writing a systemd service in Python



