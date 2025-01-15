//###############################################################################
//# DishwasherFeet - Non-printable Parts                                           #
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
//#   Non-printable parts                                                       #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 25, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./DishwasherFeet_Config.scad>

//Washer
module washer(x=0,y=0,z=feetH) {
    color("silver")
    translate([x,y,z])
    difference() {
        translate([0,0,-washerT]) cylinder(d=washerD, h=washerT);
        translate([0,0,-washerT-1]) cylinder(d=washerB, h=washerT+2);
    }
}
*washer();

//Washer cutout
module washer_cutout(x=0,y=0,z=feetH) {
    translate([x,y,z])
    difference() {
        translate([0,0,-washerT]) cylinder(d=washerD+2*washerS, h=washerT);
        translate([0,0,-washerT-1]) cylinder(d=washerB-2*washerS, h=washerT+2);
    }
    translate([x,y,z-washerS]) cylinder(d=washerD+2*washerS, h=10);
}
*washer_cutout();

//Carriage
module carriage(x=0,y=0,z=0) {
    //Base
    color("black")
    translate([x,y,z-1])
    cube([carriageW,carriageL,2],center=true);
    //Latch
    color("silver")
    translate([x-carriageW/2,y-latchT-carriageL/2,z-2])
    cube([carriageW,latchT,latchH+2]);
  
}
*carriage();

//Carriage cutout
module carriage_cutout(x=0,y=0,z=0) {
    //Base
    translate([x,y,z-1])
    cube([carriageW+20,carriageL+20,2],center=true);
    //Latch
    translate([x-latchS-carriageW/2,y-latchT-latchS-carriageL/2,z-2])
    cube([carriageW+2*latchS,latchT+2*latchS,latchH+latchS+2]);
  
}
*carriage_cutout();

