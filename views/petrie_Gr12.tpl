///// Petrie hexagon of great dodecahedron (green) /////////////////////////////////////////////////////////////////////

#declare IScale = Scale;
#include "coordinates_12_and_20.inc"

union{
    cylinder{ I[ 0], I[ 3], RadEdgeBig }
    cylinder{ I[ 3], I[ 7], RadEdgeBig }
    cylinder{ I[ 7], I[11], RadEdgeBig }
    cylinder{ I[11], I[ 8], RadEdgeBig }
    cylinder{ I[ 8], I[ 4], RadEdgeBig }
    cylinder{ I[ 4], I[ 0], RadEdgeBig }
    sphere{ I[ 0], RadVertBig }
    sphere{ I[ 3], RadVertBig }
    sphere{ I[ 7], RadVertBig }
    sphere{ I[11], RadVertBig }
    sphere{ I[ 8], RadVertBig }
    sphere{ I[ 4], RadVertBig }
    pigment{color GreenDark}
    #include "petrie_rotation.inc"
}

