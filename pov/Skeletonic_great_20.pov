#include "basics.inc"

#declare IScale = PairScale * (sqrt(5)+1)/2;
#include "coordinates.inc"
#include "Skeletonic_great_20.inc"

object{
    Skeletonic_great_20
    #include "final_rotation.inc"
}
