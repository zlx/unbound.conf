REM 每周日19：00 执行一次更新
schtasks /create /SC WEEKLY /TN localdns-AutoUpdateHostsWeekly /TR %~dp0\localdns-updateHosts.cmd /D SUN /ST 19:00
