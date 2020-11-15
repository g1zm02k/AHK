#IfWinActive Grand Theft Auto V ahk_class grcWindow
  XButton2::N
  XButton1::G
  
#IfWinActive No Man's Sky ahk_class GLFW30
  XButton2::f
  XButton1::g
  [::q
  ]::e

#IfWinActive République ahk_class UnityWndClass
  XButton2::Escape
  
#IfWinActive SatelliteReign ahk_class UnityWndClass
  `::^A
  XButton2::,
  XButton1::.

#IfWinActive Sherlock Holmes: The Devil's Daughter ahk_class LaunchUnrealUWindowsClient
  XButton2::t
  XButton1::Escape

#IfWinActive Skyrim Special Edition ahk_class Skyrim Special Edition
  XButton2::m
  XButton1::`

#IfWinActive STAR WARS Jedi: Fallen Order ahk_class UnrealWindow
  v::1
  XButton2::2
  XButton1::3

#IfWinActive ahk_class illustrator
  XButton2::Space
  XButton1::Control
  MButton::x

#IfWinActive ahk_class Photoshop
  XButton2::Space
  XButton1::Control
  MButton::x
  
#IfWinActive Playlist
  XButton2::WinMove, %wgClass%,, A_ScreenWidth/2-306, 0, 306, 540
  XButton1::WinMove, %wgClass%,, 326, 0, 306, 540

#IfWinActive ahk_class PotPlayer64
  XButton2 & WheelUp::
    WinGetPos, pX, pY, pW, pH, A
    if (pY=0) and (pX=960) {
      WinMove, %wgClass%,, SW/2, SH/2, SW/2, SH/2
    } else {
      WinMove, %wgClass%,, SW/2, 0, SW/2, SH/2
    }
    return
  XButton2 & WheelDown::
    WinGetPos, pX, pY, pW, pH, A
    if (pY=82) {
      WinMove, %wgClass%,, 1482, 682, 438, 353
    } else {
      WinMove, %wgClass%,, 1482, 82, 438, 353
    }
    return
  XButton1 & WheelUp::c
  XButton1 & WheelDown::x
  XButton1 & XButton1::z

#IfWinActive AIMP ahk_class TAIMPMainForm
  XButton2::WinMove, %wgClass%,, 956,-5,366,551
  
#IfWinActive TrayControl ahk_class TAIMPTrayControl
  XButton2::WinMove, %wgClass%,, 956,-3,343,30
  
#IfWinActive TrayControlFlow ahk_class TASEScene
  XButton2::WinMove, %wgClass%,, 956,-3,343,30
    
#IfWinActive - YouTube - Mozilla Firefox ahk_class MozillaWindowClass
  XButton2::Ctrl
  
#IfWinActive