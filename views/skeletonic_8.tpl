///// octahedron (green) ///////////////////////////////////////////////////////////////////////////////////////////////

#include "coordinates_6_and_8.inc"
#include "lighten.inc"

#declare OuterSolid = object{
    SolidFromFaceNormalPoints(OctFaceNormalPoints, 0)
    pigment{color GreenDarkLocal}
}
#declare InnerSolid = object{
    SolidFromFaceNormalPoints(OctFaceNormalPoints, FaceThickness)
    pigment{color GreenLightLocal}
}
#declare Hollow = difference{
    object{OuterSolid}
    object{InnerSolid}
}
#declare PrismUnion = union{
    #for(Index, 0, dimension_size(OctFaces, 1)-1)
        SolidPrismFromVerticesOfPolygon(OctFaces[Index], Offset, PrismThickness)
    #end
    pigment{color GreenLightLocal}
}

difference{
    object{Hollow}
    object{PrismUnion}
}


