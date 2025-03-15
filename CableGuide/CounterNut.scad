//###############################################################################
//# Counter Nut                                                              #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the CableGuide project.                             #
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
//#   M4 counter nut                                                            #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   February 18, 2025                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

nutD     =   8.1;
screwD   =   4;
counterW =  16;
counterD =   9;
counterH =   4;
$fn      = 128;

module counterNut() {
  difference() {
    hull() {
        translate([-counterW/2,-counterW/2,0]) cube([counterW,counterW,1]);
        cylinder(h=counterH, d=counterD);
    }
    union() {
        translate([0,0,1])  cylinder(h=10, d=nutD, $fn=6);
        translate([0,0,-1]) cylinder(h=10, d=screwD);
    }
  }
}
counterNut();
