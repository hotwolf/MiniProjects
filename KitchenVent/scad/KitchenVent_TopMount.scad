//###############################################################################
//# KitchenVent - Top Mount                                                     #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the KitchenVent project.                            #
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
//#   Top piipe mount of the KitchenVent.                                       #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 15, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./KitchenVent_Config.scad>

//Global variables
screwT  = No632_pan_screw;
radius  = 10;
corners = [[ cutoutMaxD/2-radius, cutoutMaxD/2-radius,0],
           [ cutoutMaxD/2-radius,-cutoutMaxD/2+radius,0],
           [-cutoutMaxD/2+radius,-cutoutMaxD/2+radius,0],
           [-cutoutMaxD/2+radius, cutoutMaxD/2-radius,0]];

//Top mount
module KitchenVent_TopMount_stl() {
    stl("KitchenVent_TopMount");
    
    color(pp1_colour)
    //translate([0,-pipeY,0])
    difference() {
        union() {
            hull() {
                for (pos = corners) {
                    translate([pos.x,pos.y,-coverW]) cylinder(r=radius, h=coverW);
                } 
            }
            translate([0,0,0]) cylinder(d=cutoutMinD, h=boardW);
        }
        union() {
            for (pos = corners) {
                translate([pos.x,pos.y,-10]) cylinder(r=screw_radius(screwT), h=30);
            }
            pipeCutout(y=0,z=-10);
        }
    }
}
*KitchenVent_TopMount_stl();

//! Assemble top mount 
module KitchenVent_TopMount_assembly() {
    //pose([95, 0, 160],[0, 0, 50])
    assembly("KitchenVent_TopMount") {

        //Shelf
        //explode([0,0,0]) cabinetTop(z=pipeL-boardW-10);
        
        //Pipe
        //explode([0,0,-100]) pipe();

        //Screws
        explode([0,0,-60])
        for (pos = corners) {
            translate([pos.x,pos.y-pipeY,pipeL-boardW-coverW-10]) {
                rotate([180,0,0])
                screw_and_washer(No632_pan_screw, 16);
            }
        }

        //Top mount
        explode([0,0,-40])
        translate([0,-pipeY,pipeL-boardW-10]) KitchenVent_TopMount_stl();
    }
}

if ($preview) {
    $explode=1;

    //Shelf
    explode([0,0,0]) cabinetTop(z=pipeL-boardW-10);
        
    //Pipe
    explode([0,0,-100]) pipe();

    //Top mount
    KitchenVent_TopMount_assembly();
}