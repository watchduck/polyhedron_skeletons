///// edges of great icosahedron and small stellated dodecahedron (violet) /////////////////////////////////////////////

#declare IScale = Scale*Phi1;
#include "coordinates_12_and_20.inc"

// declare vertices

#declare Vertices = union{
    #for( Index, 0, 11 )
        sphere{ I[Index], RadVert }
    #end
}


// declare edges

#declare Edges = union{
    cylinder{ I[4], I[9], RadEdge }
    cylinder{ I[9], I[8], RadEdge }
    cylinder{ I[8], I[6], RadEdge }
    cylinder{ I[6], I[11], RadEdge }
    cylinder{ I[11], I[4], RadEdge }
}
#declare Edges = union{
    object{ Edges }
    object{ Edges  scale -x }
}
#declare EdgesZ = union{
    object{ Edges }
    object{ Edges  scale -z }
}
#declare EdgesX = object{ EdgesZ  rotate 90*y rotate 90*x }
#declare EdgesY = object{ EdgesZ  rotate 90*x rotate 90*y }
#declare Edges = union{
    object{ EdgesX }
    object{ EdgesY }
    object{ EdgesZ }
}


// declare object

union {
    object{Vertices}
    object{Edges}
    pigment{color VioletLight}
}