//###############################################################################
//# Ivar Feet                                                                   #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the IvarFeet project.                               #
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
//#   Feet for Ivar shelf                                                       #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   February 17, 2025                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

legW  = 44; //width of the leg
legD  = 33; //depth of the leg
legH  = 10; //height of the overlap
footH = 10; //distance to the ground
footT = 3; //thickness of the foot
$fn   = 128;

module ivarFoot(h=footH) {
  difference() {
    union() {
        hull() {
            translate([ legW/2, legD/2,0]) cylinder(h=legH+h, r=footT);
            translate([ legW/2,-legD/2,0]) cylinder(h=legH+h, r=footT);
            translate([-legW/2, legD/2,0]) cylinder(h=legH+h, r=footT);
            translate([-legW/2,-legD/2,0]) cylinder(h=legH+h, r=footT);
        }
    }
    union() {
        translate([0,0,20+h]) cube([legW,legD,40], center=true);
        hull() {
            translate([0,0,23+h]) cube([legW,legD,30], center=true);
            translate([0,0,24+h]) cube([legW+2,legD+2,28], center=true);
        }
        
    }
  }
}
*ivarFoot();
*ivarFoot(15);
ivarFoot(20);
