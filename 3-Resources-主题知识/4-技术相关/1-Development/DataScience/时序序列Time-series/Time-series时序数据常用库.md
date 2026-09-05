时序数据time-series是传感器数据中最常见的数据格式，对于时序数据的分析是我们进行数据探索的基础。
除了在Python中常用的通用数据处理框架，比如numpy，pandas，matplotlib等等，还需要一些专门针对time-series处理的库。
之前（FY22）做过给Siemens Faso的indirect sensing，利用的电流数据。当时看了一些时序数据的处理库，比如prophet，LSTM等。最近正好又看到了，一起整理下。

# Tsfresh
这个库主要用来提取特征。
[Tsfresh is a Python time-series feature extraction package](https://tsfresh.com/?ref=timescale.com) that automates the extraction of a significant amount of time-series features. It enables analysts and data scientists to swiftly and effectively extract meaningful insights from time-series data.

Tsfresh can calculate over 800 time-series features out of the box. It includes statistical attributes, spectral characteristics, and additional features that capture various time-series data elements. It offers several customizable settings allowing customers to tailor extracting features to their needs.

# Sktime
sktime是基于scikit-learn的，所以能做的事情更多一些。
[Sktime](https://github.com/sktime/sktime?ref=timescale.com) is an open-source Python machine-learning package specializing in time-series data. It is meant to be interoperable with scikit-learn, which means that while dealing with time-series data, users may take advantage of the capabilities of scikit-learn's algorithms and evaluation metrics.

Sktime is a robust library that works in [tandem with scikit-learn](https://scikit-learn.org/stable/?ref=timescale.com). Interacting with time-series data enables users to use the capabilities of scikit-learn's algorithms and assessment metrics. Sktime offers a wide range of features for time-series analysis operations. These operations include the following:

- Regression
- Grouping
- Forecasting
- Transformations

One of the key advantages of sktime is its flexibility to handle many forms of time-series data. It provides a variety of feature extraction methods to help you extract relevant insights from time-series data. These features include Fourier transforms and autocorrelation.

# AutoTS
这个适合用来做预测，可以自动测试models，包括了prophet等。
[AutoTS](https://github.com/winedarksea/AutoTS?ref=timescale.com) is a Python-based open-source automated time-series framework that aims to produce "high-accuracy forecasts at scale." It is built on the renowned scikit-learn package and offers a variety of automated machine learning (AutoML) capabilities. It can help users make accurate time-series predictions fast and easily.

To determine the optimal model for a specific time-series dataset, AutoTS can automatically develop and compare different time-series models. These models include ARIMA, exponential smoothing, and Facebook Prophet models. It can also increase accuracy by optimizing hyperparameters and selecting features for every model.

# Prophet
来自facebook，个人感觉更适合做有季节性规律的时序数据的forecast。
Prophet is a forecasting library for time series built by [Facebook's](https://facebook.github.io/prophet/?ref=timescale.com) Core Data Science team. It is intended to be user-friendly and may be employed with R and Python. Prophet excels at analyzing time series with daily seasonality and vacation impacts.

Prophet uses a time-series decomposable model with three primary elements: pattern, seasonality, and holidays. The trend feature represents non-periodic time-series changes, whereas the seasonality part simulates periodic time-series changes. The holiday component shows how holidays and other special events affect the time series.



# Refs
1. https://www.timescale.com/blog/tools-for-working-with-time-series-analysis-in-python/