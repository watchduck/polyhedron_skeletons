#declare Petrie_great_12_dual = union{
    cylinder{ I[ 1], I[ 9], RadEdgeBig }
    cylinder{ I[ 9], I[ 5], RadEdgeBig }
    cylinder{ I[ 5], I[10], RadEdgeBig }
    cylinder{ I[10], I[ 2], RadEdgeBig }
    cylinder{ I[ 2], I[ 6], RadEdgeBig }
    cylinder{ I[ 6], I[ 1], RadEdgeBig }
    sphere{ I[ 1], RadVertBig }
    sphere{ I[ 9], RadVertBig }
    sphere{ I[ 5], RadVertBig }
    sphere{ I[10], RadVertBig }
    sphere{ I[ 2], RadVertBig }
    sphere{ I[ 6], RadVertBig }
    pigment{color GreenDark }
}

