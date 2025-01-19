//###############################################################################
//# SkadisParts - Cable clamps                                                   #
//###############################################################################
//#    Copyright 2025 Dirk Heisswolf                                            #
//#    This file is part of the SkadisParts project.                            #
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
//#   Clamps for cable management                                               #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 18, 2025                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./SkadisParts_Config.scad>

cordD = 8; // cord diameter

// Extension cord mount
module skadisEdgeClamp_stl() {
    //$fn = 128;
    stl("skadisEdgeClamp");
    color(pp1_colour)
 
    translate([0,0,-SkadisDz/2])
     difference() {
        union() {

            for (mir = [[0,0,0],[0,0,1]]) 
            mirror(mir) {
                //Grip
                hull() {
                    *translate([0,( SkadisHoleDy-SkadisHoleDx)/2,(SkadisDz/2)-1])
                    cylinder(d=5, h=1.1);
                    *translate([0,-(SkadisHoleDy-SkadisHoleDx)/2,(SkadisDz/2)-1])
                    cylinder(d=5, h=1.1);
                    translate([0,(SkadisHoleDy-SkadisHoleDx)/2,(SkadisDz/2)])
                    rotate([180,0,0])
                    cylinder(d1=5, d2=1, h=2);
                    translate([0,-(SkadisHoleDy-SkadisHoleDx)/2,(SkadisDz/2)])
                    rotate([180,0,0])
                    cylinder(d1=5, d2=1, h=2);
                }
                //Plate
                hull() {
                    *translate([0,( SkadisHoleDy-SkadisHoleDx)/2,(SkadisDz/2)+0.1])
                    cylinder(d=10, h=2);
                    *translate([0,-(SkadisHoleDy-SkadisHoleDx)/2,(SkadisDz/2)+0.1])
                    cylinder(d=10, h=2);
                
                    translate([0,-SkadisHoleDy/2,(SkadisDz/2)+0.1])
                    cube([2+SkadisHoleDx/2,SkadisHoleDy,2]);                
                    translate([1-SkadisHoleSx/2,-10,(SkadisDz/2)+0.1])
                    cube([1+SkadisHoleSx/2,20,2]);
                }
            }
            //Cable arc
            translate([-0.1+(cordD/2)-SkadisHoleSx/2,10,(SkadisDz/2)+(cordD/2)])
            rotate([90,0,0])
            cylinder(h=20,d=cordD+4);            
            translate([-2.1-SkadisHoleSx/2,-10,(SkadisDz/2)+0.1])
            cube([cordD+4,20,(cordD/2)+0]);
            //Lower edge
            translate([1-SkadisHoleSx/2,0,1-(SkadisDz/2)])
            rotate([90,180,0])
            rotate_extrude(angle=90) {
                translate([1.1,-10,0]) square([2,20]);
            }
            translate([-2.1-SkadisHoleSx/2,-10,1-SkadisDz/2])
            cube([2,20,5]);
        }   
        union() {
            //Cord
            translate([-0.1+(cordD/2)-SkadisHoleSx/2,40,(SkadisDz/2)+(cordD/2)])
            rotate([90,0,0])
            cylinder(h=80,d=cordD);            
            translate([-0.1-SkadisHoleSx/2,-40,0])
            cube([cordD,80,(cordD/2)+(SkadisDz/2)]);
            translate([-0.1-SkadisHoleSx/2,-40,(SkadisDz/2)-0.9])
            cube([cordD+10,80,1]);
        }   
    }
}    
skadisEdgeClamp_stl();

//Assembly of the extension cord mount
module skadisEdgeClamp_assembly() {
    //pose([25,30,20], [80,0,240])
    assembly("skadisExtensionCordMount") {

        //Clamp
        skadisEdgeClamp_stl();
        
    }
}

if($preview) {
    $explode = 0;
    
    //Edge Clamp
    skadisEdgeClamp_assembly();
        
    //Skadis board
    *translate([-0.5*SkadisHoleSx,-3*SkadisHoleSy,0]) skandisBoard();
}
