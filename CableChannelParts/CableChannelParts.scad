//###############################################################################
//# CableChannelParts                                                           #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the CableChannelParts project.                      #
//#                                                                             #
//#    This project is free software: you can redistribute it and/or modify     #
//#    it under the terms of the GNU General Public License as published by     #
//#    the Free Software Foundation, either version 3 of the License, or        #
//#    (at your option) any later version.                                      #
//#                                                                             #
//#    This project is distributed in the hope that it will be useful,          #
//#    but WITHOUT ANY WARRANTY; without even the implied warranty of           #
//#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            #
//#    GNU General Public License for more details.                             #
//#                                                                             #
//#    You should have received a copy of the GNU General Public License        #
//#    along with this project.  If not, see <http://www.gnu.org/licenses/>.    #
//#                                                                             #
//###############################################################################
//# Description:                                                                #
//#   Cable channel corners parts                                               #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 15, 2025                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

channelW = 22;   //width of the cable channel
channelD = 10;   //depth of the cable channel
coverD   =  5.5; //depth of the cable channel cover
innerR   = 20;   //inner radius
outerR   =  5;   //outer radius
cornerT  =  2;   //thickness of the corner pieces
cornerG  =  0.8; //grip  of the corner pieces
cornerO  = 20;   //overlap of corner pieces
$fn = 128;

module outerCorner() {
  //Wall
  color("SlateGray",0.5) {
    translate([-60,0,-20]) cube([60,60,40]);  
  }
  //Channel
  color("Ivory",0.5) {  
    translate([0,5,-channelW/2]) cube([channelD,55,channelW]);  
    translate([-60,-channelD,-channelW/2]) cube([55,channelD,channelW]);  
  } 
}
*outerCorner();

module innerCorner() {
  //Wall
  color("SlateGray",0.5) {
    translate([-60,0,-20]) cube([130,60,40]);  
    translate([-60,-70,-20]) cube([60,70,40]);  
  }
  //Channel
  color("Ivory",0.5) {  
    translate([0,-70,-channelW/2]) cube([channelD,55,channelW]);  
    translate([15,-channelD,-channelW/2]) cube([55,channelD,channelW]);  
  } 
}
*innerCorner();

module cornerProfile(depth=channelD) {
  polygon([[0,          channelW/2],
           [0,         -channelW/2],
           [-depth,    -channelW/2],
           [-depth,    -channelW/2-cornerT],
           [cornerT-1, -channelW/2-cornerT],
           [cornerT,   -channelW/2-cornerT+1],
           [cornerT,    channelW/2+cornerT-1],
           [cornerT-1,  channelW/2+cornerT],
           [-depth,     channelW/2+cornerT],
           [-depth,     channelW/2]]);    
}
*cornerProfile();

module gripProfile() {
  for(m=[0,1]) {
    mirror([0,m,0])
    polygon([[-coverD+cornerG, channelW/2],
             [-coverD-cornerG, channelW/2],
             [-coverD,         channelW/2-cornerG]]);
  }
}
*gripProfile();

module outerCover() {
  difference() {
    union() {
   
      translate([channelD-outerR,-channelD+outerR,0])
      rotate([0,0,270])
      rotate_extrude(angle=90) 
        translate([outerR,0,0]) cornerProfile(outerR);
   
       translate([channelD,cornerO,0])    
       rotate([90,0,0])
       linear_extrude(cornerO+channelD-outerR) 
         cornerProfile();
   
       translate([channelD-outerR,-channelD,0])    
       rotate([90,0,270])
       linear_extrude(cornerO+channelD-outerR) 
         cornerProfile();

       translate([channelD,cornerO,0])    
       rotate([90,0,0])
       linear_extrude(cornerO) 
         gripProfile();
   
       translate([0,-channelD,0])    
       rotate([90,0,270])
       linear_extrude(cornerO) 
         gripProfile();
    }
    union() {
      translate([-60,0,-20]) cube([60,60,40]);  
    }
  }
}
*outerCover();

module innerCover(angle=120) {
  difference() {
    union() {
      #translate([innerR+channelD,-innerR-channelD,0])
      rotate([0,0,270-(angle-90)/2])
      rotate_extrude(angle=angle) 
        translate([-innerR,0,0]) cornerProfile(30);
    
       translate([channelD,-innerR-cornerO/2,0])    
       rotate([90,0,(angle-90)/4])
       linear_extrude(cornerO) 
         cornerProfile();
      
//       translate([cornerO+channelD+innerR,-channelD,0])    
       translate([innerR+channelD,0,0])    
       rotate([270,0,270-(angle-90)/2])
       linear_extrude(cornerO) 
         cornerProfile();
      
       translate([channelD,-cornerO/2,0])    
       rotate([90,0,(angle-90)/4])
       linear_extrude(cornerO+innerR) 
         gripProfile();
      
       translate([cornerO+channelD+innerR,-channelD,0])    
       rotate([90,0,270])
       linear_extrude(cornerO+innerR) 
         gripProfile();
    }
    union() {
      *translate([-60,0,-20]) cube([130,60,40]);  
      *translate([-60,-70,-20]) cube([60,70,40]);    
    }
  }
}
innerCover();

module endCover() {

//       translate([cornerO+channelD+innerR,-channelD,0])    
//       rotate([90,0,270])
         linear_extrude(height=4,scale=[1,1.2]) 
         translate([channelD,0,0])
         cornerProfile();

         translate([0,0,-cornerO])
         linear_extrude(cornerO) 
         translate([channelD,0,0])
         cornerProfile();

         translate([0,0,-cornerO])
         linear_extrude(cornerO) 
         translate([channelD,0,0])
         gripProfile();



}
*endCover();
