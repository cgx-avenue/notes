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
10. copy 原机器中的camera license => check -> pic, "C:\Documents and Settings\All users\Application Data\InfraTec\"



## 2. Cabling
1. 确保网口：
	1. Camera：LAN X2 P2
	2. SIMOTION：LAN X1 P1
	3. 可能会有第三个，就插在第三个位置上
2. 前面板记得检查`Camera On`按钮（相当于Enable）
3. 电源线和其他USB接口线，以及显示器等等




# 更换SIMOTION步骤
## 0. 拆装
M5螺丝，上下各一个

## 1. Cabling
1. 上面的网线：从内到外 
	1. 不使用
	2. AXIS-CONT
	3. CLICK-AXIS
	4. 不使用
![[imgs/Pasted image 20250613092547.png]]

2. 前面板左上侧接线，更改，其余不变。
	1. 1 -> 1
	2. 5,6 -> 7,8
	3. 8 -> 10
![[imgs/Pasted image 20250613092846.png]]
3. 红线电源线和绿色网线不变
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

# 其他notes
1. InfraTec软件： IRBIS 3.1 Professional
2. 面板安装：注意静电接地，需要在面板上弄一个特殊垫片，安装在比如最右下角。

# Matthias的notes list
[[Installation_Anlage_052-IGS-H-001]]

# Basic setup
1. Rotary feedthrough -> 在盘子底下， hot air + cold air
2. Flash x 2, LED x 2. Yixing doesn't need.
3. Focus length / f2.0: 
	1. now 25mm
	2. supplier 50mm
	3. theoretical 75mm
4. SIMOTION -> UPC server
5. CCD-CAM ->Not-exist
6. Air temperature: 300 in Garching, 350 in Berlin, TBC in Yixing
7. RITAL -> 空调，有排水孔
8. VISIT -> 闪光灯充电，LED drive叠在上面
9. X, 数字越大，位置越近。 Z，数字越大，越靠上。

# SINE2 software
1. Each measurement configuration:
Camera + Excitation + Recording + Analysis, others are optional.
-> Save as... -> "Click to load config"
2. "Measurement" button -> Start
3. "Pos" tab -> sequential execution of measurements
	"settings" -> open windows to add sequence
	"dangerous position" -> sign
	everything in "mm" unit
4. "Z, X, Tilt, Rotation, Century?" -> for a position.
	"Century?" position type in German
5. "Measurement Preset": not must to have
6. "Auto-scaling & Contrast": usually not modify
7. "Setting for all position": usually not input, but able to input product information
8. others are speed configuration
9. 运动时，相机总是最后走水平方向，防止碰撞
10. “loading position for blades": Vanes vs. Blades -> different positions
11. "wait for flash recordings": usually checked
12. "Open door " -> Settings to release doors
13. Resolution, Frame -> 512 x 640, 100fps.
	1. Average: 16 Frames to average -> 16 averaged as a cycle: parameter `Frame ... cycles`.`Number of Frames` averaged frame.
	2. `Data granularity`: Averaged Frame => what to store.
	3. `Saving level`: source series: Averaged Frame: 16 Bit data, 8Bit RGB-> only for visualization after FrameSelector
	4. color combination
	5. Each saving level is a file.

# SIMOTION
should be in RUN mode, otherwise debug it.

# TEST APP
A5 left -> Inputs
A6 right -> Outputs

=> "TEST APP"->"Acknowledge all": only works in "RUN" mode.

SIMOTION <-> PC <- TestAPP (SIMOTION_API.dll) as OPC client

# SIMOTION Scott
1. Usually Project loaded by default, otherwise open by ...
2. Connect to SIMOTION D425 -> cabling 
	1. "Button": "offline-mode" -> "online-mode"
3. Check program -> pic: should be green
4. Debug for SIMOTION "STOP" red light
	1. Go online
	2. check left bottom "alarm" index ->pic
	3. "Acknowledge all". some alarms might disappear.
	4. if not disappear, then try reboot.


5. 别忘了绿色Button！


