///// tetrahedron a (violet) ///////////////////////////////////////////////////////////////////////////////////////////

#include "coordinates_4.inc"
#include "lighten.inc"

#declare OuterSolid = object{
    SolidFromFaceNormalPoints(TFaceNormalPoints, 0)
    pigment{color VioletDarkLocal}
}
#declare InnerSolid = object{
    SolidFromFaceNormalPoints(TFaceNormalPoints, FaceThickness)
    pigment{color VioletLightLocal}
}
#declare Hollow = difference{
    object{OuterSolid}
    object{InnerSolid}
}
#declare PrismUnion = union{
    #for(Index, 0, dimension_size(TFaces, 1)-1)
        SolidPrismFromVerticesOfPolygon(TFaces[Index], Offset, PrismThickness)
    #end
    pigment{color VioletLightLocal}
}

difference{
    object{Hollow}
    object{PrismUnion}
}


