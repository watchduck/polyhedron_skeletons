#include "basics.inc"

// hull sized if true
#declare Big = true;

#if (Big)
    #declare IScale = 1;
#else
    #declare IScale = PairScale * (sqrt(5)+1)/2;
#end
#include "coordinates.inc"
#include "Skeletonic_great_20.inc"

object{
    Skeletonic_great_20
    #include "final_rotation.inc"
}
