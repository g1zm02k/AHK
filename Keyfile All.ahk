#IfWinActive Beyond Good & Evil - Ubisoft ahk_class BGEMain
  XButton2::e
  XButton1::q

#IfWinActive Beyond: Two Souls ahk_class BeyondTwoSouls
  XButton2::1
  XButton1::4
  MButton::Tab
  [::LShift
  ]::c

#IfWinActive Call of Cthulhu ahk_class UnrealWindow
  XButton2 & LButton::e
  XButton2 & RButton::w
  XButton2 & MButton::f
  [::a
  ]::d
  XButton1::Esc
  Numpad0::run CoC Backup.ahk Copied
  NumpadDot::run CoC Backup.ahk Deleted
  NumpadEnter::run CoC Backup.ahk Editing

#IfWinActive CTRLroom ahk_class UnrealWindow
  XButton2::q
  XButton1::e
  MButton::Enter
  
#IfWinActive The Darkside Detective ahk_class UnityWndClass
  Space::LButton

#IfWinActive Fallout4 ahk_class Fallout4
  XButton2::e
;	::'

#IfWinActive FarCry®5 ahk_class Nomad
;	Tab::LControl
  Control::c
  c::Control

#IfWinActive ahk_class fox
  XButton1::O
  XButton2::P
;	Capslock::I
;	Shift::U

#IfWinActive Grand Theft Auto V ahk_class grcWindow
  XButton2::N
  XButton1::G
  
#IfWinActive Halo: Spartan Strike ahk_class BLUE_WINDOWCLASS
  XButton2::1
  XButton1::2

#IfWinActive Just Cause 3 ahk_class JC3
  XButton2::LShift
  XButton1::LCtrl
  j::z
  l::c
  i::w
  k::s
  
#IfWinActive Just Cause 4 ahk_class JC4
  ;XButton2::v
  Xbutton1::1
  [::z
  ]::c
  
#IfWinActive Kingdoms of Amalur: Reckoning ahk_class BigHugeClass
  XButton2::c
  XButton1::m
  MButton::Esc

#IfWinActive Mad Max ahk_class Mad Max
  XButton1::F
  XButton2::Space
  B::
    Send {c down}{x down}
    Sleep 300
    Send {x up}{c up}
    return

#IfWinActive Mass Effect™: Andromeda ahk_class Mass Effect™: Andromeda
  XButton2::Esc
  XButton1::LCtrl

#IfWinActive Moons of Madness ahk_class UnrealWindow
  XButton2::f
  XButton1::o
  r::t
  e::MouseClick Left
  q::MouseClick Right

#IfWinActive Observation ahk_class UnityWndClass
  XButton2::Z
  XButton1::C
  x::BackSpace

#IfWinActive Oxenfree ahk_class UnityWndClass
  XButton1::Space
  XButton2::LShift
  MButton::LCtrl
  Up::w
  Down::s
  Left::a
  Right::d

#IfWinActive Pool Nation FX ahk_class UnrealWindow
  XButton2::Space
  XButton1::O
  w::s
  s::w

#IfWinActive Project Dreamland 1.0 ahk_class Area 51 Window
  XButton2::F
  XButton1::V
  
#IfWinActive ahk_class RememberMeUnrealUWindowsClient
  f::Enter
  q::Tab
  XButton2::e
  XButton1::v
  r::MButton
  c::MButton

#IfWinActive Saints Row: Gat out of Hell ahk_class sr_hv
  XButton2::Tab
  XButton1::Escape

#IfWinActive Saints Row: The Third ahk_class SR3
  XButton2::Tab
  XButton1::Escape
  
#IfWinActive Saints Row IV ahk_class SRE4
  XButton2::Tab
  XButton1::Escape
  
#IfWinActive SatelliteReign ahk_class UnityWndClass
  `::^A
  XButton2::,
  XButton1::.

#IfWinActive Shadow Warrior
  z::8

#IfWinActive Skyrim Special Edition ahk_class Skyrim Special Edition
  XButton2::m
  XButton1::`
  
#IfWinActive Snooker Nation ahk_class UnrealWindow
  XButton2::Space
  XButton1::O
  
#IfWinActive Star Trek ahk_class StarTrekPCEvolutionGfxD3D
  XButton2::C
  XButton1::E

#IfWinActive STAR WARS Jedi: Fallen Order ahk_class UnrealWindow
  v::1
  XButton2::2
  XButton1::3
  
#IfWinActive Starbound ahk_class SDL_app
  XButton2::f
  XButton1::Esc

#IfWinActive T42 ahk_class UnityWndClass
;	LCtrl::C
  XButton1::E
  XButton2::Q
  
#IfWinActive The Turing Test ahk_class UnrealWindow
  XButton2::BackSpace
  XButton1::e

#IfWinActive Watch_Dogs
  XButton2::Q
  XButton1::Esc

#IfWinActive Watch_Dogs 2
  XButton1::Esc

#IfWinActive ahk_class illustrator
  XButton2::Space
  XButton1::Control
  MButton::x
  WheelUp::]
  WheelDown::[

#IfWinActive ahk_class Photoshop
  XButton2::Space
  XButton1::Control
  MButton::x
  WheelUp::]
  WheelDown::[

#IfWinActive ahk_class PotPlayer64
  XButton2::
    WinGetPos, pX, pY, pW, pH, A
    if (pY=0) {
      WinMove, %wgClass%,, 960, 540, 960, 540
    } else {
      WinMove, %wgClass%,, 960, 0, 960, 540
    }
    return
  XButton1::
    WinGetPos, pX, pY, pW, pH, A
    if (pY=82) {
      WinMove, %wgClass%,, 1482, 682, 438, 353
    } else {
      WinMove, %wgClass%,, 1482, 82, 438, 353
    }
    return

#IfWinActive AIMP ahk_class TAIMPMainForm
  XButton2::WinMove, %wgClass%,, 956,-5,366,551
  
#IfWinActive TrayControl ahk_class TAIMPTrayControl
  XButton2::WinMove, %wgClass%,, 956,-3,343,30
  
#IfWinActive TrayControlFlow ahk_class TASEScene
  XButton2::WinMove, %wgClass%,, 956,-3,343,30