Option Explicit
Dim wsh, fso, link, BtnCode, ScriptDir, FilePaths, i

Set wsh = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

Function CreateShortcut(FilePath)
    Set wsh = WScript.CreateObject("WScript.Shell")
    Set link = wsh.CreateShortcut(wsh.SpecialFolders("Startup") + "\localdns.lnk")
    link.TargetPath = FilePath
    link.Arguments = ""
    link.WindowStyle = 7
    link.Description = "GoProxy"
    link.WorkingDirectory = wsh.CurrentDirectory
    link.Save()
End Function

BtnCode = wsh.Popup("是否将 localdns.cmd 加入到启动项？(本对话框 6 秒后消失)", 6, "unbound 对话框", 1+32)
If BtnCode = 1 Then
    ScriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
    FilePaths = Array(ScriptDir + "\localdns.cmd", ScriptDir + "\localdns.cmd")
    For i = 0 to ubound(FilePaths)
        If Not fso.FileExists(FilePaths(i)) Then
            wsh.Popup "当前目录下不存在 " + FilePaths(i), 5, "GoProxy 对话框", 16
            WScript.Quit
        End If
    Next
    CreateShortcut(FilePaths(0))
    wsh.Popup "成功加入 localdns 到启动项", 5, "unbound 对话框", 64
End If
