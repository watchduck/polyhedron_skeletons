///// Petrie decagram of great icosahedron (violet) ////////////////////////////////////////////////////////////////////

#declare IScale = Scale * Phi1;
#include "coordinates_12_and_20.inc"

#declare P = array[11]{7, 10, 2, 3, 11, 4, 1, 9, 8, 0, 7};

union{
    #for(Index, 0, 9)
        cylinder{ I[P[Index]], I[P[Index+1]], RadEdgeBig }
        sphere{ I[P[Index]], RadVertBig }
    #end
    pigment{color VioletDark}
    #include "petrie_rotation.inc"
}

