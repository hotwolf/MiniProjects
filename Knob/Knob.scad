//###############################################################################
//# Knob - Main Assembly                                                        #
//###############################################################################
//#    Copyright 2021 Dirk Heisswolf                                            #
//#    This file is part of the DiffCaSt project.                               #
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
//#    This project makes use of the NopSCADlib library                         #
//#    (see https://github.com/nophead/NopSCADlib).                             #
//#                                                                             #
//###############################################################################
//# Description:                                                                #
//#   Knob                                                                      #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   April 15, 2022                                                            #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

include <BOSL2/std.scad>
include <BOSL2/threading.scad>

$fn=128;

difference() {
    union() {
        *knobTop();
        knobBottom();
        *lid();
    }
    *cube([100,100,100], anchor=CENTER+RIGHT);
}

module knobTop() {
    color("Orange") {
    
    difference() {
            union() {
                translate([0,0,1]) rotate([0,0,0])      
                cyl(h=9,
                    d=46,
                    rounding2=8,    
                    anchor=CENTER+BOTTOM);
                
                translate([0,0,7.5]) rotate([0,0,0])      
                torus(id=25, 
                      od=40,
                      orient=RIGHT);
              
                
            }
            union () {
                translate([0,0,1]) rotate([0,0,0])      
                  torus(id=25, od=43.5);
                
                 translate([0,0,0]) rotate([0,0,0])      
                 trapezoidal_threaded_rod(d=23,
                                      l=21,
                                      pitch=3.5,
                                      thread_angle=60,
                                      thread_depth=2,
                                      anchor=CENTER);
                
                  translate([0,0,1]) rotate([0,0,0])      
                  cube([50,50,20], anchor=CENTER+TOP);
  
                  translate([0,0,2]) rotate([0,0,0])      
                  cyl(h=4,
                      d=23,
                      chamfer2=1,    
                      anchor=CENTER+TOP);

  
                
            }
        }
    }
}

module knobBottom() {
    color("Green") {
    
     translate([0,0,-3.6]) rotate([0,0,0])
     trapezoidal_threaded_rod(d=22,
                              l=14,
                              pitch=3.5,
                              thread_angle=60,
                              thread_depth=2,
                              bevel2=true,
                              anchor=CENTER+BOTTOM);   


     translate([0,0,-3.6]) rotate([0,0,0])
     cyl(d=30, h=1, ,rounding=0.5, anchor=CENTER);
    
    }
}





module lid() {
    color("White", 0.5) {
        difference() {
            //positive
            union() {
                torus(id=25.5, od=43);
                cube([100,100,2], anchor=CENTER);
            }
            //negative
            union() {
                translate([0,0,-1]) cube([100,100,5], anchor=CENTER+TOP);
                cylinder(d=25.5, h=20, anchor=CENTER);
                torus(id=27.5, od=41);
            }
        }
        tube(id=25.5, od=27.7, h=3.6, anchor=CENTER+TOP);
}
}















//
//
//
//
////Nail
//module Nail(trans=[0,0,0], rot=[0,0,0]) {
//    translate(trans)
//    rotate(rot) {
//        color("gray") { 
//            translate([0,0,0])   cylinder(h=0.5, d=2.5);
//            translate([0,0,-20]) cylinder(h=20, d=1.2);
//        }
//        color("gray", 0.25) {
//            translate([0,0,10])   cylinder(h=0.5, d=2.5);
//            translate([0,0,-10]) cylinder(h=20, d=1.2);
//        }
//    }
//}
//
//
////Mount
//color("green")
//difference() {
//   //Positive
//   union() {
//      hull() { 
//        translate([0,0,1.4]) cylinder(h=0.2, d=40, $fn=32);
//        translate([0,0,0]) cylinder(h=0.4, d=39, $fn=32);
//      }
//      intersection() {     
//        cylinder(h=5, d=40, $fn=32);
//        for (angle=[0,120,240]) {
//            rotate([0,0,angle]) translate([0,8,3]) rotate([80,0,0]) 
//            hull() {
//                translate([0,0,-20]) cylinder(h=20, d=3.6, $fn=12);
//                translate([-1.8,-1.8,-20])   cube([3.6,1.6,20]);
//            }
//        } 
//      }  
//       
//      
//   }
//   //Negative
//   union() {
//         for (angle=[0,120,240]) {
//            rotate([0,0,angle]) translate([0,8,3]) rotate([80,0,0])
//            translate([0,0,-20]) cylinder(h=20, d=1.6, $fn=12);
//        } 
//   }  
//}
//
////Guides
//if ($preview && 1) {
//    for (angle=[0,120,240]) {
//        rotate([0,0,angle]) Nail([0,8,3], [80,0,0]);
//    }
//    color("white",0.1) cylinder(h=5, d=40);
//}


