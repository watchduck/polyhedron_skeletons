#include "basics.inc"

#declare IScale = PairScale;
#include "coordinates.inc"
#include "StickEdges_gD.inc"
#include "Petrie_great_12.inc"

union{
    object{ StickEdges_gD         pigment{color VioletLight} }
    object{ Petrie_great_12       pigment{color VioletDark} }

    sphere{ <0,0,0>, 3*PairScale  pigment{color Transparent} }
    #include "final_rotation.inc"
}