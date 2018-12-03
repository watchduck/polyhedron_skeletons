///// Petrie decagon of icosahedron (green) ////////////////////////////////////////////////////////////////////////////

#declare IScale = Scale;
#include "coordinates_12_and_20.inc"

#declare Arr = array[11]{4, 6, 10, 9, 11, 7, 5, 1, 2, 0, 4};

union{
    #for( Index, 0, 9 )
        cylinder{ I[Arr[Index]], I[Arr[Index+1]], RadEdgeBig }
        sphere{ I[Arr[Index]], RadVertBig }
    #end
    pigment{color GreenDark}
}

