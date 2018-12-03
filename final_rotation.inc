#include "coordinates_12_and_20.inc"

#declare FrontPoint = <0, 0, -1>;


#if (View = "4-hedral_default" | View = "8-hedral_default" | View = "20-hedral_default" | View = "4-hedral_cross" | View = "8-hedral_cross")
    #declare RotateMeToFront = FrontPoint;
#end


#if(View = "4-hedral_1-fold")
    #declare RotateMeToFront = <1, 0, -1>;
#end
#if(View = "4-hedral_2-fold_square")
    #declare RotateMeToFront = FrontPoint;
#end
#if(View = "4-hedral_2-fold_cross")
    #declare RotateMeToFront = <0, 1, 0>;
#end
#if(View = "4-hedral_3-fold_violet")
    #declare RotateMeToFront = <1, 1, 1>;
#end
#if(View = "4-hedral_3-fold_green")
    #declare RotateMeToFront = <1, 1, -1>;
#end


#if(View = "8-hedral_2-fold")
    #declare RotateMeToFront = <0, 1, -1>;
#end
#if(View = "8-hedral_3-fold")
    #declare RotateMeToFront = <1, 1, 1>;
#end
#if(View = "8-hedral_4-fold")
    #declare RotateMeToFront = FrontPoint;
#end


#if(View = "20-hedral_2-fold")
    #declare RotateMeToFront = FrontPoint;
#end
#if(View = "20-hedral_3-fold")
    #declare RotateMeToFront = D[1];
#end
#if(View = "20-hedral_5-fold")
    #declare RotateMeToFront = I[3];
#end


RotateDirOnDir(RotateMeToFront, FrontPoint)


#if(View = "4-hedral_cross")
    rotate 90*x  rotate 45*z
#end
#if(View = "4-hedral_1-fold")
    rotate -90*z
#end
#if(View = "4-hedral_2-fold_square")
    rotate -45*z
#end
#if(View = "4-hedral_2-fold_cross")
    rotate 45*z
#end
#if(View = "4-hedral_3-fold_violet")
    rotate 225*z
#end
#if(View = "4-hedral_3-fold_green")
    rotate 45*z
#end


#if(View = "8-hedral_cross")
    rotate -45*x  scale -x
#end
#if(View = "8-hedral_2-fold")
    scale -x
#end
#if(View = "8-hedral_3-fold")
    rotate -195*z
#end
#if(View = "8-hedral_4-fold")
    rotate -135*z
#end

#if(View = "20-hedral_3-fold")
    rotate 20.89*z
#end
#if(View = "20-hedral_5-fold")
    rotate 238.27*z
#end
