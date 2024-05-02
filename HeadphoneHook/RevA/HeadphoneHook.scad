//###############################################################################
//# Headphone Hook                                                              #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the HeadphoneHook project.                          #
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
//#   A headphone hook                                                          #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   April 4, 2024                                                             #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

//! This is a tray foe essential oil bottles. It is designed to fit inside a box
//! Din A4 footprint. The tray is divided into four pieces to fit on a standard 
//! 3D printer bed.

shelfW = 19.4;
$fn=128;
module shelf() {
    color("white")
    translate([-200,0,0]) cube([400,200,shelfW]);
}
//shelf();

module hook() {
    intersection() {
        union() {     
            translate([ 0,30,-90]) scale([1,0.5,1]) cylinder(h=shelfW+100, d=30);
            translate([-15,-50,-90]) cube([30,80,shelfW+100]);
        }
        union() {
            //Clamp
            difference() {
                hull() {
                    translate([0,30,shelfW]) scale([1,0.5,0.5]) sphere(d=32);
                    translate([0, 0,shelfW]) scale([1,0.5,0.5]) sphere(d=32);
                    translate([0,30,     0]) scale([1,0.5,0.5]) sphere(d=32);
                    translate([0, 0,     0]) scale([1,0.5,0.5]) sphere(d=32);
                }
                shelf();
            }
            //Vertical part
            difference() {
                union() {
                  translate([0,30,-30]) scale([1,0.5,1]) cylinder(h=30, d=32);
                  translate([0,30,-30]) scale([1,0.5,0.5]) sphere(d=32);                    
                }
                union() {
                    translate([0,26,-60]) scale([1,0.5,1]) cylinder(h=60, d=30);                    
                    translate([0,60,-34]) rotate([90,0,0]) scale([1,0.5,1]) cylinder(h=100, d=30);                    
               }
            }
            //Headphone rest
            difference() {
                hull() {
                  translate([0, 30,-30]) scale([1,0.5,0.5]) sphere(d=32);                    
                  translate([0,-10,-30]) scale([1,0.5,0.5]) sphere(d=32);                    
                }
                union() {
                    translate([0,60,-34]) rotate([90,0,0]) scale([1,0.5,1]) cylinder(h=100, d=30);                    
                    translate([0,-10,-30]) rotate([45,0,0]) translate([0,-4,-40]) scale([1,0.5,1]) cylinder(h=100, d=30);                    
               }
            }
            //Hook
            difference() {
                translate([0,-10,-30]) rotate([45,0,0]) hull() {
                    translate([0, 0, 0]) scale([1,0.5,0.5]) sphere(d=32);                    
                    translate([0,-0,10]) scale([1,0.5,0.5]) sphere(d=32);                    
                }
                 union() {
                    translate([0,-10,-30]) rotate([45,0,0]) translate([0,-4,-40]) scale([1,0.5,1]) cylinder(h=100, d=30);                    
                    translate([0,60,-34]) rotate([90,0,0]) scale([1,0.5,1]) cylinder(h=100, d=30);                    
                }
            }
        }
    }    
}
hook();