//###############################################################################
//# Corner Protector                                                            #
//###############################################################################
//#    Copyright 2025 Dirk Heisswolf                                            #
//#    This file is part of the CornerProtector project.                        #
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
//#   Corner protectors for the Istana shelf                                    #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   March 4, 2025                                                             #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <../lib/NopSCADlib/core.scad>

rimT =   2.6;  // thickness of the rim
rimH =  40.6;  // height of the rim
rimW =  45;    // width of the rim
edgT =   2.5;  // thickness of the front edge
edgD =  10;    // depth of the front edge protector
edgW = 239;    // width of the front edge
edgR =   1;    // small edge radius
cpR  =   6;    // corner radius

$fn=64;

module corner() {
   color("silver") 
   union() {
       translate([0,0,0]) cube([  rimT, 2*rimW, rimH]);
       translate([0,0,0]) cube([2*rimW,   rimT, rimH]);
       translate([0,0,0]) cube([2*rimW, 2*rimW, rimT]);
   }
} 
*corner();

module cornerProtector() {

    union() {
       difference() {
            union() {
                hull() {   
                    translate([   0,    0,    0]) sphere(r=cpR);
                    translate([   0,    0, rimH]) sphere(r=cpR);
                    translate([   0, rimH, rimH]) sphere(r=cpR);
                }
                hull() {   
                    translate([   0,    0,    0]) sphere(r=cpR);
                    translate([   0,    0, rimH]) sphere(r=cpR);
                    translate([rimH,    0, rimH]) sphere(r=cpR);
                }
             }        
            union() {  
               translate([0,0,0]) cube([2*rimW, 2*rimW, rimH]);      
            }        
        }
    
       difference() {
            hull() {   
                translate([   0,    0,    0]) sphere(r=cpR);
                translate([   0, rimH, rimH]) sphere(r=cpR);
                translate([rimH,    0, rimH]) sphere(r=cpR);
            }
            translate([0,0,0]) cube([2*rimW, 2*rimW, 2*rimH]);      
        }
    
       difference() {
            union() {
                            
              
                hull() {   
                    translate([   0,    0, rimH]) sphere(r=cpR);
                    translate([   0, rimH, rimH]) sphere(r=cpR);
                }
                hull() {   
                    translate([   0,    0, rimH]) sphere(r=cpR);
                    translate([rimH,    0, rimH]) sphere(r=cpR);
                }
                  
             }
            union() {
                hull() {
                    translate([0,0,0]) cube([    rimT, 2*rimW, rimH]);
                    translate([0,0,0]) cube([1.6*rimT, 2*rimW, rimH-cpR]);
                }
                hull() {
                    translate([0,0,0]) cube([2*rimW,     rimT, rimH]);
                    translate([0,0,0]) cube([2*rimW, 1.6*rimT, rimH-cpR]);
                }
            }
        }
    }
    
}
*cornerProtector();

module edgeProtector() {

   difference() {
        union() {
            minkowski() {
                union() {
                    translate([edgR,0,0]) rotate([0,90,0]) cylinder(h=edgW-2*edgR, r=cpR-edgR);
                    translate([edgR,0,-cpR+edgR])                  cube([edgW-2*edgR, edgD, 2*(cpR-edgR)]);
                } 
                 sphere(r=edgR);   
            }
                    
        }
      
        union() {  
           #translate([0,0,-edgT/2]) cube([edgW, 30, edgT]);      
        }        
    }
}
edgeProtector();


