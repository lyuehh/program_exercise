gs_title = ������� v1.0 by xiaodiega 2007-04
i := inputpar(gi_loopcount, gi_sleeptime)
if (i <> -1)
	msgbox ,, %gs_title%, ������ŵ�Ҫ�����λ���� ��� F1 ��ʼ�Զ������������ݼ���F2 ��ͣ/�ָ�  F3 ��ֹѭ��  F4 �ص��趨  F5 �˳�����
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
	inputbox, v_temp, %gs_title%, ��������������,,350,120,,,,,%i_loopcount%
	if errorlevel
		return -1
	else
		i_loopcount = %v_temp%

	inputbox, v_temp, %gs_title%, ��������ʱ��(s)��,,350,120,,,,,%i_sleeptime%
	if errorlevel
		return -1
	else
		i_sleeptime = %v_temp%
}
