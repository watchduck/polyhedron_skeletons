#include "math.inc"
#include "RotMatFromVectorAndAngle.inc"

#macro RotateDirOnDir(A, B)

    // rotation that moves A so it is collinear with B and the origin

    #declare Angle = VAngle(A, B);

    #declare Perp = VPerp_To_Plane(A, B);

    RotMatFromVectorAndAngle(Perp, -Angle)

#end
