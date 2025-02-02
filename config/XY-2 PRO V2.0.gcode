;XY-2PRO V2.0
; 断电保存支持与否,设置完后重启才生效
; 0: 表示不支持       1: 表示支持
M8000 I1
; 打印完成关机支持与否,设置完后重启才生效
; 0: 表示不支持       1: 表示支持
M8001 I1
; ==================================
; 下面是步进电机方向控制
; I1与I-1的方向刚好相反，所以，如果电机方向不对，要么改接线，要么改这个方向参数
; X步进电机方向，I1或I-1
M8002 I1
; ==================================
; Y步进电机方向
M8003 I1
; ==================================
; Z步进电机方向
M8004 I-1
; ==================================
; E步进电机方向  
M8005 I1
; ==================================
; XYZ轴挤出头/平台移动配置,仅仅会影响手动界面按钮的实际运动方向
; 0: X轴方向 挤出头运动       1: X轴方向 平台运动
; 目前市面上的机器，大部分都是X轴挤出头运动
M8005 X0
; ==================================
; 0:Y轴方向 挤出头运动     
; 1:Y轴方向 平台运动
; 目前I3的结构Y轴是平台运动，delta,ultimaker和makerbot的Y轴是挤出头运动
M8005 Y1
; ==================================
; 0:Z轴方向 挤出头运动     
; 1:Z轴方向 平台运动 	
; 目前I3结构和delta结构Z轴是挤出头移动，ultimaker和makerbot结构Z轴是平台移动       
M8005 Z0
; ==================================
; 速度相关设置，速度以mm/s为单位，加速度以mm/s^2为单位
; 最大的起步速度，当运动速度起过此速度的时候，会以此速度作为起步，此速度主要是防止失步，
; 此值过小，会在打圆的时候造成轨角凸起
M8006 I80
; ==================================
; 最大的轨弯速度值(对应开源固件中的jerk速度)，如果运动的实际轨弯速度大于此值，
; 会强制令运动减速。在打填充时，会有大量往复运动，此值大，噪音大，容易丢步。
; 此值小，速度慢，打印速度高的时候，打印质量会相对较差
M8007 I30
; ==================================
; 加速度,该值越大，实际运行的平均速度越大，但是噪音也大，
; 该值小，实际的速度也会越小	
M8008 I220
; ==================================
;【步进相关参数】参数设置完，请打印一个立方体，或者手动控制各轴移动，然后用尺子量一下尺寸，以确认参数没有问题  
;【XY每一步的mm值】如20齿,齿距为2mm(mxl规格，2gt的齿据是2mm),1.8度步进电机,16细分,则为(20*2)/((360/1.8)*16)
M8009 S0.00625
; ==================================
;如果需要独立设置X,Y步进电机参数，可以用这个指令,将前面框内打勾即可
;M8009 X0.0127 Y0.0127	
; ==================================
; Z每一步的mm值,计算公式:导程/((360/1.8)*16),
; 导程为螺杆转一圈平台上升的高度
M8010 S0.00125
; ==================================
; E每一步的mm值,这个值等于挤出齿轮的周长除以3200，
; 如果有减速装置还需除以减速比，S0.0013085泰坦挤出机.  S0.0053995
; 如果你发现设置出丝比较稀或是经常断层，建议将此值设置得比真实值小一点，出丝更好	
M8011 S0.0053995
; ==================================
; 各种参数的速度最大值，为了保证机器能够稳定，请根据实测结果进行设置
; XY运动的最大速度mm/s
M8012 I220
; ==================================
; Z运动的最大速度mm/s		
M8013 I30
; ==================================
; 挤出机的最大速度mm/s	
M8014 I120
; ==================================
; Z归零速度,
; makerware切片软件切片，会忽略这个归零速度，因为其gcode中有指定归零速度
; Z归零时的第一次归零速度，速度较快
M8015 I8
; ==================================
; XY归零时的第一次归零速度，速度较快		
M8015 S20
; ==================================
; Z归零时的第二次归零速度，速度较慢	
M8016 I6
; ==================================
; XY归零时的第二次归零速度，速度较慢	
M8016 S4
; ==================================
; 打印前的预挤出      
; 预挤出长度mm，
; 第一层与底板是否粘牢直接影响打印质量，多一点预挤出会使底板粘得更好
M8017 I4
; ==================================
; 挤出机的最大预挤出速度mm/s,非减速齿轮送料，最大速度通常都在100以上		
M8018 I120
; ==================================
; 下面的两个参数和与Replicator/Makerware软件兼容密切相关,如果不打算兼容该类软件，可以不用管
; 支持的最大退丝速度,单位是mm/s，当为0时，表示与E最大速度相同。
; 默认Makerware双头切片退丝非常慢，退丝停顿时间非常长
M8019 I50
; ==================================
; 退丝长度单位mm，如果不打算兼容该类软件，可以不用管
; 回抽距离，回抽过小会漏丝，回抽过大，停顿时间过长，也容易漏丝，
; 请根据您的送料类型及挤出头类型合理设置，
M 8020 S1.5
; ==================================
; makerware软件切换挤出头时的退丝长度,
; makerware切片指定退丝非常长，再回挤时容易卡丝
; 如果为零，遵从切片软件设置
M8033 S0
; ==================================
; 设置机器使用的默认耗材直径,单位是mm
; 耗材直径
M8021 S1.75
; ==================================
; 挤出头支持的最高温度，设置此温度为了防止用户误操作挤出头温度造成挤出头损坏,
; 热阻只能到260度，peek管也大概在260度开始软化
; 挤出头最高温度
M8022 I275
; ==================================
;【耗材界面,出丝的最低温度】
; 耗材界面，挤出耗材所需的最低温度
M8022 T170
; ==================================
; 热床最高温度
; 热板最高温度，温度过高容易损坏热板
M8023 I110
; ==================================
; 禁止温度出错检测，强烈建议不要禁止此功能,默认的温度出错检测会在温度传感器未插好或是
; 加热功率过小的时候弹出警告          0: 使能温度检测   
; 1:禁止挤出头和热床温度出错检测       2:仅禁止热床的温度出错检测 
M8023 T0
; ==================================
; X，Y，Z最大行程，请根据实际打印尺寸进行设置，单位是mm 【请务必认真设置此参数】如果设置过小，在打印时，
; 超出设置行程的地方则无法打印，如果设置过大，则在切片移动指令超出实际机器行程的情况下，不会对超出的位置
; 进行限制，会使得电机强制撞机。 X最大行程,在lcd使能声音的情况下，超出行程的运动会造成蜂鸣器鸣叫 
M8024 I255
; ==================================
; Y最大行程
M8025 I255
; ==================================
; Z最大行程
M8026 I260
; ==================================
; 设置挤出头个数,最少1个，目前主板默认为1
; 配置挤出头个数
M8027 I1
; ==================================
;【是否共用一个加热棒和温度传感器】，在多进一出的喷头或三头的情况下共用一个温度传感器，
;   0:非多进一出   1:多进一出
M8027  S0	
; ==================================
;【多Y或多Z的特殊功能】;
;第二个挤出头当成Z来使用，有些大机器需要两个Z轴，所以可以把E2当成Z轴来使用,该命令会强制挤出头个数为1
;M8027  Z0	;如果使能该功能，请将前面的';'去掉，要禁止该功能，用';'将其注释掉即可,
; ==================================
;0: 双Z双限位模式，第二个限位接Z+, 
;1：双Z单限位模式，只需要接一个限位开关  
; 3: 三Z模式，另外两个Z接扩展口
;第二个挤出头当成Y来使用
;M8027  Y0	;如果使能该功能，请将前面的';'去掉，要禁止该功能，用';'将其注释掉即可
; ==================================
;第二个挤出头当成第一个挤出来使用
;M8027  E0	;如果使能该功能，请将前面的';'去掉，要禁止该功能，用';'将其注释掉即可
; ==================================
; 有些机器会希望禁止热床，可能通过该指令禁止热床
; 0：禁止热床
; 1：使能热床 ,   
M8027 T1
; ==================================
; 高级设置
; 退丝补偿，机器，退丝后再挤出，因为弹性作用，其实会比原位置退一点点，
; 如果不懂就直接为零
M8028 S0.00
; ==================================
; 限位开关结构类型,限位开关接主板上默认的3个限位接口 
; 0: 单边零点限位(左前),如mendel,i3...。  1: 单边最大点限位(右后)，如makerbot机型
; 3: 左后方限位(极少)             4：右前方限位(极少)
M8029 I0
; ==================================
;【XYZ限位开关接线类型】如果此配置错误，在手动界面操作电机时，在某个方向电机会无法运动而且蜂鸣器会发出滴滴的声
; 音，另外Filament座子旁边的短路帽用来选择限位的电压值(3.3/5V)，一定不能悬空。     0: 限位开关常开(未限位
; 时-和s电压为高电平,限位时为低电平)       1: 限位开关常闭(未限位时-和s电压为低电平，限位时为高电平)
M8029 T0
; ==================================
;【Z轴限位开关位置】
; 0：挤出头离平台最近时限位,限位接Z-
; 1：挤出头离平台最远时限位,限位接Z+
M8029 S0
; ==================================
;【XYZ轴归位后是否回(0,0,0)，仅限XYZ或hbot机型】
; 0: 回XYZ(0,0,0)位置，即挤出头回到平台左前方的位置;   
; 1: 停留在限位位置
M8029 C0
; ==================================
;【断料检测使能】断料限位接的是FILAMENT的限位
; 0:禁止断料检测       
; 1:使能断料检测
M8029 D1
; ==================================
; FILAMENT限位开头配置，在未使能断料检测的功能时，Delta机型自动调平限位开关接上面,  
; 平常该限位一直处于非使能状态，即使触发该开关也不会造成蜂鸣器的滴滴声。
; 1: 与XYZ限位类型相同       -1: 与XYZ限位类型相反 
M8029 P-1
; ==================================
;【喷头风扇控制】 此风扇对模型散热，建议设置风扇启动关闭由切片软件指定
; >0: 如果需要强制挤出机大于某温度时自动开启风扇，设置一个大于0的温度.
; 0: 如果设为0,风扇开头由切片软件控制
M8030 I0
; ==================================
;【喉管风扇控制】【M8030 I0 T-1 】
; 此风扇对喷头喉管散热,设置自启动温度一定要放在M8030 I0命令之后,I后面的参数表示温度，
; 当为0是，表示主板风扇不会随温度变化,否则当挤出头温度达到指定温度时，风扇会开启
M8030 I50 T-1
; ==================================
;【设置第二个挤出头相对第一个挤出头的偏移】单位是mm,如果是单头，下列两参数无效,cura中双头偏移设置成0
;M8031	S35.0	;X方向的偏移(左右)
;M8032	S0	;Y方向的偏移(前后)
; ==================================
;【设置第三个挤出头(左或者右边挤出头)的偏移】单位是mm,该参数仅在三喷头，共用一个加热和温度传感器，可以的情况下有效
;M8031	D-35.0	;X方向的偏移(左右)
;M8032	D0	;Y方向的偏移(前后)
; ==================================
; SD卡是否支持文件夹的显示
; 0: 不支持 
; 1：支持
M8034 I1
; ==================================
; 调平相关设置,最多可以取5个点，X,Y为浮点数，单位为mm
; 如果X,Y都小于1，则表示相对行程的比例，否则表示为X,Y的绝对坐标值
; 调平点个数
M8035 I7
; ==================================
;;;;;;;;;;;;;;调平点个数，
;;;;;;;;;;;;;;;;;;;;;;;;;;前三个用自动调平的参数
M8036 X10 Y10;第一个点表示传感器离挤出喷嘴的XY偏移，
M8036 X60 Y40;第二个点表示取点的最小位置
M8036 X240 Y240;第三个点表示取点的最大位置
;;;;;;;;;;;;;;;;;;;;;;;;后面四个是手动调平的取点位置
M8036	X60 Y240	;左后
M8036	X240 Y240       ;右后
M8036	X60 Y40		;左前
M8036	X240 Y40       ;右前
; ==================================
;;;;;;;;;;;;;;;;;;;;;自动调平增加的参数;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
M8038 X4 ; X方向取点个数  最大为 7
M8038 Y4 ; Y方向取点个数 	最大为 7
; ==================================
; 机器类型
; 0:XYZ普通类型  
; 2:Hbot类型
M8080 I0
; ==================================
; 【热阻类型】   对于热电阻,同样参数的热电阻其实也略有差别,不同的热电阻在低温时温度比较接近,在高温时，
; 显示的温度差别可达40度，如果是热敏电阻,请务必设置正确的热电阻类型,     0: 理想NTC 100K 1% 3950 B。
; 1: K型热电偶。            2: EPCOS NTC 100K 1% 3950 B,对应marlin的传感器类型2 
M8081 I2
; ==================================
; 使能调平，【如果使能该功能请在下方选项前面框内打勾并在后框中输入参数】 
; 0:禁止调平使能 
; 1:允许调平使能  在三角洲界面上，可以通过界面进行使能,
M8083 I1
; ==================================
;【调平时，舵机收起时的角度，及放下的角度】，仅在支持了自动使能调平时才有效，详细文档请在帮助中心搜索"舵机"
;M8083 D0 P0 ;D后面接舵机收起的角度 ，P后接舵机放下的角度，如果两个角度相同，被视为不需要舵机支持,
;具体舵机能到的角度由具体的舵机决定，180旋转角舵机，我们实测的范围在-85-105度之间
; ==================================
;【三角洲机器或者自动调平的XYZ机器上】Z调平限位的高度差 = 调平限位的Z位置 - Z零点位置,如果光电调平限位，通常是正值
; 如果限位时，挤出头贴主板，则为负值。  0: 禁止偏移，Z的行程由“设Z为零”,打印的gcod e无需添加自动调平指令，推荐使 
; 用此模式。  非0: Z的当前位置在调平限位触发时自动确定,DELTA结构下，G29自动调平指令必须接在G28归零之后,打印指令之前。
M8084 Z-0.5
; ==================================
; 开机logo时间
; 开机logo持续时间，最小100ms,最大6000ms
M8085 I6000
; ==================================
;【屏保时间】
M8085 T0	;待机多长时间会进入屏保界面，单位是秒(s),当为0时表示禁止屏保
;【待机关机功能，需配合打完关机功能模块】
M8085 P0	;待机多长时间会关闭机器，这个功能只有安装了打完关机功能模块的设置才能使用些设置，
;		 单位是秒(s),为0时表示禁止待机关机功能
; ==================================
;【高级配置,大部分情况下都不需要去动】
;【外接驱动设置】
M8087 T10000 I0	      ;xy的脉冲配置，全部为零
M8087 Z100000	      ;z独立的脉冲宽度，单位ns
; ==================================
;M8087 I0 T14200	;I: 方向信号有效到脉冲信号高电平的建立时间,单位是ns  
;		 T：脉冲信号的最短保持时间,单位是ns ,如果没有外接驱动控制板，请将其都设为零。
;几种外接驱动的参数:THB7128:I100000 T0 ;;;;TB6560:I40000 T0  ;;;TB6600:I100000 T0
; ==================================
; 主板风扇自启时的pwm比例，最高是256,有些主板风扇的风力比较强,噪音比较大
; 可以通过这个参数改变风扇风力及噪音
M8489 I256
; ==================================
; 装载耗材的界面中，装载耗材的进丝速度 ,单位是mm/s,
; 进丝速度过快，无法及时送丝，导致挤出机挤不动而失步
M8489 T5
; ==================================
; 是否打印完成后，强制关闭所有电机及加热
; 0：关闭所有    
; 1：打印完后不运作，完全听从gcode指令
M8489 P0
; ==================================
; 温度的PID参数设置,【M301 P22.2 I1.08 D114】
; 如果你不是专家，并且你的当前温度控制比较稳定，可以不需要动这个参数
;【如果使能该功能请在下方选项前面框内打勾并在后框中输入参数】 
M301 P22.2 I1.08 D114
; ==================================
; 自动调制PID命令，这个命令会阻塞很长时间   【M303 E0 S150 C5】
; 温度150度，自动周期震荡4次，自动调制后的参数可能通过repetier-host看到调制后的pid参数.
;【如果使能该功能请在下方选项前面框内打勾并在后框中输入参数】 
;M303 E0 S150 C5
; ==================================
; 0: 不支持激光雕刻的相关配置,相关功能是在more按钮里面设置速度
; 1: 支持激光雕刻的相关配置  
M8520 I0
; ==================================
;【【【【【【【【【保存参数】】】】】】】】
; 此参数一定不能少，否则参数无法保存到设备
; 参数默认配置 无法修改
M8500

