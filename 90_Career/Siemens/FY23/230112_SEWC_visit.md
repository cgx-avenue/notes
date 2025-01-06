#SEWC #TGW #to_do
按照这一天的calendar顺序。
# SEWC介绍和参观
SEWC： smart enterprise，we create
1. 主讲人：黄勇 SEWC/BE， 陪同：朱正阳 SEWC/BE
2. SEWC 产量 70k/day, 原材料超过5000种；生产模式：MTS（库存式生产），BTS，MTO（订单式生产）；小批量多品种与大批量生产混合。RD超过300人，全厂1137人@2022.
3. Potential topic：
	1.  [ ] 可穿戴设备（智能手表）：Pan Xi，Cou Yi Meng
	2.  [ ] 5G：Yang Chao
4. 仓储区域用的堆垛机：TGW mustang

# ict+kft测试
联系人：Gao Bo，Huang Zuo Hao
1. 负样本太少，训练效果不好
2. 背景：ict是数值型测试，里面包含了几百项电气测试，费时费力，但良率很高。kft是功能测试，也有很多想，但基本都是pass/fail类型。目标：取消ict当中的某些测试，提升测试效率。
3. 目前使用的模型是XGBoost，训练效果很好，但是到实际样本上时候就不行了，正确率只有0.72. 所以SEWC的问题是，模型选的对不对，方法论对不对，这样做是否可行。Liao Li Xin给的回复是XGBoost应该可行，但是我们不知道data到底是什么样的，所以不能下任何结论。
4. 我的想法，放在了[[../../../01_To_Do/各种计划和目标/2025-目标]]的专利想法里。思路具体如下：
	1. 5M1E都需要作为维度参与到训练中去
	2. 补充ict test fail的样本，在kft测试时的样本（目前只有ict测试过了的，才到kft继续测试）
	3. ict变为抽测
		1. 抽测有两层含义，可以整体测试项目不变，但是在样本层面进行抽样
		2. 测试项目进行抽测，行程recipe
		3. 1和2进行结合，动态生成整体sampling rate和recipe，比如整体抽样率降低，但recipe更全，整体抽样率更高，但recipe更不全，挑重点项目

# QM相关的AI topic
1. 基于认知的视觉，根据结果回溯过程
2. 黑盒优化：automl，本质上就是搜索最优点
3. 能耗管理 Fu Guo Wei + Wang Xiao Feng
	1. 目前产线没有完全透明化，仅有产线级别，没有设备级别
	2. 目前使用的是FA的一款软件
	3. 目标：能耗平摊到产品上
	4. Zhou Xia Jun（AFC）提到了曾经用AI做过的虚拟电表项目，误差在10%