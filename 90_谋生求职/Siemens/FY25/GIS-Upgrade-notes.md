#yixing #berlin #munich #gis #matthias 

# 工具准备
1. 夹线钳：必须有1.0mm
2. 手套：有橡胶摩擦力那种

# 更换SIMATIC PC 步骤


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






