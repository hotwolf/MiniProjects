//###############################################################################
//# KitchenVent - Clamp                                                         #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the DoorHandleTester project.                       #
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
//#   Clamp of the DoorHandleTester.                                            #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 21, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./DoorHandleTester_Config.scad> 


//Sub-parts
module clamp_corner() {
    rotate([0,0,270])
    rotate_extrude(angle=90)
    translate([0,0,0]) square([clampD,clampW]);
}
*clamp_corner();

module clamp_side() {
    translate([0,0,-clampW/2])                rotate([0,0,0])   clamp_corner();
    translate([-clampL,0,-clampW/2]) rotate([0,0,270]) clamp_corner();
    translate([-clampL,-clampD,-clampW/2]) cube([clampL,clampD,clampW]);
}
*clamp_side();

//Clamp
module DoorHandleTester_Clamp_stl() {
    stl("DoorHandleTester_Clamp");
    //$fn=128;
    color(pp1_colour)
    //translate([0,-pipeY,0])
    //Top
    difference() {
        union() {
            translate([0,0,0])                           clamp_side();
            translate([0,doorW+doorC,0]) mirror([0,1,0]) clamp_side();
            translate([0,0,-clampW/2])             cube([clampD,doorW+doorC,clampW]);
            hull() {
                translate([-screwX,0,0]) rotate([90,0,0]) cylinder(r=screwHeadR+clampD,h=screwHeadH+screwHeadC+clampD);
                translate([-screwX-screwHeadR-clampD,-clampD,-clampW/2]) cube([2*(screwHeadR+clampD),clampD,clampW]);
            }
        }
        union() {
            translate([-screwX,10,0]) rotate([90,0,0]) cylinder(r=screwHoleR,h=20);
            translate([-screwX,60,0]) rotate([90,0,0]) cylinder(r=screwHeadR,h=screwHeadH+screwHeadC+60);     
        }
    }
}
*DoorHandleTester_Clamp_stl();

//! Attach handle to clamp
module DoorHandleTester_Clamp_assembly() {
    //pose([95, 0, 160],[0, 0, 50])
    assembly("DoorHandleTester_Clamp") {

        //Clamps
        translate([0,0,0]) DoorHandleTester_Clamp_stl();
        translate([0,0,-handle_length()]) DoorHandleTester_Clamp_stl();
        
        //Screws
        translate([-screwX,-screwHeadH,0])               rotate([270,0,0]) screw(screwT, 25);
        translate([-screwX,-screwHeadH,-handle_length()]) rotate([270,0,0]) screw(screwT, 25);
        
        //Handle
        translate([-screwX,0,0]) handle();
    }
}

if ($preview) {
    $explode=1;
    
    //Door
    explode([-40,0,0])
    door();
        
    //Clamp
    DoorHandleTester_Clamp_assembly();
}