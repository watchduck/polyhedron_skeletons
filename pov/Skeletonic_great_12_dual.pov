#include "basics.inc"

#declare IScale = PairScale * (sqrt(5)+1)/2;
#include "coordinates.inc"
#include "Skeletonic_great_12_dual.inc"

object{
    Skeletonic_great_12_dual
    #include "final_rotation.inc"
}
