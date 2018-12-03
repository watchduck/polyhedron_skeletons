///// great dodecahedron (green) ///////////////////////////////////////////////////////////////////////////////////////

#declare IScale = Scale;
#include "coordinates_12_and_20.inc"
#include "lighten.inc"

#declare FaceOutside = plane{ PlaneNormDistFromPoints(I[0], I[3], I[9]) }

#declare FaceInside  = plane{ PlaneNormDistFromPoints(I[0], I[9], I[3]) +FaceThickness }

#declare PyramidSlant = plane{ PlaneNormDistFromPoints(<0,0,0>, I[3], I[9]) }
#declare RotationAxis = vnormalize(I[6]);
#declare Pyramid = union{
    #for( Index, 0, 4 )
        object{ PyramidSlant RotMatFromVectorAndAngle(RotationAxis, Index*2*pi/5) }
    #end
    inverse
}

#declare InversePrism = object{
    SolidPrismFromVerticesOfPolygon(array[6]{I[3], I[9], I[10], I[4], I[0], I[3]}, Offset, 100)
    inverse
}

#declare Face = intersection{
    object{ FaceOutside   pigment{color GreenDarkLocal}  }
    object{ FaceInside    pigment{color GreenLightLocal} }
    object{ Pyramid       pigment{color GreenLightLocal} }
    object{ InversePrism  pigment{color GreenLightLocal} }
}

////////////////////////////////////////////////////////////////////////////////////////

#declare Faces = union{
    object{ Face }
    object{ Face  scale -y }
}
#declare FacesZ = union{
    object{ Faces }
    object{ Faces  scale -z }
}
#declare FacesX = object{ FacesZ  rotate 90*y rotate 90*x }
#declare FacesY = object{ FacesZ  rotate 90*x rotate 90*y }

union{
    object{ FacesX }
    object{ FacesY }
    object{ FacesZ }
}


