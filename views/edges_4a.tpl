///// edges of tetrahedron a (violet) ///////////////////////////////////////////////////////////////////////////////////////////

#include "coordinates_4.inc"

#declare Vertices = union{
    #for( Index, 0, 3 )
        sphere{ T[Index], RadVert }
    #end
}

#declare Edges = union{
    #for( Index, 0, 5 )
        #local EdgeArray = TEdgeArrays[Index];
        cylinder{ T[EdgeArray[0]], T[EdgeArray[1]], RadEdge }
    #end
}

union {
    object{Vertices}
    object{Edges}
    pigment{color VioletLight}
}


