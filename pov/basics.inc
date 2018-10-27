#version 3.6;
global_settings { assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 conserve_energy}}

#include "colors.inc"
#include "math.inc"
#include "textures.inc"

#include "PlaneNormDistFromPoints.inc"
#include "RotMatFromVectorAndAngle.inc"
#include "SolidPrismFromVerticesOfPolygon.inc"
#include "RotateDirOnDir.inc"

///////////////////////////// camera and light

#declare Ortho = false;
#declare OrthoFrom = "2front";  // "2front", "2cross", "3" or "5"

#declare FrontPoint = <0, 0, -1>;

#if(OrthoFrom = "2front")
    #declare RotateMeToFront = FrontPoint;
#end
#if(OrthoFrom = "2cross")
    #declare RotateMeToFront = <-0.5, pow(1/2 + sqrt(5)/2, 2)/2, 1/4 + sqrt(5)/4>;  // point 12 of icosidodecahedron
#end
#if(OrthoFrom = "3")
    #declare RotateMeToFront = <1, 1, -1>;                                          // point 16 of dodecahedron
#end
#if(OrthoFrom = "5")
    #declare RotateMeToFront = <0, -1, 1/2 * (1 + sqrt(5))>;                        // point 6 of icosahedron
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


///////////////////////////// colors


#declare GreenDark = rgb <0,41,0>/255;
#declare GreenLight = rgb <76,112,76>/255;

#declare VioletDark = rgb <82,9,37>/255;
#declare VioletLight = rgb <148,84,109>/255;

#declare BlueDark = rgb <12,13,104>/255;
#declare BlueLight = rgb <87,88,167>/255;

#declare RedDark  = srgb <205,35,0>/255;
#declare RedLight = srgb <240,189,178>/255;

#declare YellowDark  = srgb <253,196,19>/255;
#declare YellowLight = srgb <254,225,137>/255;

#declare GrayDark = rgb .2;
#declare GrayLight = rgb .7;

#declare Transparent = rgbt<1,1,1,.5>;  // .5 for ball-and-stick, .25 for skeletonic


///////////////////////////// variables

#declare OffsetFace = .035;

#declare OffsetEdgeSingle = .3;
#declare OffsetEdgePair = .17;
#declare OffsetEdge = OffsetEdgeSingle;

#declare PairScale = .425;

// default factors, to be adapted before including `coordinates.inc`
#declare IScale = 1;
#declare DScale = 1;

#declare RadVert = .06;
#declare RadEdge = .02;
#declare RadVertBig = RadVert * 2.4;
#declare RadEdgeBig = RadEdge * 2.4;