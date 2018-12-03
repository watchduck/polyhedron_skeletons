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
#include "SolidFromFaceNormalPoints.inc"


///////////////////////////// colors

#declare GreenDark = rgb <0,41,0> / 255;
#declare GreenLight = rgb <76,112,76> / 255;

#declare VioletDark = rgb <82,9,37> / 255;
#declare VioletLight = rgb <148,84,109> / 255;

#declare BlueDark = rgb <12,13,104> / 255;
#declare BlueLight = rgb <87,88,167> / 255;

#declare RedDark  = srgb <205,35,0> / 255;
#declare RedLight = srgb <240,189,178> / 255;

#declare YellowDark  = srgb <253,196,19> / 255;
#declare YellowLight = srgb <254,225,137> / 255;

#declare GrayDark = rgb .2;
#declare GrayLight = rgb .7;

#declare Pyritohedral = false;  // affects the colors of the hulls and Gr20


///////////////////////////// measurements

#declare FaceThickness = .035;  // face offset (increased to .044 for 'pair_12-20,_Petrie' so the edges are not seen from inside)
#declare PrismThickness = FaceThickness*2 + .1;

// edge offsets
#declare Thick = .3;
#declare Thin = .17;

// scale factors
#declare Phi0 = (sqrt(5) - 1) / 2;  // 0.618
#declare Phi1 = (sqrt(5) + 1) / 2;  // 1.618
#declare Phi2 = (sqrt(5) + 3) / 2;  // 2.618

#declare Small = .425;    // scales Kepler-Poinsot solids so that the biggest fits in the picture
#declare Medium = 1 / Phi1;  // scales the St12 to fit the icosahedron hull scaled with 1 (one, large)

// default factors, to be adapted before including `coordinates_12_and_20.inc`
#declare IScale = 1;
#declare DScale = 1;

// ball and stick sizes
#declare RadVert = .044;
#declare RadEdge = .019;
#declare RadVertBig = RadVert * 2.3;
#declare RadEdgeBig = RadEdge * 2.3;
