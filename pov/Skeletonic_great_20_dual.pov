#include "basics.inc"

#declare DScale = PairScale * (3+sqrt(5))/2;
#include "coordinates.inc"
#include "Skeletonic_great_20_dual.inc"

object{
    Skeletonic_great_20_dual
    #include "final_rotation.inc"
}
