# 过零率（Zero Crossing Rate）
主要针对语音信号？ 
过零率(Zero Crossing Rate,ZCR)是指在每帧中,语音信号通过零点(从正变为负或从负变为正)的次数。这个特征已在语音识别和音乐信息检索领域得到广泛使用，是金属声音和摇滚乐的关键特征。

```python
zero_crossings = librosa.zero_crossings(x[n0:n1], pad=False)
print(sum(zero_crossings))
```


# 频谱中心（Spectral Centroid）
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

# 频谱滚降点（Spectral Rolloff）

频谱滚降点的意思，我翻译过来大概是：比该频率低的频率的所有能量大于一定比例的整个频谱的能量，通常这个比例为0.85。
![[imgs/Pasted image 20240321095257.png]]
```python
spectral_rolloff = librosa.feature.spectral_rolloff(x, sr=sr)[0]
librosa.display.waveplot(x, sr=sr, alpha=0.4)
plt.plot(t, normalize(spectral_rolloff), color='r')
```
![[imgs/Pasted image 20240321101059.png]]

# MFCC (梅尔频率倒谱系数)

MFCC是音频信号特征中最重要的一个，基本上处理音频信号就会用到。

信号的MFCC参数是一个小集合的特征（一般10-20个），它能够简洁的表示频谱的包络。

```python
mfccs = librosa.feature.mfcc(x, sr=sr)
print(mfccs.shape)
#Displaying  the MFCCs:
librosa.display.specshow(mfccs, sr=sr, x_axis='time')
```





# Refs
1. https://zhuanlan.zhihu.com/p/268292831
2. 