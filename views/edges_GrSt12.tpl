///// edges of great stellated dodecahedron (green) ////////////////////////////////////////////////////////////////////

#declare DScale = Scale * Phi2;
#include "coordinates_12_and_20.inc"

// declare vertices

#declare Vertices = union{
    #for( Index, 0, 19 )
        sphere{ D[Index], RadVert }
    #end
}


// declare edges

#declare Edges = union{
    cylinder{ D[11], D[14], RadEdge }
    cylinder{ D[14], D[ 1], RadEdge }
    cylinder{ D[ 1], D[19], RadEdge }
    cylinder{ D[19], D[ 2], RadEdge }
    cylinder{ D[ 2], D[11], RadEdge }
}
#declare Edges = union{
    object{ Edges }
    object{ Edges  scale -y}
}
#declare EdgesZ = union{
    object{ Edges }
    object{ Edges  scale -z}
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
    pigment{color GreenLight}
}