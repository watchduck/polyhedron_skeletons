#include "basics.inc"
#declare OffsetEdge = OffsetEdgePair;

#declare Big = true;

#if (Big)
    #declare IScale = 2/(sqrt(5)+1);
#else
    #declare IScale = PairScale;
#end
#include "coordinates.inc"
#include "Skeletonic_great_12.inc"

#if (Big)
    #declare IScale = 1;
#else
    #declare IScale = PairScale * (sqrt(5)+1)/2;
#end
#include "coordinates.inc"
#include "Skeletonic_great_12_dual.inc"

union{
    object{Skeletonic_great_12}
    object{Skeletonic_great_12_dual}
    #include "final_rotation.inc"
}

