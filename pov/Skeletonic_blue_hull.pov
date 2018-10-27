#include "basics.inc"


// 1: convex rhombic triacontahedron
// 2: medial rhombic triacontahedron (hull of great 12 pair)
// 3:  great rhombic triacontahedron (hull of great 20 pair)
#declare Solid = 2;

// If true 8 faces will be red and 24 gray, if false all will be blue.
#declare Pyritohedral = true;

// If true the medial r. t. will match the hull sized sD.
// The convex version grows accordingly. For the great r. t. there is no big version.
#declare Big = true;

////////////////////////////////////////////////////////////////////////////////////////

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


// The positions L, R, T, B refer to the rhomb on the top right front side
// and are intuitive with the head tilted to the left.
#if (Solid = 1)  // convex rhombic triacontahedron
    // 20, top and bottom point
    #if (Big)
        #declare IScale = 2/(sqrt(5)+1);
    #else
        #declare IScale = PairScale;
    #end
    #include "coordinates.inc"
    #declare T = I[6];
    #declare B = I[10];

    // 12, left and right point
    #if (Big)
        #declare DScale = 2/(sqrt(5)+1);
    #else
        #declare DScale = PairScale;
    #end
    #include "coordinates.inc"
    #declare L = D[12];
    #declare R = D[16];
#end
#if (Solid = 2)  // medial rhombic triacontahedron
    // great 12, top and bottom point
    #if (Big)
        #declare IScale = 2/(sqrt(5)+1);
    #else
        #declare IScale = PairScale;
    #end
    #include "coordinates.inc"
    #declare T = I[6];
    #declare B = I[10];

    // great 12 dual, left and right point
    #if (Big)
        #declare IScale = 1;
    #else
        #declare IScale = PairScale * (sqrt(5)+1)/2;
    #end
    #include "coordinates.inc"
    #declare L = I[4];
    #declare R = I[9];
#end
#if (Solid = 3)  // great rhombic triacontahedron
    // great 20 dual, top and bottom point
    #declare DScale = PairScale * (3+sqrt(5))/2;
    #include "coordinates.inc"
    #declare T = D[4];
    #declare B = D[18];

    // great 20, left and right point
    #declare IScale = PairScale * (sqrt(5)+1)/2;
    #include "coordinates.inc"
    #declare L = I[4];
    #declare R = I[9];
#end

////////////////////////////////////////////////////////////////////////////////////////

#declare FaceOutside = plane{ PlaneNormDistFromPoints(L, T, R) }
#declare FaceInside = plane{ PlaneNormDistFromPoints(L, R, T) +OffsetFace }

#declare PyramidSlantTL = plane{ PlaneNormDistFromPoints(<0,0,0>, T, L) }
#declare PyramidSlantTR = plane{ PlaneNormDistFromPoints(<0,0,0>, R, T) }
#declare PyramidSlantBL = plane{ PlaneNormDistFromPoints(<0,0,0>, L, B) }
#declare PyramidSlantBR = plane{ PlaneNormDistFromPoints(<0,0,0>, B, R) }
#declare Pyramid = intersection{
    object{PyramidSlantTL} object{PyramidSlantTR}
    object{PyramidSlantBL} object{PyramidSlantBR}
}

#declare InversePrism = object{
    SolidPrismFromVerticesOfPolygon(array[5]{L, T, R, B, L}, OffsetEdge, 100)
    inverse
}

// top right front face (there are 6 like this)
#declare Face = intersection{
    object{ FaceOutside   pigment{color Dark1}  }
    object{ FaceInside    pigment{color Light1} }
    object{ Pyramid       pigment{color Light1} }
    object{ InversePrism  pigment{color Light1} }
}

// front face (there are 24 like this)
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

#declare Faces = union{
    object{ Faces }
    object{ Faces2 }
}

object{
    Faces
    #include "final_rotation.inc"
}