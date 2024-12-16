//###############################################################################
//# KitchenVent - Shelf Cover                                                   #
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
//#   Cover for the shelf cutout.                                               #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 15, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./KitchenVent_Config.scad>

//Shelf cover
module KitchenVent_ShelfCover_stl() {
    stl("KitchenVent_ShelfCover");
    color(pp1_colour) 
    difference() {
        union() {
            translate([0,-pipeY,boardW+boardC/2])  cylinder(d=cutoutMaxD, h=coverW);
            translate([0,-pipeY,0])                cylinder(d=cutoutMinD, h=boardW);
            translate([0,-pipeY,-coverW-boardC/2]) cylinder(d=cutoutMaxD, h=coverW);
            
            translate([-cutoutMaxD/2,-pipeY,boardW+boardC/2])  cube([cutoutMaxD,pipeY,coverW]);
            translate([-cutoutMinD/2,-pipeY,-boardC/2])        cube([cutoutMinD,pipeY,boardW+boardC]);
            translate([-cutoutMaxD/2,-pipeY,-coverW-boardC/2]) cube([cutoutMaxD,pipeY,coverW]);            
        }
        pipeCutout(z=-1);
    }
}
*KitchenVent_ShelfCover_stl();



//! Assemble shelf cover 
module KitchenVent_ShelfCover_assembly() {
    //pose([95, 0, 160],[0, 0, 50])
    assembly("KitchenVent_ShelfCover") {

        //Shelf
        //explode([0,-400,0]) shelf(z=pipeL/2);
        
        //Pipe
        //explode([0,0,400])pipe();

        //Cover
        translate([0,0,pipeL/2]) KitchenVent_ShelfCover_stl();
    }
}

if ($preview) {
    $explode=1;
    
     //Shelf
     explode([0,-400,0]) shelf(z=pipeL/2);
        
     //Pipe
     explode([0,0,400])pipe();
     
     //Cover 
     KitchenVent_ShelfCover_assembly();
}
