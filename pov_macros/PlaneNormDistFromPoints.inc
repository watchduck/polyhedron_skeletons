#include "math.inc"


#macro PlaneNormDistFromPoints(P, Q, R)

    // plane given by three points P, Q, R
    // normal: <A, B, C>
    // equation: Ax + By + Cz = D
    // result can be used in plane object, can be followed by offset to modify D:
    // plane{ PlaneNormDistFromPoints(P, Q, R) - .1 }

    #local V = Q - P;
    #local W = R - P;

    #local Norm = vcross(V, W);
    #local A = Norm.x;
    #local B = Norm.y;
    #local C = Norm.z;

    #local D = A*P.x + B*P.y + C*P.z;

    #local Dist = D / sqrt( pow(A, 2) + pow(B, 2) + pow(C, 2) );

    <A, B, C>, Dist

#end
        
    

    

    
