#include "basics.inc"
#declare OffsetEdge = OffsetEdgePair;

#declare IScale = PairScale;
#include "coordinates.inc"
#include "Skeletonic_great_12.inc"

#declare IScale = PairScale * (sqrt(5)+1)/2;
#include "coordinates.inc"
#include "Skeletonic_great_12_dual.inc"

union{
    object{Skeletonic_great_12}
    object{Skeletonic_great_12_dual}
    #include "final_rotation.inc"
}

