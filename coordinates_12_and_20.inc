// `IScale` and `DScale` must be set before including


////////////////// icosahedron

#declare IFactor = IScale * Phi0 * 3;

#declare IAbs = array[3]{
    0,
    IFactor,
    IFactor * Phi1
}

#declare I = array[12]{ <-IAbs[2],IAbs[0],-IAbs[1]>, <-IAbs[2],IAbs[0],IAbs[1]>, <-IAbs[1],-IAbs[2],IAbs[0]>, <-IAbs[1],IAbs[2],IAbs[0]>, <IAbs[0],-IAbs[1],-IAbs[2]>, <IAbs[0],-IAbs[1],IAbs[2]>, <IAbs[0],IAbs[1],-IAbs[2]>, <IAbs[0],IAbs[1],IAbs[2]>, <IAbs[1],-IAbs[2],IAbs[0]>, <IAbs[1],IAbs[2],IAbs[0]>, <IAbs[2],IAbs[0],-IAbs[1]>, <IAbs[2],IAbs[0],IAbs[1]>, }


////////////////// dodecahedron

#declare DFactor = DScale * Phi0 * 3;

#declare DAbs = array[4]{
    0,
    DFactor * Phi0,
    DFactor,
    DFactor * Phi1
}

#declare D = array[20]{ <-DAbs[3],-DAbs[1],DAbs[0]>, <-DAbs[3],DAbs[1],DAbs[0]>, <-DAbs[2],-DAbs[2],-DAbs[2]>, <-DAbs[2],-DAbs[2],DAbs[2]>, <-DAbs[2],DAbs[2],-DAbs[2]>, <-DAbs[2],DAbs[2],DAbs[2]>, <-DAbs[1],DAbs[0],-DAbs[3]>, <-DAbs[1],DAbs[0],DAbs[3]>, <DAbs[0],-DAbs[3],-DAbs[1]>, <DAbs[0],-DAbs[3],DAbs[1]>, <DAbs[0],DAbs[3],-DAbs[1]>, <DAbs[0],DAbs[3],DAbs[1]>, <DAbs[1],DAbs[0],-DAbs[3]>, <DAbs[1],DAbs[0],DAbs[3]>, <DAbs[2],-DAbs[2],-DAbs[2]>, <DAbs[2],-DAbs[2],DAbs[2]>, <DAbs[2],DAbs[2],-DAbs[2]>, <DAbs[2],DAbs[2],DAbs[2]>, <DAbs[3],-DAbs[1],DAbs[0]>, <DAbs[3],DAbs[1],DAbs[0]>, }
