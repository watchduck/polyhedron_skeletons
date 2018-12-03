///// cube (violet) ////////////////////////////////////////////////////////////////////////////////////////////////////

#include "coordinates_6_and_8.inc"
#include "lighten.inc"

#declare OuterSolid = object{
    SolidFromFaceNormalPoints(CubFaceNormalPoints, 0)
    pigment{color VioletDarkLocal}
}
#declare InnerSolid = object{
    SolidFromFaceNormalPoints(CubFaceNormalPoints, FaceThickness)
    pigment{color VioletLightLocal}
}
#declare Hollow = difference{
    object{OuterSolid}
    object{InnerSolid}
}
#declare PrismUnion = union{
    #for(Index, 0, dimension_size(CubFaces, 1)-1)
        SolidPrismFromVerticesOfPolygon(CubFaces[Index], Offset, PrismThickness)
    #end
    pigment{color VioletLightLocal}
}

difference{
    object{Hollow}
    object{PrismUnion}
}


