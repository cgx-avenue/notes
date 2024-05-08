# 1. tushare
[tushare](https://github.com/waditu/tushare)：TuShare 是一个免费、开源的 Python 财经数据接口包，[TuShare 文档](http://tushare.org/index.html)
![[imgs/Pasted image 20231102142643.png]]

# 2. akshare
[akshare](https://github.com/akfamily/akshare)：一款基于 Python 的开源金融数据接口库。提供了股票、期货、期权、基金、数字货币等金融产品的基本数据、实时和历史行情数据、衍生数据，包含数据采集、数据清洗、到数据落地的一套开源工具。满足了金融数据科学家、数据科学爱好者在金融数据获取方面的需求。示例代码：

```python
import akshare as ak
bond_df = ak.bond_spot_deal()
print(bond_df)

   债券简称 成交净价(元) 最新收益率(%)  涨跌(BP) 加权收益率(%) 交易量(亿)
0          19国开15   98.97   3.5750    1.00   3.5826   None
1        19附息国债03   99.82   2.7714    0.14   2.7772   None
2        19附息国债11   99.87   2.8000    0.25   2.7963   None
3        19附息国债04  100.82   2.9832   -1.54   2.9747   None
4        15附息国债05  102.95   3.0359   -1.41   3.0359   None
```

# 3.  [TqSdk 天勤量化交易策略程序开发包](https://github.com/shinnytech/tqsdk-python#tqsdk-%E5%A4%A9%E5%8B%A4%E9%87%8F%E5%8C%96%E4%BA%A4%E6%98%93%E7%AD%96%E7%95%A5%E7%A8%8B%E5%BA%8F%E5%BC%80%E5%8F%91%E5%8C%85)

# 4. baostock
http://baostock.com/baostock/index.php/%E9%A6%96%E9%A1%B5
这个不是开源的，但可以用，虽然好久没更新了，但数据一直可以获取。

# 5. mlfinlab
https://www.mlfinlab.com/en/latest/
MlFinLab python library is a perfect toolbox that every financial machine learning researcher needs. It covers every step of the ML strategy creation starting from data structures generation and finishing with backtest statistics.

