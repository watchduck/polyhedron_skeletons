///// edges of icosahedron and great dodecahedron (green) //////////////////////////////////////////////////////////////

#declare IScale = Scale;
#include "coordinates_12_and_20.inc"

#declare EdgeArrays = array[30]{array[2]{2, 4}, array[2]{4, 10}, array[2]{7, 9}, array[2]{7, 11}, array[2]{3, 7}, array[2]{1, 7}, array[2]{2, 8}, array[2]{2, 5}, array[2]{9, 10}, array[2]{4, 8}, array[2]{0, 4}, array[2]{10, 11}, array[2]{5, 7}, array[2]{3, 6}, array[2]{8, 11}, array[2]{8, 10}, array[2]{0, 2}, array[2]{9, 11}, array[2]{0, 1}, array[2]{6, 9}, array[2]{1, 3}, array[2]{5, 8}, array[2]{5, 11}, array[2]{6, 10}, array[2]{4, 6}, array[2]{1, 5}, array[2]{0, 6}, array[2]{0, 3}, array[2]{1, 2}, array[2]{3, 9}};

// declare vertices

#declare Vertices = union{
    #for( Index, 0, 11 )
        sphere{ I[Index], RadVert }
    #end
}


// declare edges

#declare Edges = union{
    #for( Index, 0, dimension_size(EdgeArrays, 1) - 1 )
        #local EdgeArray = EdgeArrays[Index];
        cylinder{ I[EdgeArray[0]], I[EdgeArray[1]], RadEdge }
    #end
}


// declare object

union {
    object{Vertices}
    object{Edges}
    pigment{color GreenLight}
}


