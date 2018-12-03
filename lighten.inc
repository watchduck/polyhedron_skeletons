#if (Lighten)

    #declare GreenDarkLocal = GreenLight;
    #declare GreenLightLocal = GrayLight;

    #declare VioletDarkLocal = VioletLight;
    #declare VioletLightLocal = GrayLight;

#else

    #declare GreenDarkLocal = GreenDark;
    #declare GreenLightLocal = GreenLight;

    #declare VioletDarkLocal = VioletDark;
    #declare VioletLightLocal = VioletLight;

#end