///// edges of cube (violet) ///////////////////////////////////////////////////////////////////////////////////////////

#include "coordinates_6_and_8.inc"

#declare Vertices = union{
    #for( Index, 0, 7 )
        sphere{ Cub[Index], RadVert }
    #end
}

#declare Edges = union{
    #for( Index, 0, 11 )
        #local EdgeArray = CubEdgeArrays[Index];
        cylinder{ Cub[EdgeArray[0]], Cub[EdgeArray[1]], RadEdge }
    #end
}

union {
    object{Vertices}
    object{Edges}
    pigment{color VioletLight}
}


