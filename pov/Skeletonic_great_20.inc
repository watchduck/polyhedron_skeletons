#declare I6Norm = vnormalize(I[6]);
#declare D12Norm = vnormalize(D[12]);

#declare Pyritohedral = false;
#if (Pyritohedral)
    #declare Dark1  = GrayDark;
    #declare Light1 = GrayLight;
    #declare Dark2  = YellowDark;
    #declare Light2 = YellowLight;
#else
    #declare Dark1  = GreenDark;
    #declare Light1 = GreenLight;
    #declare Dark2  = GreenDark;
    #declare Light2 = GreenLight;
#end

////////////////////////////////////////////////////////////////////////////////////////

#declare FaceOutside = plane{ PlaneNormDistFromPoints(I[0], I[9], I[8]) }
#declare FaceInside  = plane{ PlaneNormDistFromPoints(I[0], I[8], I[9]) +OffsetFace }

#declare PyramidSlant = plane{ PlaneNormDistFromPoints(<0,0,0>, I[9], I[8]) }
#declare D12Norm = vnormalize(D[12]);
#declare Pyramid = union{
    #for( Index, 0, 2 )
        object{ PyramidSlant RotMatFromVectorAndAngle(D12Norm, Index*2*pi/3) }
    #end
    inverse
}

#declare InversePrism = object{
    SolidPrismFromVerticesOfPolygon(array[4]{I[0], I[9], I[8], I[0]}, OffsetEdge, 100)
    inverse
}

#declare Face = intersection{
    object{ FaceOutside   pigment{color Dark1}  }
    object{ FaceInside    pigment{color Light1} }
    object{ Pyramid       pigment{color Light1} }
    object{ InversePrism  pigment{color Light1} }
}

#declare Face2 = intersection{
    object{ FaceOutside   pigment{color Dark2}  }
    object{ FaceInside    pigment{color Light2} }
    object{ Pyramid       pigment{color Light2} }
    object{ InversePrism  pigment{color Light2} }
    RotMatFromVectorAndAngle(I6Norm, 2*pi/5)
}

////////////////////////////////////////////////////////////////////////////////////////

#declare Faces = union{
    object{ Face }
    object{ Face  scale -x }
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

#declare Faces2 = union{
    object{ Face2 }
    object{ Face2  scale -x }
}
#declare Faces2 = union{
    object{ Faces2 }
    object{ Faces2  scale -y }
}
#declare Faces2 = union{
    object{ Faces2 }
    object{ Faces2  scale -z }
}

#declare Skeletonic_great_20 = union{
    object{ Faces }
    object{ Faces2 }
}