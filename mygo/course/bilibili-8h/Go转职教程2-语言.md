

# hello world
![[imgs/Pasted image 20230922140945.png]]

# 变量声明
1. `:=` 只能用在函数体内，不能用在全局变量
2. 多变量声明，可以传统形式，也可以用多行形式

# 常量
const定义自增枚举的时候，可以用iota来代替。
iota不能单独使用，只能配合const

# 多返回值
1. 多返回值用（）和起来
2. 可以匿名，也可以具名，3种写法
![[imgs/Pasted image 20230925144108.png]]

# 导包路径与init方法调用流程
![[imgs/Pasted image 20230925144927.png]]
![[imgs/Pasted image 20230925145655.png]]

# import匿名及别名导包方法
![[imgs/Pasted image 20230925151848.png]]

# 指针
视频里讲的很好，指针的概念和含义
https://www.bilibili.com/video/BV1gf4y1r79E?p=10&vd_source=462c9e0df89bcb23f1c5be85ce31d8ce
![[imgs/Pasted image 20230925161833.png]]

# defer
在所在的函数或流程结束前执行的。
可以有多个，按照堆找方式执行。
![[imgs/Pasted image 20230925162550.png]]
![[imgs/Pasted image 20230925162614.png]]

# 数组与动态数组（slice）
![[imgs/Pasted image 20230926113145.png]]
## slice切片的4种声明定义方式


