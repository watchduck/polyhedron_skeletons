///// faces of convex, medial or great rhombic triacontahedron /////////////////////////////////////////////////////////

#if (Pyritohedral)
    #declare Dark1  = GrayDark;
    #declare Light1 = GrayLight;
    #declare Dark2  = RedDark;
    #declare Light2 = RedLight;
#else
    #declare Dark1  = BlueDark;
    #declare Light1 = BlueLight;
    #declare Dark2  = BlueDark;
    #declare Light2 = BlueLight;
#end

#declare FaceOutside = plane{ PlaneNormDistFromPoints(L, T, R) }
#declare FaceInside = plane{ PlaneNormDistFromPoints(L, R, T) +FaceThickness }

#declare PyramidSlantTL = plane{ PlaneNormDistFromPoints(<0,0,0>, T, L) }
#declare PyramidSlantTR = plane{ PlaneNormDistFromPoints(<0,0,0>, R, T) }
#declare PyramidSlantBL = plane{ PlaneNormDistFromPoints(<0,0,0>, L, B) }
#declare PyramidSlantBR = plane{ PlaneNormDistFromPoints(<0,0,0>, B, R) }
#declare Pyramid = intersection{
    object{PyramidSlantTL} object{PyramidSlantTR}
    object{PyramidSlantBL} object{PyramidSlantBR}
}

#declare InversePrism = object{
    SolidPrismFromVerticesOfPolygon(array[5]{L, T, R, B, L}, Offset, 100)
    inverse
}

// rhomb on the top right front side (there are 24 like this)
#declare Face = intersection{
    object{ FaceOutside   pigment{color Dark1}  }
    object{ FaceInside    pigment{color Light1} }
    object{ Pyramid       pigment{color Light1} }
    object{ InversePrism  pigment{color Light1} }
}

// rhomb in front (there are 6 like this)
#declare D12Norm = vnormalize(D[12]);
#declare Face2 = intersection{
    object{ FaceOutside   pigment{color Dark2}  }
    object{ FaceInside    pigment{color Light2} }
    object{ Pyramid       pigment{color Light2} }
    object{ InversePrism  pigment{color Light2} }
    RotMatFromVectorAndAngle(D12Norm, 2*pi/3)
}

////////////////////////////////////////////////////////////////////////////////////////

#declare Faces = union{
    object{ Face }
    object{ Face  scale -y }
}
#declare Faces = union{
    object{ Faces }
    object{ Faces  scale -x }
}
#declare FacesZ = union{
    object{ Faces }
    object{ Faces  scale -z }
}
#declare FacesX = object{ FacesZ  rotate 90*y rotate 90*x }
#declare FacesY = object{ FacesZ  rotate 90*x rotate 90*y }
#declare Faces = union{
    object{ FacesX }
    object{ FacesY }
    object{ FacesZ }
}

#declare Faces2Z = union{
    object{ Face2 }
    object{ Face2  scale -z }
}
#declare Faces2X = object{ Faces2Z  rotate 90*y rotate 90*x }
#declare Faces2Y = object{ Faces2Z  rotate 90*x rotate 90*y }
#declare Faces2 = union{
    object{ Faces2X }
    object{ Faces2Y }
    object{ Faces2Z }
}

union{
    object{ Faces }
    object{ Faces2 }
}


