# 什么是拧紧？拧紧的是什么？
## 拧紧的是螺丝
拧紧是伴随着螺丝的出现而发展起来的，螺丝的发展又是伴随着两次世界大战而统一的。
目前是ISO公制螺丝。
![[imgs/Pasted image 20231123104034.png]]

## 什么是拧紧
![[imgs/Pasted image 20231123131720.png]]
拧紧就是通过螺丝受力变长，从而产生轴向的夹紧力，夹紧连接件。
![[imgs/Pasted image 20231123104102.png]]
## 为什么监控扭矩？
我们想要的是`夹紧力`，但我们只能通过旋转时候的`扭矩`进行测量。
![[imgs/Pasted image 20231123104146.png]]
所以拧不动的时候，要么大力出奇迹，要么加大力臂（有没有想到自行车拆卸飞轮的那个工具？拧不动的话就加长）。

## 扭矩类型
![[imgs/Pasted image 20231123104459.png]]
动态扭矩：安装时的目标扭矩。
静态扭矩：已经安装好的，要继续让螺丝在拧紧方向旋转的扭矩值。
松脱扭矩：要拆螺丝时候，让螺丝开始旋转的扭矩值。

## 50-40-1或5-4-1法则
![[imgs/Pasted image 20231123104633.png]]
![[imgs/Pasted image 20231123104640.png]]
经典的50-40-10规则告诉我们，想要的夹紧力只有力矩的10%，而且还很容易受摩擦的影响。

# 拧紧曲线
在拧紧过程中，我们能监控的是拧紧的角度（累积的螺丝转过的角度）和拧紧的扭矩。
![[imgs/Pasted image 20231123105656.png]]

**蓝线**代表的是理想拧紧曲线。  
扭矩的上下限和拧紧角度的上下限构成了合格窗口，当扭矩超出螺钉的屈服极限时，会出现螺钉拉伸，从而适得其反  
**红线**代表的是经典的螺钉卡死，还未转到合适圈数，就卡住，力矩快速上升  
  
**黄线**代表的是经典的螺纹滑牙，转了很多圈，力矩始终无法到达  
  
**绿线**是考虑材料形变实际应用中的拧紧策略，在力矩到达后，短暂停扭，让应力释放，再继续拧紧，到达目标力矩。大扭矩场景甚至会退半圈，再拧紧。

## 屈服点，屈服强度
屈服强度是用于表示物质在不引起其[塑性变形](https://www.zhihu.com/search?q=%E5%A1%91%E6%80%A7%E5%8F%98%E5%BD%A2&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A1402985910%7D)的情况下可以产生的[最大应力](https://www.zhihu.com/search?q=%E6%9C%80%E5%A4%A7%E5%BA%94%E5%8A%9B&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A1402985910%7D)的指示，以N /m²或[帕斯卡](https://www.zhihu.com/search?q=%E5%B8%95%E6%96%AF%E5%8D%A1&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A1402985910%7D)为单位。

**屈服强度是材料永久变形的应力点**，提供了该材料[弹性极限](https://www.zhihu.com/search?q=%E5%BC%B9%E6%80%A7%E6%9E%81%E9%99%90&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A1402985910%7D)的有用近似值。在达到屈服点之前，材料将发生[弹性变形](https://www.zhihu.com/search?q=%E5%BC%B9%E6%80%A7%E5%8F%98%E5%BD%A2&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A1402985910%7D)，但是在去除施加的应力后，它将始终恢复到其原始形状。一旦超过[屈服点](https://www.zhihu.com/search?q=%E5%B1%88%E6%9C%8D%E7%82%B9&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra=%7B%22sourceType%22%3A%22answer%22%2C%22sourceId%22%3A1402985910%7D)，所经历的变形的一小部分将变得永久且不可逆。当受到应力时，材料会经历可恢复的变形。

参见Refs2,3

# 常见失效
![[imgs/Pasted image 20231123105727.png]]
![[imgs/Pasted image 20231123105751.png]]

# 拧紧枪常见厂商
## 阿特拉斯 Atlas

## 英格索兰

## Bosch

# 不错的材料
下面这个写列结合了总装拧紧工艺
zhuanlan.zhihu.com/p/616270983


# Refs
1. https://zhuanlan.zhihu.com/p/445485059
2. https://www.zhihu.com/question/304165655
3. https://baike.baidu.com/item/%E5%B1%88%E6%9C%8D%E7%82%B9/949525