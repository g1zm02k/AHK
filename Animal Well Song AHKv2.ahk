#Requires AutoHotkey 2.0+
#SingleInstance Force

^+s::DoSong("6313631364246424" ;Egg
          . "8535853575257525"
          . "6313631364246424"
          . "6864875376457656")
^+h::DoSong("11553377")  ;Heads/Hub

DoSong(Tune){
  Loop Parse Tune{
    K:=A_LoopField
    D:=K=1?"d":K=2?"sd":K=3?"s":K=4
    ?"as":K=5?"a":K=6?"aw":K=7?"w":"wd"
    Sleep(50)
    Loop Parse D
      Send("{" A_LoopField " Down}")
    Send("{x Down}")
    Sleep(150)
    Loop Parse D
      Send("{" A_LoopField " Up}")
    Send("{x Up}")
  }
}
