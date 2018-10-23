#declare P = array[11]{7, 10, 2, 3, 11, 4, 1, 9, 8, 0, 7};

#declare Petrie_great_20 = union{
    #for(Index, 0, 9)
        cylinder{ I[P[Index]], I[P[Index+1]], RadEdgeBig }
        sphere{ I[P[Index]], RadVertBig }
    #end
    pigment{color GreenDark }
}

