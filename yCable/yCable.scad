//###############################################################################
//# yCable - Main Assembly                                                      #
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
//#   Y-cable                                                                   #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   April 15, 2022                                                            #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

//include <BOSL2/std.scad>
//include <BOSL2/threading.scad>
include <NopSCADlib/lib.scad>

$fn=128;

module cables() {
    color("black")
    for(angle=[0,120,240]) {  
        rotate([0,90,angle])
        translate([0,0,5])
        cylinder(h=40, d=4);
    }    
}

module rprism(height=5 ,width=20, zOffset=0) {
 color("orange")
 hull()
 for(angle=[0,120,240]) {  
    rotate([0,0,angle])
    translate([width/4,0,zOffset])            
    cylinder(h=height, d=width/2, center=false);
 }
    

}

module body() {
    difference() {
        union() {
            translate([0,0,-3]) cylinder(h=5, d=32);
        }
        union() {
             rprism(height=8, width=20, zOffset=-2);
             for(angle=[0,120,240]) {  
                rotate([0,90,angle])
                translate([0,0,25])
                union() {
                    cylinder(h=40, d=4, center=true);
                    translate([-4,0,0]) cube([8,4,40], center=true);
                }
            }
            for(angle=[60,180,300]) {  
                rotate([0,0,angle])
                translate([11,0,-3])
                nut_trap(M3_cap_screw, M3_nut, depth = 0, horizontal = false, supported = false, h = 40);
            }
        }
    }
    translate([-4,0,0])     rotate([0,0,90]) cube([1,7,4], center=true);
    translate([1.5,2.5,0])  rotate([0,0,60])  cube([1,6,4], center=true);
    translate([1.5,-2.5,0]) rotate([0,0,300]) cube([1,6,4], center=true);

}

module top() {
    difference() {
        union() {
            translate([0,0,2]) cylinder(h=1, d=32);
            difference() {
                intersection() {
                    for(angle=[0,120,240]) {  
                        rotate([0,0,angle])
                        translate([10,0,1])
                        cube([20,3.6,2], center=true); 
                    }
                    translate([0,0,-3]) cylinder(h=5, d=32);
                }
                rprism(height=8, width=20, zOffset=-2);
            }
        }
        union() {
            rotate([0,0,330])
            translate([0,-12,3.3])
            linear_extrude(height=1, center=true)
            text("R", size=6, halign="center", valign="center");

            rotate([0,0,210])
            translate([0,-12,3.3])
            linear_extrude(height=1, center=true)
            text("L", size=6, halign="center", valign="center");
            
            rotate([0,0,90])
            translate([0,-12,3.3])
            linear_extrude(height=1, center=true)
            text("IN", size=6, halign="center", valign="center");
            
             for(angle=[0,120,240]) {  
                rotate([0,90,angle])
                translate([0.6,0,25])
                union() {
                    cylinder(h=40, d=4, center=true);
                }    
            }
            for(angle=[60,180,300]) {  
                rotate([0,0,angle])
                translate([11,0,-3])
                nut_trap(M3_cap_screw, M3_nut, depth = 0, horizontal = false, supported = false, h = 40);
            }
        }
    }
}


//top();

body();

cables();
