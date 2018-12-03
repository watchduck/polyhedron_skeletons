///// Petrie square of tetrahedron b (green) ///////////////////////////////////////////////////////////////////////////

#include "coordinates_4.inc"

#declare Arr = array[5]{1, 3, 0, 2, 1};

union{
    #for( Index, 0, 3 )
        cylinder{ T[Arr[Index]], T[Arr[Index+1]], RadEdgeBig }
        sphere{ T[Arr[Index]], RadVertBig }
    #end
    pigment{color GreenDark}
    scale -x  rotate 90*y  scale -x
}


