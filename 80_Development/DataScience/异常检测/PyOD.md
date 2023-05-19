# 介绍
**[Python Outlier Detection（PyOD）](https://link.zhihu.com/?target=https%3A//github.com/yzhao062/pyod)**是当下最流行的Python异常检测工具库，其主要亮点包括：

-   包括近20种常见的异常检测算法，比如经典的LOF/LOCI/ABOD以及最新的**深度学习**如对抗生成模型（GAN）和**集成异常检测**（outlier ensemble）
-   **支持不同版本的Python**：包括2.7和3.5+；**支持多种操作系统**：windows，macOS和Linux
-   **简单易用且一致的API**，**只需要几行代码就可以完成异常检测**，方便评估大量算法
-   使用JIT和并行化（parallelization）进行优化，加速算法运行及扩展性（scalability），可以处理大量数据

# 安装
```shell
pip install pyod
```

# 算法
[PyOD](https://link.zhihu.com/?target=https%3A//github.com/yzhao062/pyod)提供了约20种异常检测算法（详见图1），部分算法介绍可以参考「[数据挖掘中常见的「异常检测」算法有哪些？](https://www.zhihu.com/question/280696035/answer/417091151)」或异常检测领域的经典教科书[[7]](https://zhuanlan.zhihu.com/p/58313521#ref_7)。同时该工具库也包含了一系列辅助功能，包括数据可视化及结果评估等：
![](imgs/2023-05-19-15-49-22.png)

# API




# Refs
-  [用PyOD工具库进行「异常检测」 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/58313521)
-   **Github地址:** [pyod](https://link.zhihu.com/?target=https%3A//github.com/yzhao062/pyod)
-   **PyPI下载地址:** [pyod](https://link.zhihu.com/?target=https%3A//pypi.org/project/pyod/)
-   **文档与API介绍（英文）**: [Welcome to PyOD documentation!](https://link.zhihu.com/?target=https%3A//pyod.readthedocs.io/en/latest/)
-   **Jupyter Notebook示例（notebooks文件夹）**: [Binder (beta)](https://link.zhihu.com/?target=https%3A//mybinder.org/v2/gh/yzhao062/pyod/master)
-   **JMLR论文:** [PyOD: A Python Toolbox for Scalable Outlier Detection](https://link.zhihu.com/?target=http%3A//www.jmlr.org/papers/volume20/19-011/19-011.pdf)






