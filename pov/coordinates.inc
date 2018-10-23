// `IScale` and `DScale` must be set before including


////////////////// icosahedron

#declare IFactor = 1/2 * (3 * sqrt(5) - 3) * IScale;

#declare IAbs = array[3]{
    0,
    IFactor,
    1/2 * (1 + sqrt(5)) * IFactor
}

#declare I = array[12]{ <-IAbs[2],IAbs[0],-IAbs[1]>, <-IAbs[2],IAbs[0],IAbs[1]>, <-IAbs[1],-IAbs[2],IAbs[0]>, <-IAbs[1],IAbs[2],IAbs[0]>, <IAbs[0],-IAbs[1],-IAbs[2]>, <IAbs[0],-IAbs[1],IAbs[2]>, <IAbs[0],IAbs[1],-IAbs[2]>, <IAbs[0],IAbs[1],IAbs[2]>, <IAbs[1],-IAbs[2],IAbs[0]>, <IAbs[1],IAbs[2],IAbs[0]>, <IAbs[2],IAbs[0],-IAbs[1]>, <IAbs[2],IAbs[0],IAbs[1]>, }


////////////////// dodecahedron

#declare DFactor = 3/2 * (sqrt(5) - 1) * DScale;

#declare DAbs = array[4]{
    0,
    1/2 * (sqrt(5) - 1) * DFactor,
    DFactor,
    1/2 * (1 + sqrt(5)) * DFactor
}

#declare D = array[20]{ <-DAbs[3],-DAbs[1],DAbs[0]>, <-DAbs[3],DAbs[1],DAbs[0]>, <-DAbs[2],-DAbs[2],-DAbs[2]>, <-DAbs[2],-DAbs[2],DAbs[2]>, <-DAbs[2],DAbs[2],-DAbs[2]>, <-DAbs[2],DAbs[2],DAbs[2]>, <-DAbs[1],DAbs[0],-DAbs[3]>, <-DAbs[1],DAbs[0],DAbs[3]>, <DAbs[0],-DAbs[3],-DAbs[1]>, <DAbs[0],-DAbs[3],DAbs[1]>, <DAbs[0],DAbs[3],-DAbs[1]>, <DAbs[0],DAbs[3],DAbs[1]>, <DAbs[1],DAbs[0],-DAbs[3]>, <DAbs[1],DAbs[0],DAbs[3]>, <DAbs[2],-DAbs[2],-DAbs[2]>, <DAbs[2],-DAbs[2],DAbs[2]>, <DAbs[2],DAbs[2],-DAbs[2]>, <DAbs[2],DAbs[2],DAbs[2]>, <DAbs[3],-DAbs[1],DAbs[0]>, <DAbs[3],DAbs[1],DAbs[0]>, }
