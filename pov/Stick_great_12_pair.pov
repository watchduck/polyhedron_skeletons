#include "basics.inc"

#declare IScale = PairScale;
#include "coordinates.inc"
#include "StickEdges_gD.inc"
#include "Petrie_great_12.inc"

#declare IScale = PairScale * (sqrt(5)+1)/2;
#include "coordinates.inc"
#include "StickEdges_gI_sD.inc"
#include "Petrie_great_12_dual.inc"

union{
    object{ StickEdges_gD         pigment{color VioletLight} }
    object{ Petrie_great_12       pigment{color VioletDark} }

    object{ StickEdges_gI_sD      pigment{color GreenLight} }
    object{ Petrie_great_12_dual  pigment{color GreenDark} }

    sphere{ <0,0,0>, 3*PairScale  pigment{color Transparent} }
    #include "final_rotation.inc"
}