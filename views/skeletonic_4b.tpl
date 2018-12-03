///// tetrahedron b (green) ////////////////////////////////////////////////////////////////////////////////////////////

#include "coordinates_4.inc"
#include "lighten.inc"

#declare OuterSolid = object{
    SolidFromFaceNormalPoints(TFaceNormalPoints, 0)
    pigment{color GreenDarkLocal}
}
#declare InnerSolid = object{
    SolidFromFaceNormalPoints(TFaceNormalPoints, FaceThickness)
    pigment{color GreenLightLocal}
}
#declare Hollow = difference{
    object{OuterSolid}
    object{InnerSolid}
}
#declare PrismUnion = union{
    #for(Index, 0, dimension_size(TFaces, 1)-1)
        SolidPrismFromVerticesOfPolygon(TFaces[Index], Offset, PrismThickness)
    #end
    pigment{color GreenLightLocal}
}

difference{
    object{Hollow}
    object{PrismUnion}
    scale -x
}


