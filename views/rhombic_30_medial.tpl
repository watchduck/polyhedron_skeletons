///// medial rhombic triacontahedron ///////////////////////////////////////////////////////////////////////////////////

// The positions L, R, T, B refer to the rhomb on the top right front side
// and are intuitive with the head tilted to the left.

// Gr12, top and bottom point
#declare IScale = Scale;
#include "coordinates_12_and_20.inc"
#declare T = I[6];
#declare B = I[10];

// St12, left and right point
#if (Scale = Medium)
    #declare IScale = 1;
#end
#if (Scale = Small)
    #declare IScale = Small * Phi1;
#end
#include "coordinates_12_and_20.inc"
#declare L = I[4];
#declare R = I[9];

#include "rhombic_30.inc"


