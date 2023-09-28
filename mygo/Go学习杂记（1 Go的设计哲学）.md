# 简单


# 显式




# 组合（基于正交）
这段一定要看Ref2
在 Go 语言设计层面，Go 设计者为开发者们提供了正交的语法元素，以供后续组合使用，包括：

- Go 语言无类型层次体系，各类型之间是相互独立的，没有子类型的概念；
- 每个类型都可以有自己的方法集合，类型定义与方法实现是正交独立的；
- 实现某个接口时，无需像 Java 那样采用特定关键字修饰；
- 包之间是相对独立的，没有子包的概念

## 类型嵌入（垂直组合）


## 水平组合





# 并发



# 面向工程



# 正交

> Go最坚持的最核心的理念是简单和正交性，所有其他东西包括性能和并发性都向这两点妥协。


## 官方解释
https://link.zhihu.com/?target=https%3A//talks.golang.org/2010/ExpressivenessOfGo-2010.pdf
常量对类型的正交，方法对类型的正交，以及interface所带来的模块间的正交。
# 官方解释Go的来源和特性
https://go.dev/talks/2010/ExpressivenessOfGo-2010.pdf

# 其它




# Refs
1. https://www.zhihu.com/question/27867348
2. https://www.cnblogs.com/niuben/p/16172538.html
3. https://blog.csdn.net/m0_51180924/article/details/122640308
4. https://golang3.eddycjy.com/posts/less-is-more/

