///// Petrie hexagon of cube (violet) //////////////////////////////////////////////////////////////////////////////////

#include "coordinates_6_and_8.inc"

#declare Arr = array[7]{2, 6, 4, 5, 1, 3, 2};

union{
    #for( Index, 0, 5 )
        cylinder{ Cub[Arr[Index]], Cub[Arr[Index+1]], RadEdgeBig }
        sphere{ Cub[Arr[Index]], RadVertBig }
    #end
    pigment{color VioletDark}
}


