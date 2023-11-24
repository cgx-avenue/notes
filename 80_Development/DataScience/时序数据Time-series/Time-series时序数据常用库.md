时序数据time-series是传感器数据中最常见的数据格式，对于时序数据的分析是我们进行数据探索的基础。
除了在Python中常用的通用数据处理框架，比如numpy，pandas，matplotlib等等，还需要一些专门针对time-series处理的库。
之前（FY22）做过给Siemens Faso的indirect sensing，利用的电流数据。当时看了一些时序数据的处理库，比如prophet，LSTM等。最近正好又看到了，一起整理下。

# Tsfresh
这个库主要用来提取特征。
[Tsfresh is a Python time-series feature extraction package](https://tsfresh.com/?ref=timescale.com) that automates the extraction of a significant amount of time-series features. It enables analysts and data scientists to swiftly and effectively extract meaningful insights from time-series data.

Tsfresh can calculate over 800 time-series features out of the box. It includes statistical attributes, spectral characteristics, and additional features that capture various time-series data elements. It offers several customizable settings allowing customers to tailor extracting features to their needs.








# Refs
1. https://www.timescale.com/blog/tools-for-working-with-time-series-analysis-in-python/