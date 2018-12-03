#declare FrontPoint = <0, 0, -1>;

#if (View = "4-hedral_default" | View = "8-hedral_default" | View = "20-hedral_default" | View = "4-hedral_cross" | View = "8-hedral_cross")
    #declare Ortho = false;
#else
    #declare Ortho = true;
#end

#if(Ortho)
    #declare CameraPosition = vnormalize(FrontPoint) * 38.5;
#else
    #declare CameraPosition = vnormalize(<13.2, 13.7, -45>) * 38.5;
#end

camera{
    #if(Ortho) orthographic #end
    location CameraPosition
    right    x*image_width/image_height
    angle    10.8
    #if(Ortho) look_at <0,0,0> #else look_at <-.05, -.02, 0> #end
}

light_source{ <-400, 600, -900> color White*.65 shadowless }
light_source{ <-200, 500, -50>  color White*.5 shadowless }
light_source{ CameraPosition   color White*.25 shadowless }
sky_sphere{ pigment{ White } }