///// Petrie decagon of dodecahedron (violet) //////////////////////////////////////////////////////////////////////////

#declare DScale = Scale;
#include "coordinates_12_and_20.inc"

#declare Arr = array[11]{6, 12, 16, 19, 17, 13, 7, 3, 0, 2, 6};

union{
    #for( Index, 0, 9 )
        cylinder{ D[Arr[Index]], D[Arr[Index+1]], RadEdgeBig }
        sphere{ D[Arr[Index]], RadVertBig }
    #end
    pigment{color VioletDark}
}


