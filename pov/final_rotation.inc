#if(Ortho)

    RotateDirOnDir(RotateMeToFront, FrontPoint)

    #if(OrthoFrom = "3")
        rotate (-97.2)*z
    #end
    #if(OrthoFrom = "5")
        rotate 288*z
    #end

#end
