; Original Code by lexikos - https://www.autohotkey.com/boards/viewtopic.php?t=29659

XI_IN(dll:=""){
  Global
  If _XI_hm
    Return
  XI_DU:=0x00001 ;D-Pad
  XI_DD:=0x00002 ;|
  XI_DL:=0x00004 ;|
  XI_DR:=0x00008 ;/
  XI_ST:=0x00010 ;Start
  XI_SE:=0x00020 ;Select
  XI_LS:=0x00040 ;L/R Sticks
  XI_RS:=0x00080 ;/
  XI_LB:=0x00100 ;L/R Buttons
  XI_RB:=0x00200 ;/
  XI_XB:=0x00400 ;XButton
  XI_BA:=0x01000 ;ABXY
  XI_BB:=0x02000 ;|
  XI_BX:=0x04000 ;|
  XI_BY:=0x08000 ;/
  XI_LT:=0x10000 ;L/R Triggers
  XI_RT:=0x20000 ;/
  XI_LL:=0x30000 ;L Stick
  XI_LR:=0x40000 ;|
  XI_LU:=0x50000 ;|
  XI_LD:=0x60000 ;/
  XI_RL:=0x70000 ;R Stick
  XI_RR:=0x80000 ;|
  XI_RU:=0x90000 ;|
  XI_RD:=0xA0000 ;/
  XI_LZ:=7849    ;L/R Deadzones
  XI_RZ:=8689    ;/
  XI_TT:=30      ;Trigger Threshold
  If (dll="")
    Loop %A_WinDir%\System32\XInput1_*.dll
      dll:=A_LoopFileName
  If (dll="")
    dll:="XInput1_3.dll"
  _XI_hm:=DllCall("LoadLibrary","str",dll,"ptr")
  If !_XI_hm
    Throw Exception("Failed to initialize XInput: " dll " not found.")
   (_XI_GS:=DllCall("GetProcAddress","ptr",_XI_hm,"ptr",100,"ptr"))
|| (_XI_GS:=DllCall("GetProcAddress","ptr",_XI_hm,"astr","XInputGetState","ptr"))
    _XI_SS:=DllCall("GetProcAddress","ptr",_XI_hm,"astr","XInputSetState","ptr")
    _XI_GC:=DllCall("GetProcAddress","ptr",_XI_hm,"astr","XInputGetCapabilities","ptr")
  If !(_XI_GS && _XI_SS && _XI_GC){
    XI_UL()
    Throw Exception("Failed to initialize XInput: function not found.")
  }
}

XI_GS(UI){
  Global _XI_GS
  VarSetCapacity(xiState,16)
  If ErrorLevel:=DllCall(_XI_GS,"uint",UI,"uint",&xiState)
    Return 0
  Return {
  (Join,
    PN: NumGet(xiState, 0,"UInt")
    BX: NumGet(xiState, 4,"UShort")
    LT: NumGet(xiState, 6,"UChar")
    RT: NumGet(xiState, 7,"UChar")
    LX: NumGet(xiState, 8,"Short")
    LY: NumGet(xiState,10,"Short")
    RX: NumGet(xiState,12,"Short")
    RY: NumGet(xiState,14,"Short")
  )}
}

XI_SS(UI,LM,RM){
  Global _XI_SS
  Return DllCall(_XI_SS,"uint",UI,"uint*",LM|RM<<16)
}

XI_GC(UI,FX){
  Global _XI_GC
  VarSetCapacity(xiCaps,20)
  If ErrorLevel:=DllCall(_XI_GC,"uint",UI,"uint",FX,"ptr",&xiCaps)
    Return 0
  Return,
  (Join
    {
      TY: NumGet(xiCaps, 0,"UChar"),
      ST: NumGet(xiCaps, 1,"UChar"),
      FX: NumGet(xiCaps, 2,"UShort"),
      GP: 
      {
        BX: NumGet(xiCaps, 4,"UShort"),
        LT: NumGet(xiCaps, 6,"UChar"),
        RT: NumGet(xiCaps, 7,"UChar"),
        LX: NumGet(xiCaps, 8,"Short"),
        LY: NumGet(xiCaps,10,"Short"),
        RX: NumGet(xiCaps,12,"Short"),
        RY: NumGet(xiCaps,14,"Short")
      },
      VB:
      {
        LM: NumGet(xiCaps,16,"UShort"),
        RM: NumGet(xiCaps,18,"UShort")
      }
    }
  )
}

XI_UL(){
  Global
  If _XI_hm
    DllCall("FreeLibrary","uint",_XI_hm),_XI_hm:=_XI_GS:=_XI_SS:=_XI_GC:=0
}