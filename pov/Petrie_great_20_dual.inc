#declare P = array[11]{10, 15, 6, 7, 16, 9, 4, 13, 12, 3, 10};

#declare Petrie_great_20_dual = union{
    #for(Index, 0, 9)
        cylinder{ D[P[Index]], D[P[Index+1]], RadEdgeBig }
        sphere{ D[P[Index]], RadVertBig }
    #end
    pigment{color VioletDark }
}

