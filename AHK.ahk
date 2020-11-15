#NoEnv			; #Win  ^Ctrl  !Alt  +Shift  <^>!AltGr
#SingleInstance Force
Menu Tray, Icon, HR.ico
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows On 
SetTitleMatchMode 2
CoordMode ToolTip
CoordMode Mouse
CoordMode Pixel
SendMode Input
SnippetsInit()
TimerOn:=false
ChimeOn:=false
SH:=A_ScreenHeight
SW:=A_ScreenWidth
FormatKeys:={"<^>!u":"{:U}","<^>!l":"{:L}","<^>!t":"{:T}"}

:?*:``1::{home}SD({end})
:?*:``2::{home}SD("{end}")
:?*:``3::{home}SD({end},0)
:?*:``4::{home}SD("{end}",0)

#Include Keyfile.ahk

#IfWinActive
<^>!i::
  Run C:\Program Files\AutoHotkey\AutoHotkey.chm
  Sleep 999
  Send !s
Return
<^>!e::
  Clipboard:="F1::SetTimer tTmr,% (fTmr:=!fTmr)?""50"":""Off""`n`ntTmr:`n`tSend {Space}`nReturn"
  Send ^v
Return
<^>!a::
  Clipboard:="F1::`n  WinGetTitle wgT,A`n  WinGetClass wgC,A`n  wgV:=% ""#IfWinActive "" wgT "" ahk_class "" wgC`n  Clipboard:=wgV`nExitApp"
  Send ^v
Return
<^>!Space::Winset,Alwaysontop,,A
<^>!XButton1::WinHide ahk_class Shell_TrayWnd
<^>!XButton2::WinShow ahk_class Shell_TrayWnd
<^>!d::
  If (dticotog:=!dticotog)
    Control,Hide,,SysListView321,ahk_class Progman
  Else
    Control,Show,,SysListView321,ahk_class Progman
Return
<^>!c::Run CQT.ahk
<^>!;::SnippetsShow()
<^>!NumpadAdd::Run GTAV.ahk Activate
<^>!NumpadSub::Run GTAV.ahk Deactivate
<^>!Numpad0::Run nircmd muteappvolume GTA5.exe 2
<^>!NumpadEnter::
  Run F:\SteamLibrary\steamapps\common\Grand Theft Auto V
  sleep 200
  WinMove A,,0,SH/2,SW/2,SH/2
Return
<^>!NumpadDot::
  ProcSusp("GTA5.exe",1)
  Sleep 8000
  ProcSusp("GTA5.exe",0)
