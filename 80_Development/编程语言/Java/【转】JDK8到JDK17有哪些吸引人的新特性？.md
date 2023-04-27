#java #jdk #jdk8 #jdk7 #2023-04-27
# 转载
https://www.cnblogs.com/jingdongkeji/p/17328635.html

2006年之后SUN公司决定将JDK进行开源，从此成立了OpenJDK组织进行JDK代码管理。任何人都可以获取该源码，并通过源码构建一个发行版发布到网络上。但是需要一个组织审核来确保构建的发行版是有效的, 这个组织就是JCP(Java Community Process)。2009年，SUN公司被Oracle公司"白嫖"（参考2018年Google赔款），此时大家使用的JDK通常都是Oracle公司的OpenJDK构建版本-OracleJDK。但是，Oracle公司是一个明显只讲商业而不管情怀的公司，接手Java商标之后，明显加快了JDK的发布版本。2018年9月25日，JDK11成功发布，这是一个LTS版本，包含了17个JEP的更新。与此同时，Oracle把JDK11起以往的商业特性全部开源给OpenJDK（例如：ZGC和Flight Recorder）。根据Oracle的官方说法（[Oracle JDK Releases for Java 11 and Later](https://blogs.oracle.com/java-platform-group/oracle-jdk-releases-for-java-11-and-later)），从JDK11之后，OracleJDK与OpenJDK的功能基本一致。然后，Oracle宣布以后将会同时发行两款JDK：1. 一个是以GPLv2+CE协议下，由Oracle发行OpenJDK（简称为Oracle OpenJDK）；2. 另一个是在OTN协议下的传统OracleJDK。这两个JDK共享绝大多数源码，核心差异在于前者可以免费在开发、测试和生产环境下使用，但是只有半年时间的更新支持。后者各个人可以免费使用，但是生产环境中商用就必须付费，可以有三年时间的更新支持。  
2021年9月14日，Oracle JDK17发布，目前也是最新的Java LTS版本。有意思的是，Oracle竟然"朝令夕改"，OracleJDK17竟然是免费的开源协议，并支撑长达8年的维护计划。

# YSP
## oracle JDK和openjdk的区别
首先这两个都是由Oracle维护，区别就是协议和免费使用以及支持的时间。

## 选择哪个版本
虽然大势所趋，看起来应该选择JDK17，但实际上，比如前阵子安装的Hadoop，JDK17就失败了，换成JDK8就没事。