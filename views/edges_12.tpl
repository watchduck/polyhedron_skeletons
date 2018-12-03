///// edges of dodecahedron (violet) ///////////////////////////////////////////////////////////////////////////////////

#declare DScale = Scale;
#include "coordinates_12_and_20.inc"

#declare EdgeArrays = array[30]{array[2]{4, 10}, array[2]{12, 16}, array[2]{3, 7}, array[2]{2, 8}, array[2]{7, 13}, array[2]{2, 6}, array[2]{17, 19}, array[2]{13, 17}, array[2]{8, 14}, array[2]{13, 15}, array[2]{18, 19}, array[2]{12, 14}, array[2]{9, 15}, array[2]{8, 9}, array[2]{15, 18}, array[2]{10, 11}, array[2]{10, 16}, array[2]{5, 7}, array[2]{1, 5}, array[2]{0, 2}, array[2]{11, 17}, array[2]{6, 12}, array[2]{0, 1}, array[2]{16, 19}, array[2]{5, 11}, array[2]{4, 6}, array[2]{1, 4}, array[2]{0, 3}, array[2]{14, 18}, array[2]{3, 9}};

// declare vertices

#declare Vertices = union{
    #for( Index, 0, 19 )
        sphere{ D[Index], RadVert }
    #end
}


// declare edges

#declare Edges = union{
    #for( Index, 0, 29 )
        #local EdgeArray = EdgeArrays[Index];
        cylinder{ D[EdgeArray[0]], D[EdgeArray[1]], RadEdge }
    #end
}


// declare object

union {
    object{Vertices}
    object{Edges}
    pigment{color VioletLight}
}


