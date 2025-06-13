#yixing #berlin #munich #gis #matthias 

# 工具准备
1. 夹线钳：必须有1.0mm
2. 手套：有橡胶摩擦力那种
3. U盘，容量大点。
4. 最新的需要的各种程序 => Matthias

# 更换SIMATIC PC 步骤
## 1. 在电脑更换前，备份原来的程序文件，配置文件和相机文件
下面为了简写，定义`gis_path=c:\Program Files\Siemens AG\SINE (or SINE2)`, 两个都要。

1. copy上面gis_path下的两个目录
2. 原camera的config目录在gis_path\SinE2\Camera
3. 原config目录在gis_path\SinE2\config，该目录存储配置程序信息
4. 原config+preset目录（在SinE2目录下），需要先拷贝出来，然后在放进去的新文件夹里，再拷贝到对应的目录。
=> 先都拷贝出来，再把`gis_path\SinE2\config`&`gis_path\SinE2\Preset`文件夹内的所有文件copy回去。
5. Check SAP files => 是否经过SAP进行过信息同步，里面有一些pic
6. copy `D:\Protokolle`文件夹内生成的report文件，也需要和Yixing同事确实下，是否需要回拷一部分。
7. copy `D:\reg-Datel`
8. copy `D:\SAPtransfer`, 确认Yixing是否有SAP feature
9. copy `C:\Program Files\GIS_ServiceAssistant`
10. copy 原机器中的camera license



## 2. Cabling
1. 确保网口：
	1. Camera：LAN X2 P2
	2. SiMotion：LAN X1 P1
	3. 可能会有第三个，就插在第三个位置上
2. 前面板记得检查`Camera On`按钮（相当于Enable）
3. 电源线和其他USB接口线，以及显示器等等




# 更换SiMotion步骤
## 0. 拆装
M5螺丝，上下各一个

## 1. Cabling
1. top上的网线：从内到外 -> 不使用：AXIS-CONT: CLICK-AXIS: 不使用
![[imgs/Pasted image 20250613092547.png]]

2. 最上面的左侧接线，更改，其余不变。
1 -> 1
5,6 -> 7,8
8 -> 10
![[imgs/Pasted image 20250613092846.png]]
3. 红线和绿色网线不变
## 2. 登录PC
## 3. 打开SiMotion SCOTT
1. Open `Project` to load 
2. Click `Connect` Button to be online
3. Check LED status on the left -> top show red led somewhere
4. Click `Alarm` tab -> `Acknowledge All`
5. Check LED status again -> should only have top 2 as constant green

Tip:
1. 开机之后等一会，OPC server才会建立链接
### Error like "Name not found..."

-> TBD






