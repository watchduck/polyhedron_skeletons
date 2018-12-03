///// convex rhombic triacontahedron ///////////////////////////////////////////////////////////////////////////////////

// The positions L, R, T, B refer to the rhomb on the top right front side
// and are intuitive with the head tilted to the left.

#declare IScale = Scale;
#declare DScale = Scale;
#include "coordinates_12_and_20.inc"

// 20, top and bottom point
#declare T = I[6];
#declare B = I[10];

// 12, left and right point
#declare L = D[12];
#declare R = D[16];

#include "rhombic_30.inc"


