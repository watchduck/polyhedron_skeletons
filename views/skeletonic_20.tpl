///// icosahedron (green) //////////////////////////////////////////////////////////////////////////////////////////////

#include "lighten.inc"

#declare IScale = Scale;
#include "coordinates_12_and_20.inc"

#declare FaceNormalPoints = array[20]{<-1/2 - sqrt(5)/6, sqrt(5)/6 + 1/2, -1/2 - sqrt(5)/6>*IFactor, <0, (-1/4 - sqrt(5)/12)*(1 + sqrt(5)), (-1/4 - sqrt(5)/12)*(-sqrt(5) + 1)>*IFactor, <-1/2 - sqrt(5)/6, -1/2 - sqrt(5)/6, sqrt(5)/6 + 1/2>*IFactor, <-(1 + sqrt(5))*(sqrt(5)/12 + 1/4), (-1 + sqrt(5))*(sqrt(5)/12 + 1/4), 0>*IFactor, <-(1 + sqrt(5))*(sqrt(5)/12 + 1/4), (-sqrt(5) + 1)*(sqrt(5)/12 + 1/4), 0>*IFactor, <-1/2 - sqrt(5)/6, sqrt(5)/6 + 1/2, sqrt(5)/6 + 1/2>*IFactor, <(-1 + sqrt(5))*(-1/4 - sqrt(5)/12), 0, -(-1/4 - sqrt(5)/12)*(1 + sqrt(5))>*IFactor, <sqrt(5)/6 + 1/2, sqrt(5)/6 + 1/2, -1/2 - sqrt(5)/6>*IFactor, <0, (1 + sqrt(5))*(sqrt(5)/12 + 1/4), (-1 + sqrt(5))*(sqrt(5)/12 + 1/4)>*IFactor, <0, -(-1/4 - sqrt(5)/12)*(1 + sqrt(5)), (-1 + sqrt(5))*(-1/4 - sqrt(5)/12)>*IFactor, <-1/2 - sqrt(5)/6, -1/2 - sqrt(5)/6, -1/2 - sqrt(5)/6>*IFactor, <(-1/4 - sqrt(5)/12)*(-sqrt(5) + 1), 0, (-1/4 - sqrt(5)/12)*(1 + sqrt(5))>*IFactor, <(-sqrt(5) + 1)*(sqrt(5)/12 + 1/4), 0, -(1 + sqrt(5))*(sqrt(5)/12 + 1/4)>*IFactor, <sqrt(5)/6 + 1/2, -1/2 - sqrt(5)/6, -1/2 - sqrt(5)/6>*IFactor, <0, (-1/4 - sqrt(5)/12)*(1 + sqrt(5)), (-1 + sqrt(5))*(-1/4 - sqrt(5)/12)>*IFactor, <(-1/4 - sqrt(5)/12)*(-sqrt(5) + 1), 0, -(-1/4 - sqrt(5)/12)*(1 + sqrt(5))>*IFactor, <sqrt(5)/6 + 1/2, -1/2 - sqrt(5)/6, sqrt(5)/6 + 1/2>*IFactor, <(1 + sqrt(5))*(sqrt(5)/12 + 1/4), (-sqrt(5) + 1)*(sqrt(5)/12 + 1/4), 0>*IFactor, <(1 + sqrt(5))*(sqrt(5)/12 + 1/4), (-1 + sqrt(5))*(sqrt(5)/12 + 1/4), 0>*IFactor, <sqrt(5)/6 + 1/2, sqrt(5)/6 + 1/2, sqrt(5)/6 + 1/2>*IFactor};
#declare Faces = array[20]{array[4]{I[6], I[3], I[0], I[6]}, array[4]{I[8], I[2], I[5], I[8]}, array[4]{I[1], I[2], I[5], I[1]}, array[4]{I[1], I[3], I[0], I[1]}, array[4]{I[1], I[2], I[0], I[1]}, array[4]{I[1], I[7], I[3], I[1]}, array[4]{I[1], I[7], I[5], I[1]}, array[4]{I[9], I[6], I[10], I[9]}, array[4]{I[9], I[7], I[3], I[9]}, array[4]{I[9], I[6], I[3], I[9]}, array[4]{I[4], I[2], I[0], I[4]}, array[4]{I[4], I[6], I[10], I[4]}, array[4]{I[4], I[6], I[0], I[4]}, array[4]{I[4], I[8], I[10], I[4]}, array[4]{I[4], I[8], I[2], I[4]}, array[4]{I[11], I[7], I[5], I[11]}, array[4]{I[11], I[8], I[5], I[11]}, array[4]{I[11], I[8], I[10], I[11]}, array[4]{I[11], I[9], I[10], I[11]}, array[4]{I[11], I[9], I[7], I[11]}};
#declare PrismThickness = FaceThickness*2 + .1;

#declare OuterSolid = object{
    SolidFromFaceNormalPoints(FaceNormalPoints, 0)
    pigment{color GreenDarkLocal}
}
#declare InnerSolid = object{
    SolidFromFaceNormalPoints(FaceNormalPoints, FaceThickness)
    pigment{color GreenLightLocal}
}
#declare Hollow = difference{
    object{OuterSolid}
    object{InnerSolid}
}
#declare PrismUnion = union{
    #for(Index, 0, dimension_size(Faces, 1)-1)
        SolidPrismFromVerticesOfPolygon(Faces[Index], Offset, PrismThickness)
    #end
    pigment{color GreenLightLocal}
}

difference{
    object{Hollow}
    object{PrismUnion}
}


