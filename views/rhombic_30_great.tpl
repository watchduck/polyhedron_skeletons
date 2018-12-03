///// great rhombic triacontahedron ////////////////////////////////////////////////////////////////////////////////////

// The positions L, R, T, B refer to the rhomb on the top right front side
// and are intuitive with the head tilted to the left.

// GrSt12, top and bottom point
#declare DScale = Small * Phi2;
#include "coordinates_12_and_20.inc"
#declare T = D[4];
#declare B = D[18];

// Gr20, left and right point
#declare IScale = Small * Phi1;
#include "coordinates_12_and_20.inc"
#declare L = I[4];
#declare R = I[9];

#include "rhombic_30.inc"


