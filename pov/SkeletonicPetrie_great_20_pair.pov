#include "basics.inc"
#declare OffsetEdge = OffsetEdgePair;

#declare IScale = PairScale * (sqrt(5)+1)/2;
#include "coordinates.inc"
#include "Petrie_great_20.inc"
#include "lighten_green.inc"
#include "Skeletonic_great_20.inc"

#declare DScale = PairScale * (3+sqrt(5))/2;
#include "coordinates.inc"
#include "Petrie_great_20_dual.inc"
#include "lighten_violet.inc"
#include "Skeletonic_great_20_dual.inc"

union{
    object{Skeletonic_great_20}
    object{Petrie_great_20}
    object{Skeletonic_great_20_dual}
    object{Petrie_great_20_dual}
    #include "final_rotation.inc"
}