//###############################################################################
//# Generic Spacer                                                              #
//###############################################################################
//#    Copyright 2025 Dirk Heisswolf                                            #
//#    This file is part of the Spacer project.                                 #
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
//#   Gerneric spacer to ce scaled by the slicer software.                      #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 28, 2025                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

innerD =   3.4; //inner diameter
outerD =  12;   //outer diameter
H      =  10;   //height
$fn    = 128;

module spacer(innerD=innerD, outerD=outerD, H=H) {
    difference() {
        translate([0,0,0])  cylinder(d=outerD, h=H);
        translate([0,0,-1]) cylinder(d=innerD, h=H+2);
    }
}
spacer();



