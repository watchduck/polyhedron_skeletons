///// edges of octahedron (green) //////////////////////////////////////////////////////////////////////////////////////

#include "coordinates_6_and_8.inc"

#declare Vertices = union{
    #for( Index, 0, 5 )
        sphere{ Oct[Index], RadVert }
    #end
}

#declare Edges = union{
    #for( Index, 0, 11 )
        #local EdgeArray = OctEdgeArrays[Index];
        cylinder{ Oct[EdgeArray[0]], Oct[EdgeArray[1]], RadEdge }
    #end
}

union {
    object{Vertices}
    object{Edges}
    pigment{color GreenLight}
}


