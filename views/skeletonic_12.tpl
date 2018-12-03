///// dodecahedron (violet) ////////////////////////////////////////////////////////////////////////////////////////////

#include "lighten.inc"

#declare DScale = Scale;
#include "coordinates_12_and_20.inc"

#declare FaceNormalPoints = array[12]{<(-sqrt(5) + 1)*(-3*sqrt(5)/20 - 1/4), -3*sqrt(5)/10 - 1/2, 0>*DFactor, <1/2 + 3*sqrt(5)/10, 0, (-1 + sqrt(5))*(1/4 + 3*sqrt(5)/20)>*DFactor, <0, (-3 + sqrt(5))*(sqrt(5)/5 + 1/2), (-sqrt(5) + 1)*(sqrt(5)/5 + 1/2)>*DFactor, <-3*sqrt(5)/10 - 1/2, 0, (-1 + sqrt(5))*(-3*sqrt(5)/20 - 1/4)>*DFactor, <(-3 + sqrt(5))*(-1/2 - sqrt(5)/5), (-1/2 - sqrt(5)/5)*(-sqrt(5) + 1), 0>*DFactor, <0, (-1/2 - sqrt(5)/5)*(-sqrt(5) + 3), (-1/2 - sqrt(5)/5)*(-sqrt(5) + 1)>*DFactor, <1/2 + 3*sqrt(5)/10, 0, (-1 + sqrt(5))*(-3*sqrt(5)/20 - 1/4)>*DFactor, <(-3 + sqrt(5))*(sqrt(5)/5 + 1/2), (-sqrt(5) + 1)*(sqrt(5)/5 + 1/2), 0>*DFactor, <0, (-3 + sqrt(5))*(-1/2 - sqrt(5)/5), (-1/2 - sqrt(5)/5)*(-sqrt(5) + 1)>*DFactor, <0, (-1 + sqrt(5))*(1/4 + 3*sqrt(5)/20), -3*sqrt(5)/10 - 1/2>*DFactor, <-3*sqrt(5)/10 - 1/2, 0, (-sqrt(5) + 1)*(-3*sqrt(5)/20 - 1/4)>*DFactor, <(-1/2 - sqrt(5)/5)*(-sqrt(5) + 3), (-1/2 - sqrt(5)/5)*(-sqrt(5) + 1), 0>*DFactor};
#declare Faces = array[12]{array[6]{D[9], D[15], D[18], D[14], D[8], D[9]}, array[6]{D[13], D[17], D[19], D[18], D[15], D[13]}, array[6]{D[2], D[6], D[12], D[14], D[8], D[2]}, array[6]{D[4], D[1], D[0], D[2], D[6], D[4]}, array[6]{D[19], D[16], D[10], D[11], D[17], D[19]}, array[6]{D[3], D[7], D[13], D[15], D[9], D[3]}, array[6]{D[18], D[19], D[16], D[12], D[14], D[18]}, array[6]{D[3], D[0], D[2], D[8], D[9], D[3]}, array[6]{D[13], D[17], D[11], D[5], D[7], D[13]}, array[6]{D[4], D[6], D[12], D[16], D[10], D[4]}, array[6]{D[1], D[5], D[7], D[3], D[0], D[1]}, array[6]{D[10], D[4], D[1], D[5], D[11], D[10]}};
#declare PrismThickness = FaceThickness*2 + .1;

#declare OuterSolid = object{
    SolidFromFaceNormalPoints(FaceNormalPoints, 0)
    pigment{color VioletDarkLocal}
}
#declare InnerSolid = object{
    SolidFromFaceNormalPoints(FaceNormalPoints, FaceThickness)
    pigment{color VioletLightLocal}
}
#declare Hollow = difference{
    object{OuterSolid}
    object{InnerSolid}
}
#declare PrismUnion = union{
    #for(Index, 0, dimension_size(Faces, 1)-1)
        SolidPrismFromVerticesOfPolygon(Faces[Index], Offset, PrismThickness)
    #end
    pigment{color VioletLightLocal}
}

difference{
    object{Hollow}
    object{PrismUnion}
}


