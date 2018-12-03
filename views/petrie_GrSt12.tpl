///// Petrie decagram of great stellated dodecahedron (green) //////////////////////////////////////////////////////////

#declare DScale = Scale * Phi2;
#include "coordinates_12_and_20.inc"

#declare P = array[11]{10, 15, 6, 7, 16, 9, 4, 13, 12, 3, 10};

union{
    #for(Index, 0, 9)
        cylinder{ D[P[Index]], D[P[Index+1]], RadEdgeBig }
        sphere{ D[P[Index]], RadVertBig }
    #end
    pigment{color GreenDark}
    #include "petrie_rotation.inc"
}