Return
<^>!/::SetTimer tClick,% (TimerOn:=!TimerOn)?"50":"Off"
<^>!p::
  WinGetTitle wgT,A
  WinGetClass wgC,A
  WinGet wgE,ProcessName,A
  WinGetPos wgX,wgY,wgW,wgH,A
  FileAppend %wgT% ahk_class %wgC% ahk_exe %wgE%`nx%wgX% y%wgY% w%wgW% h%wgH%`n`n, ProgInfo.txt
Return
<^>!o::run ProgInfo.txt
<^>!m::
  MouseGetPos mX,mY
  PixelGetColor col,mX,mY,RGB
  msg := mX "," mY " : " SubStr(col,-5)
  Msb(msg,0)
  Clipboard:=SubStr(msg, -5) " " mX "," mY
Return
<^>!t::
<^>!l::
<^>!u::
  Clipboard:=""
  Send ^c
  ClipWait
  Clipboard:=% Format(FormatKeys[A_ThisHotkey],Clipboard)
	Send ^v
Return
#c::Clipboard = data:text/html, <html contenteditable style='color: white; font-family: monospace'>
#m::run C:\Windows\System32\perfmon.exe /res
#h::
  RegRead HiddenFiles_Status,HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced,Hidden
  If HiddenFiles_Status=2
    RegWrite REG_DWORD,HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced,Hidden,1
  Else
    RegWrite REG_DWORD,HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced,Hidden,2
  Send {F5}
Return
#\::
  ChimeOn:=!ChimeOn
  If ChimeOn {
    SetTimer tChime, 500
    Msb("Chime On!",1)
  } Else {
    SetTimer tChime, Off
    Msb("Chime Off",1)
  }
Return
#Numpad0::
  Run ::{20d04fe0-3aea-1069-a2d8-08002b30309d}
  sleep 200
  WinMove A,,0,0,SW/2,SH/2
Return
#Numpad1::
  Run D:\Downloads
  sleep 200
  WinMove A,,0,SH/2,SW/2,SH/2
  Run D:\Video
  sleep 200
  WinMove A,,SW/2,SH/2,SW/2,SH/2
Return
#Numpad2::
  Run C:\Windows\Resources\Themes
  sleep 200
  WinMove A,,SW/2,0,SW/2,SH/2
Return
#Numpad3::
  Run % A_MyDocuments "\AutoHotkey\Lib"
  sleep 200
  WinMove A,,SW/2,SH/2,SW/2,SH/2
Return
#Numpad4::
  Run % A_MyDocuments "\My Kindle Content"
  sleep 200
  WinMove A,,SW/2,SH/2,SW/2,SH/2
Return
<^>!Numpad1::WinMove A,,0,SH/2,SW/2,SH/2
<^>!Numpad2::WinMove A,,0,SH/2,SW,SH/2
<^>!Numpad3::WinMove A,,SW/2,SH/2,SW/2,SH/2
<^>!Numpad4::WinMove A,,0,0,SW/2,SH
<^>!Numpad5::
  WinGetPos ,,,wgW,wgH,A
  WinMove A,,(SW-wgW)/2,(SH-wgH)/2
Return
<^>!Numpad6::WinMove A,,SW/2,0,SW/2,SH
<^>!Numpad7::WinMove A,,0,0,SW/2,SH/2
<^>!Numpad8::WinMove A,,0,0,SW,SH/2
<^>!Numpad9::WinMove A,,SW/2,0,SW/2,SH/2
<^>!1::WinMove A,,0,0,SW/4,SH
<^>!2::WinMove A,,SW/4,0,SW/4,SH
<^>!3::WinMove A,,SW/2,0,SW/4,SH
<^>!4::WinMove A,,SW-SW/4,0,SW/4,SH
<^>!f::ListLines
<^>!h::ListHotkeys
<^>!j::ListVars
<^>!k::KeyHistory

<^>!AppsKey::Edit
AppsKey::
  Suspend
  SoundPlay % (SuspOn:=!SuspOn)?"C:\Windows\Media\Speech Off.wav":"C:\Windows\Media\Speech On.wav"
Return
Pause::Reload
<^>!Pause::ExitApp

tClick:
  Click
Return

tChime:
If (A_Min=00) and (A_Sec=00)
  b(A_Hour)
Return

b(v){
  v:=Mod(v-1,12)+1
  q:=Floor(v/3)
  s:=Mod(v,3)
  Loop % q
  {
    SoundBeep 440,300
    Sleep 150
  }
  Loop % s
  {
    SoundBeep 440,100
    Sleep 50
  }
  Sleep 900
}

ProcSusp(PID_or_Name,Flag:=0){
  PID:=(InStr(PID_or_Name,"."))?ProcExist(PID_or_Name):PID_or_Name
  h:=DllCall("OpenProcess","uInt",0x1F0FFF,"Int",0,"Int",pid)
  If !h
    Return -1
  If Flag
    DllCall("ntdll.dll\NtSuspendProcess","Int",h)
  Else
    DllCall("ntdll.dll\NtResumeProcess","Int",h)
  DllCall("CloseHandle","Int",h)
}

ProcExist(PID_or_Name=""){
  Process Exist,% (PID_or_Name="")?DllCall("GetCurrentProcessID"):PID_or_Name
Return Errorlevel
}

SnippetsInit(){
  Gui Snips: Default
  Gui Font,s15 q5,ProFontWindows
  Gui Color,66CC00
  Gui Margin,3,3
  Gui +AlwaysOnTop +Owner +ToolWindow -Caption +HwndSnippetsHwnd
  Gui Add,ListView,c66CC00 r8 w400,Key|Text
  LV_ModifyCol(1,"Center")
  IniRead,configText,snippets.ini,master    
  Loop,Parse,configText,`n,`r
  {
    parts:=StrSplit(A_LoopField,"="," `t")
    LV_Add("",parts[1],parts[2])
  }
}

SnippetsShow(){
  Global SnippetsMap
    Gui Snips: Show,NoActivate
    Input key,L1 T3
    Gui Snips: Hide
    If (ErrorLevel!="Timeout"){
    IniRead value,snippets.ini,master,%key%,__SNIPPETS_KEY_NOT_FOUND__
        If (value!="__SNIPPETS_KEY_NOT_FOUND__")
      SendInput %value%
    Else
      MsgBox No snippet found for %key%.
  }
}