REM ÿ����19��00 ִ��һ�θ���
schtasks /create /SC WEEKLY /TN localdns-AutoUpdateHostsWeekly /TR %~dp0\localdns-updateHosts.cmd /D SUN /ST 19:00
