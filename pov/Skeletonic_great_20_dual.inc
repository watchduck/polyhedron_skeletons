#declare FaceOutside = plane{ PlaneNormDistFromPoints(D[ 1], D[11], D[19]) }
#declare FaceInside  = plane{ PlaneNormDistFromPoints(D[11], D[ 1], D[19]) +OffsetFace }

#declare CutPlaneVertical   = plane{ PlaneNormDistFromPoints(D[19], D[ 1], <0,0,0>) }
#declare CutFaceLeft     = plane{ PlaneNormDistFromPoints(D[14], D[ 1], D[ 6]) }
#declare CutFaceRight    = plane{ PlaneNormDistFromPoints(D[ 2], D[12], D[19]) }


#declare InversePrism = object{
    SolidPrismFromVerticesOfPolygon(array[5]{D[2], D[1]-100*x, D[19]+100*x, D[14], D[2]}, OffsetEdge, 100)
    inverse
}

#declare Edge = intersection{
    intersection{
        object{FaceOutside}
        object{CutFaceLeft}
        object{CutFaceRight}
        pigment{color VioletDark}
    }
        intersection{
        object{FaceInside}
        object{CutPlaneVertical}
        object{InversePrism}
        pigment{color VioletLight}
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

#declare Skeletonic_great_20_dual = union{
    object{ FacesX }
    object{ FacesY }
    object{ FacesZ }
}