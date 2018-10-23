#include "basics.inc"
#declare OffsetEdge = OffsetEdgePair;

#declare IScale = PairScale;
#include "coordinates.inc"
#include "Petrie_great_12.inc"
#include "lighten_violet.inc"
#include "Skeletonic_great_12.inc"

#declare IScale = PairScale * (sqrt(5)+1)/2;
#include "coordinates.inc"
#include "Petrie_great_12_dual.inc"
#include "lighten_green.inc"
#include "Skeletonic_great_12_dual.inc"

union{
    object{Skeletonic_great_12}
    object{Petrie_great_12}
    object{Skeletonic_great_12_dual}
    object{Petrie_great_12_dual}
    #include "final_rotation.inc"
}

