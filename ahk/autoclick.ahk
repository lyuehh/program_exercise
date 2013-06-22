gs_title = 疯狂点击器 v1.0 by xiaodiega 2007-04
i := inputpar(gi_loopcount, gi_sleeptime)
if (i <> -1)
	msgbox ,, %gs_title%, 请把鼠标放到要点击的位置上 随后按 F1 开始自动点击。其他快捷键：F2 暂停/恢复  F3 终止循环  F4 回到设定  F5 退出程序
else
	exitapp

$F1:: 
gi_stop = 0
loop %gi_loopcount%
{
	if (gi_stop = 1) 
		break
	click
	sleep gi_sleeptime * 1000
}
return

$F2:: pause

$F3:: gi_stop = 1

$F4:: inputpar(gi_loopcount, gi_sleeptime)

$F5:: exitapp

inputpar(ByRef i_loopcount, ByRef i_sleeptime)
{
	inputbox, v_temp, %gs_title%, 请输入点击次数：,,350,120,,,,,%i_loopcount%
	if errorlevel
		return -1
	else
		i_loopcount = %v_temp%

	inputbox, v_temp, %gs_title%, 请输入间隔时间(s)：,,350,120,,,,,%i_sleeptime%
	if errorlevel
		return -1
	else
		i_sleeptime = %v_temp%
}
