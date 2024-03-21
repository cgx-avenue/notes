# 音频特征的类别
认识音频特征不同类别不在于对某一个特征精准分类而是加深理解特征的物理意义，一般对于音频特征我们可以从以下维度区分：

（1）特征是由模型从信号中直接提取还是基于模型的输出得到的统计，如均值、方差等；

（2）特征表示的是瞬态还是全局上的值，瞬态一般以帧为单位而全局则覆盖更长的时间维度；

（3）特征的抽象程度，底层特征抽象程度最低也是最易从原始音频信号中提取，它可以进一步被处理为高一级的中间特征代表乐谱中常见的音乐元素，如音高、音符的起始时间等；高层特征最为抽象大多用于音乐的曲风和情绪任务；

（4）根据特征提取过程的差异可以分为：从原始信号中直接提取的特征（如过零率）、将信号转换为频率得到的特征（如谱心质）、需经过特定的模型得到的特征（如旋律）、受人耳听觉认知启发改变量化特征尺度得到的特征（如MFCCs）。

我们以“特征提取过程的差异”为主要分类基准，列出各类下比较常见的特征：
![[imgs/Pasted image 20240321132205.png]]

# 常用工具

| 名称            | 地址                                                                                                                        | 适配语言      |
| --------------- | --------------------------------------------------------------------------------------------------------------------------- | ------------- |
| Aubio           | [https://aubio.org](https://link.zhihu.com/?target=https%3A//aubio.org)                                                     | c/python      |
| Essentia        | [https://essentia.upf.edu](https://link.zhihu.com/?target=https%3A//essentia.upf.edu)                                       | c++/python    |
| Librosa         | [https://librosa.org](https://link.zhihu.com/?target=https%3A//librosa.org)                                                 | python        |
| Madmom          | [http://madmom.readthedocs.org](https://link.zhihu.com/?target=http%3A//madmom.readthedocs.org)                             | python        |
| pyAudioAnalysis | [https://github.com/tyiannak/pyAudioAnalysis](https://link.zhihu.com/?target=https%3A//github.com/tyiannak/pyAudioAnalysis) | python        |
| Vamp-plugins    | [https://www.vamp-plugins.org](https://link.zhihu.com/?target=https%3A//www.vamp-plugins.org)                               | c++/python    |
| Yaafe           | [http://yaafe.sourceforge.net](https://link.zhihu.com/?target=http%3A//yaafe.sourceforge.net)                               | python/matlab |
|                 |                                                                                                                             |               |

# 具体特征
## 过零率（Zero Crossing Rate）
主要针对语音信号？ 
过零率(Zero Crossing Rate,ZCR)是指在每帧中,语音信号通过零点(从正变为负或从负变为正)的次数。这个特征已在语音识别和音乐信息检索领域得到广泛使用，是金属声音和摇滚乐的关键特征。

```python
zero_crossings = librosa.zero_crossings(x[n0:n1], pad=False)
print(sum(zero_crossings))
```


## 频谱中心（Spectral Centroid）
频谱中心代表声音的“质心”，又称为频谱一阶距。频谱中心的值越小，表明越多的频谱能量集中在低频范围内。
理解：计算FFT或STFT数据的“中位数”，如果越小，说明数据越低频。
```python
import sklearn
spectral_centroids = librosa.feature.spectral_centroid(x[:80000], sr=sr)[0]
# Computing the time variable for visualization
frames = range(len(spectral_centroids))
# 将帧转换为时间，time[i] == frame[i]。【因为stft是一个窗口(帧)一个窗口取的，和采样频率并不对应，所以有个转换】
t = librosa.frames_to_time(frames, sr=8000)
# Normalising the spectral centroid for visualisation，归一化
def normalize(x, axis=0):
    return sklearn.preprocessing.minmax_scale(x, axis=axis)
#Plotting the Spectral Centroid along the waveform
librosa.display.waveplot(x[:80000], sr=sr, alpha=0.4)
plt.plot(t, normalize(spectral_centroids), color='r')
```
![[imgs/Pasted image 20240321095231.png]]

## 频谱滚降点（Spectral Rolloff）

频谱滚降点的意思，我翻译过来大概是：比该频率低的频率的所有能量大于一定比例的整个频谱的能量，通常这个比例为0.85。
![[imgs/Pasted image 20240321095257.png]]
```python
spectral_rolloff = librosa.feature.spectral_rolloff(x, sr=sr)[0]
librosa.display.waveplot(x, sr=sr, alpha=0.4)
plt.plot(t, normalize(spectral_rolloff), color='r')
```
![[imgs/Pasted image 20240321101059.png]]

## MFCC (梅尔频率倒谱系数)

MFCC是音频信号特征中最重要的一个，基本上处理音频信号就会用到。

信号的MFCC参数是一个小集合的特征（一般10-20个），它能够简洁的表示频谱的包络。

```python
mfccs = librosa.feature.mfcc(x, sr=sr)
print(mfccs.shape)
#Displaying  the MFCCs:
librosa.display.specshow(mfccs, sr=sr, x_axis='time')
```

通过打印mfccs.shape，可以看看每一帧里面有多少维的MFCC特征。第一个参数是mfcc参数的维度，第二个参数是帧数。比如（20,3107），就是3107帧，每一帧有20维特征。
![[imgs/Pasted image 20240321101404.png]]



# Refs
1. https://zhuanlan.zhihu.com/p/268292831
2. https://zhuanlan.zhihu.com/p/335721515