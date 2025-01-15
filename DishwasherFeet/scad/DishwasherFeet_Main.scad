//###############################################################################
//# DishwasherFeet - Main Assembly                                                 #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the DishwasherFeet project.                            #
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
//#   Main assembly.                                                            #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 16, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./DishwasherFeet_Config.scad>

//Printed part
module DishwasherFeet_Foot_stl() {
    stl("DishwasherFeet_Foot");
    $fn=64;
    color(pp1_colour)
    difference() {
        hull() {
            cylinder(d=washerD+4, h=feetH+4);
            translate([0,0,1])cube([carriageW+4,carriageL,2],center=true);
            translate([-2-carriageW/2,-2-latchT-carriageL/2,0]) cube([carriageW+4,latchT+4,latchH+2]);
            
            
        }
        union() {
            washer_cutout();
            carriage_cutout();
        }
    }
}

//! Assemble all parts 
module main_assembly() {
    //pose([95, 0, 160],[0, 0, 50])
    assembly("main") {

        //Washer
        explode([0,0,40]) washer();

        //Foot
        explode([0,0,20]) DishwasherFeet_Foot_stl();
    }
}

if ($preview) {
    $explode=1;
    main_assembly();
    
    carriage();
}


