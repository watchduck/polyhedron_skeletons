#declare FaceOutside = plane{ PlaneNormDistFromPoints(I[0], I[3], I[9]) }
#declare FaceInside  = plane{ PlaneNormDistFromPoints(I[0], I[9], I[3]) +OffsetFace }

#declare CutPlaneHorizontal = plane{ PlaneNormDistFromPoints(I[ 0], I[10], <0,0,0>) }
#declare CutFaceTopLeft     = plane{ PlaneNormDistFromPoints(I[ 0], I[ 1], I[ 6]) }
#declare CutFaceTopRight    = plane{ PlaneNormDistFromPoints(I[11], I[10], I[ 6]) }
#declare CutFaceBackLeft    = plane{ PlaneNormDistFromPoints(I[ 5], I[ 7], I[ 0]) }
#declare CutFaceBackRight   = plane{ PlaneNormDistFromPoints(I[ 7], I[ 5], I[10]) }

#declare InversePrism = object{
    SolidPrismFromVerticesOfPolygon(array[5]{I[3], I[9], I[10]+100*x, I[0]-100*x, I[3]}, OffsetEdge, 100)
    inverse
}

#declare Edge = intersection{
    intersection{
        object{FaceOutside}
        object{CutFaceTopLeft}
        object{CutFaceTopRight}
        object{CutFaceBackLeft}
        object{CutFaceBackRight}
        pigment{color GreenDark}
    }
    intersection{
        object{FaceInside}
        object{CutPlaneHorizontal}
        object{InversePrism}
        pigment{color GreenLight}
    }
}

#declare RotationAxis = vnormalize(I[6]);
#declare Face = union{
    #for( Index, 0, 4 )
        object{ Edge RotMatFromVectorAndAngle(RotationAxis, Index*2*pi/5) }
    #end
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

#declare Skeletonic_great_12_dual = union{
    object{ FacesX }
    object{ FacesY }
    object{ FacesZ }
}