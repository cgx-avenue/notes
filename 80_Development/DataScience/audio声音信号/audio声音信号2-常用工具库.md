# Datasets
atasets来获取音频数据集。🤗 Datasets是一个下载和准备数据集的开源工具，包含了音频在内的各种模态数据。该工具集为Hugging Face Hub上公开的机器学习数据集提供了易用的接口。此外，🤗 Datasets还提供了专门为音频数据集而设的多种特性，帮助研究者和机器学习实践者更轻松地使用这些数据集。
```sh
pip install datasets[audio]
```

```python
from datasets import load_dataset

minds = load_dataset("PolyAI/minds14", name="en-AU", split="train")
minds
```


# pyaudio
https://people.csail.mit.edu/hubert/pyaudio/
边录音边展示wave和频谱 https://blog.csdn.net/weixin_44407922/article/details/124664836?spm=1001.2101.3001.6650.2&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-2-124664836-blog-134795863.235%5Ev43%5Econtrol&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-2-124664836-blog-134795863.235%5Ev43%5Econtrol&utm_relevant_index=5
**Python 使用pyaudio时，“chunks”、“samples”和“frames”是什么**
https://deepinout.com/python/python-qa/485_python_what_are_chunks_samples_and_frames_when_using_pyaudio.html


# librosa
https://librosa.org/doc/latest/tutorial.html
主要作用：
1. 计算，比如梅尔时频谱，stft等
2. 可视化，自带waveform和specshow等
3. 特征提取，参见Refs1


# wav2vec
Facebook搞得，主要是语音识别，输出的是向量化之后的结果。语音自学西AutoRegression模型。
https://huggingface.co/docs/transformers/model_doc/wav2vec2
https://zhuanlan.zhihu.com/p/302463174
https://zhuanlan.zhihu.com/p/390545403


# pyaudioanalysis
https://github.com/tyiannak/pyAudioAnalysis
和librosa有点像，但更专注于audio feature extraction，classification等。
* [ ] 试试classification接口

# towhee
多模态向量化工具，根据预先训练好的模型向量化输入。
其可提供的audio算子在官网可以查到。比如VGGish（ https://zhuanlan.zhihu.com/p/456744003 ）
https://towhee.io/towhee/audio-embedding
https://towhee.io/tasks/detail/operator?field_name=Audio&task_name=Audio-Classification
* [ ] 有数据集了试试用这个分类？

# pydub
> Pydub lets you do stuff to audio in a way that isn’t stupid.
> 
> 
https://github.com/jiaaro/pydub
https://zhuanlan.zhihu.com/p/91257681
https://blog.csdn.net/baidu_29198395/article/details/86694365
高强度依赖ffmpeg
主要是对声音文件的一些操作，比如切片，从视频保存音轨，音乐倒放，拼接什么的。

# acoular
https://www.acoular.org/
https://github.com/acoular/acoular
Acoular – Acoustic testing and source mapping software
这个是用来分析麦克风阵列的，主要是用来看声场图，定位声音源，参见https://blog.csdn.net/weixin_48464886/article/details/125321710




# Refs
1. https://zhuanlan.zhihu.com/p/268292831



