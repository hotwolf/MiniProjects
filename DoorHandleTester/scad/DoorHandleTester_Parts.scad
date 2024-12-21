//###############################################################################
//# DoorHandleTester - Non-printable Parts                                      #
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
//#   Non-printable parts                                                       #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 21, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./DoorHandleTester_Config.scad>

module door(x=0,y=0,z=0) {
    color("white")
    translate([x-200,y,z-200]) cube([200,doorW,300]);
}
*door();
 
module handle(x=0,y=0,z=0) {
    explode([0,-20,0])
    color("white")
    translate([x,y-handle_height(),z-handle_length()/2+handle_width()/2])
    rotate([270,90,0]) handle_stl();
}
handle();
