//Render with clock 0 to 48

#include "colors.inc"
#include "woods.inc"

camera {
  sky <0,0,1>          //Don't change this
  direction <-1,0,0>   //Don't change this  
  right <-4/3,0,0>     //Don't change this
  location  <5,3,5> //Camera location
  look_at   <0,0,0>    //Where camera is pointing
  angle 60      //Angle of the view--increase to see more, decrease to see less
}

global_settings { ambient_light White }
light_source {
  <10,-10,10>
  color White*2
}
background { color White }

#declare box1= box { <-1, -1, -1>, <1, 1, 0> texture{T_Wood1}};
#declare box2= box { <-1, -1, 0>, <1, 1, 1> texture{T_Wood1}};

#declare r=1/48.0;
object{box1 rotate <0,0,0>}
// object{box2 rotate <0,0,clock*90/48> translate <0,0,1>*(4*clock*r*(1-clock*r))}
object{box2 rotate <clock*-180/48,0,0> translate <0,1.25*clock/24,2*4*clock*r*(1-clock*r)>}
