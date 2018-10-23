#include "basics.inc"

#declare IScale = PairScale * (sqrt(5)+1)/2;
#include "coordinates.inc"
#include "StickEdges_gI_sD.inc"
#include "Petrie_great_20.inc"

union{
    object{ StickEdges_gI_sD      pigment{color GreenLight} }
    object{ Petrie_great_20       pigment{color GreenDark} }

    sphere{ <0,0,0>, 3*PairScale  pigment{color Transparent} }
    #include "final_rotation.inc"
}
