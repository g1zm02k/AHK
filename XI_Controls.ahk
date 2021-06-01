; Original Code by u/slicer4ever - https://www.reddit.com/r/DestinyTechSupport/comments/9f37n0/pchow_to_do_controller_mouse_setupsnot_xim/

#NoEnv
#Persistent
SendMode Input
#Include XI.ahk
XI_IN()

OS:=""
GP:=0

KB:={(XI_BA):"1"
    ,(XI_BB):"2"
    ,(XI_BX):"3"
    ,(XI_BY):"4"
    ,(XI_LB):"5"
    ,(XI_RB):"6"
    ,(XI_SE):"7"
    ,(XI_ST):"8"
    ,(XI_LS):"9"
    ,(XI_RS):"a"
    ,(XI_LT):"b"
    ,(XI_RT):"c"
    ,(XI_DU):"Up"
    ,(XI_DL):"Left"
    ,(XI_DR):"Right"
    ,(XI_DD):"Down"
    ,(XI_LU):"w"
    ,(XI_LL):"a"
    ,(XI_LR):"d"
    ,(XI_LD):"s"
    ,(XI_RU):"Numpad8"
    ,(XI_RL):"Numpad4"
    ,(XI_RR):"Numpad6"
    ,(XI_RD):"Numpad5"
    ,(XI_XB):"Space"}
SetTimer WG,5
Return

WG:
  NS:=XI_GS(%GP%)
  If !NS
    Return
  If !OS
    OS:=NS
  DT:=0
  CS(NS.LX,OS.LX,XI_LZ,KB[XI_LL],KB[XI_LR])
  CS(NS.LY,OS.LY,XI_LZ,KB[XI_LD],KB[XI_LU])
  CS(NS.RX,OS.RX,XI_RZ,KB[XI_RL],KB[XI_RR])
  CS(NS.RY,OS.RY,XI_RZ,KB[XI_RD],KB[XI_RU])
  CS(NS.LT,OS.LT,XI_TT,DT,KB[XI_LT])
  CS(NS.RT,OS.RT,XI_TT,DT,KB[XI_RT])
  For KK,VV in KB{
    If ((OS.BX&KK) && !(NS.BX&KK))
      Send {%VV% Up}
    If ((NS.BX&key) && !(OS.BX&KK))
      Send {%VV% Down}
  }
  OS:=NS
Return

CS(NV,OV,DZ,LK,RK){
  If LK
    If((NV<-DZ && OV>=-DZ))
      Send {%LK% Down}
    If ((OV<-DZ && NV>=-DZ))
      Send {%LK% Up}
  If RK
    If((NV>DZ && OV<=DZ))
      Send {%RK% Down}
    If((OV>DZ && NV<=DZ))
      Send {%RK% Up}
}
