///// Petrie hexagon of octahedron (green) /////////////////////////////////////////////////////////////////////////////

#include "coordinates_6_and_8.inc"

#declare Arr = array[7]{2, 5, 1, 3, 0, 4, 2};

union{
    #for( Index, 0, 5 )
        cylinder{ Oct[Arr[Index]], Oct[Arr[Index+1]], RadEdgeBig }
        sphere{ Oct[Arr[Index]], RadVertBig }
    #end
    pigment{color GreenDark}
}


