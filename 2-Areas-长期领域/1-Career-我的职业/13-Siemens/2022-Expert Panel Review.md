在西门子研究院，或者叫Technology，特别是中国区域，有着明显的职级划分，其中Expert开始，是一个比较重要的分水岭。头些年（2022年之前）的时候，升职比较困难，但近些年明显有贬值趋势。背后的重要原因有：
1. 虽然expert panel review需要所有中国区部门经理一起审计，但尚在mattias控制范围内。
2. Expert之后的Sr Expert, 反而需要更进一步的review，标准也更高，更不可控（实际上也不是）
3. 最重要的原因，promotion的budget不在每年普调的budget之内。

这也造就了Expert inflation，越来越多的expert，以及需要更多更高职级来满足已经是expert（但很难，从工作层面上）的人。短期上来看可以稳定想升职和加薪的人，长期上来看反而不好，严重增加了部门负担。

在2022年初，我提离职，老马通过加薪和升职挽留我，他提议到9月份expert review时候给我升职。我也因此成为了至少这个部门最快升职的人（加入后一年）。

虽然十拿九稳，但我当时准备的还是很认真的，毕竟加入的时间短，如何通过有限的项目讲好一个故事，就显得尤为关键。
# 文档结构
![[../../../_assets/img/Pasted image 20251110105832.png]]

## PPT
![[imgs/2022_08_Expert_Panel_Review_YangShaoPeng_V4.pptx]]
![[imgs/Talent Presentation Introduction_Yang Shao Peng.pptx]]

## 解说词
当时我还把这些词打印出来照着说
```markdown
## Page 1

Good morning everyone, 1st please allow me to introduce my background.

  

## Page 2

I got both my bachelor and master degree from Jiangnan University, majoing in electronics and communication engineering.    

  

During my master time, I had one full-time internship as the only HW engineer in a startup company whose business is smart grid monitoring. That's the 1st time for me to understand connectivity.  

  

After graduation, I jonined Finisar Wuxi. During 4 years there, my main responsibilities are test software and system development including data analysis. During the process of developing quality related software, I also got a 6-sigma green-belt to systematically requirements.  

  

At 2018, I joined Bosch group. Besides connectivity solution development, I'm also a key member in a Sino-German public funded I4.0 project called MOVE. We also develped a production and process optimization software product in China using UWB indoor technology.  

  

Last year, I joined Siemens Wuxi innovation center as lead engineer, focusing on connectivity & edge application development.

  

## Page 3

After joinged Siemens, my activities can be clustered into 3 parts. 1st one is how I realized the CCS bridge monitoring use case and handled the challenging situation.

  

2nd is my contribution as core member of Device as a Service team, not only contining the current business with our BU partner, but also by refactoring to be fit for new business opportunities.

  

3rd is as project manager for T CED loose-coupling project. I believe lot of you we've discussed through the cross-tf input sync meeting. I'm also hornored to presented this topic in CED's global tech-talk.

  

So today I'm gonna focus on the former 2.

  

Last but not least, there're some innovation and other activities I'd like to mention.

  

Next, I will introduce you the 1st one, CCS.

  

## Page 4

Siemens has an agreement with Wuxi iXinwu(you can consider it as Wuxi local goverment) to implement connected city solution via ECB. You may heard from the news that in 2019, one main overpass in Wuxi collapsed.

  

After brainstorming, we came up this bridge monitoring use case like below. ECBs are installed on the street lamp, with Minddot installed on the bottom of the lamp. So if a heavy truck goes by, the vibration sensor will exceed a certain value and trigger the ECB camera to send filed pictures.

  

On the right is my colleagues doing experiments on the bridge.

Let's have a quick look at the demo.

  

## Page 5

As you can see from the screen, when a heavy truck goes by,....

  

Things would be perfect if just like this. But there's always a but.

  

## Page 6

Above is the timeline for the use case application. As you may see, deadline is July 31th while I'm appointed as PM at July 6th. A lot of things already ongoing  before I joined, so I 1st quickly get to know each stakeholders and setup connections. Things are roughly smoothly before July 22th when we are about to submit the application materials.

  

But there is a big hurdle comes from iXinwu that day.

  

I will use the STAR princle in the boxes to explain to you.

  

The situation is  ...

The targets are ...

The actions I take are ...

Finally we reached a good result that ...

  

That's the fire fighting task I have done for CCS, next let's go to DaaS part.

  

## Page 7

DaaS is short for Device as a Service, which is a close-loop solution including ....

  

Our BU partener is .... whose majority of business is automotive industry.

  

The left picture shows the historical project path, most of them are car OEMs. The right pictrure shows the architecture, like most connectity solution, divided into 3 levels.

  

After I take over the role of architecture of DaaS, we figured out DaaS is in a situation that ...

  

So from technical perspecture, architecture and code-level refactoring are things we must to do. targets are...

  

## Page 8

I started the refactoring in a top-down approach from User-journey design. To be more flexible, I unified some the concepts like ...

  

I drive the change from ... to ... on front-end. Also setup mock and test env.

  

For backend, I removed Mindsphere legacy, and change the API building from Flask to Flask-restful, also unified data processing algorithm.

For database, in order to be consistent with back-end design, I also redesigned table-wise.

  

During the process of rewriting allmost all codes, I setup docs. as much as I can, use git and code.siemens as only code repo. Also designed git branches and workflow.

  

From team & growth perspective, I coached new colleague.... also developed new tools and approach which will show later. Meanwhile, FA SO wants to setup AI competence, so they asked my help to recuit 1 engineer and this person is already onboard. We should work very closely in the coming months together.

  

## Page 9

Right after the whole refactoring, we get a project chance not in the automotive, but fits in the new scope of DaaS, which is SXVT. This project is not only INW's ice-breaking contact with SXVT, but also 1st time for DaaS using accoustic data.

  

SXVT is...

  

background ...

  

current approach in sxvt ...

  

## Page 10

In order to get the right objective feature, I spend weeks .... Finally we found features from spectrogram and used those as an approach. Instead of sensors, this time we also analyzed acquisition intruments. After comparison and filed tests, AWA sound meter suits the data acquisition requirements.

  

So stepwise proposals are given to SXVT. The technical solution and proposal got very positive feedback, and commercial negotiation is in progress.

  

## Page 11
```

## 最终评估报告
其实不太重要，就是走个形式
![[imgs/Validation report to Yang Shao Peng.pptx]]

# 参考资料
## 评估标准
![[imgs/Assessment Guidance.pdf]]

## 工程师competence discription
![[imgs/Engineer compentence discription.pdf]]

## Yu He's
![[imgs/My Growth_Expert Reviw_YU He_2020.pptx]]



