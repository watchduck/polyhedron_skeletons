#include "basics.inc"

#declare DScale = PairScale * (3+sqrt(5))/2;
#include "coordinates.inc"
#include "StickEdges_gsD.inc"
#include "Petrie_great_20_dual.inc"

union{
    object{ StickEdges_gsD        pigment{color VioletLight} }
    object{ Petrie_great_20_dual  pigment{color VioletDark} }

    sphere{ <0,0,0>, 3*PairScale  pigment{color Transparent} }
    #include "final_rotation.inc"
}
