//###############################################################################
//# CableGuide                                                                  #
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
//#   Cable channel corners parts                                               #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   February 17, 2025                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

guideW = 80;  //width of the cable guide
guideD = 32; //depth of the cable guide
guideH = 12; //height of the cable guide
guideT =  2; //thickness of the cable guide
gapW   = 10; //width of the gap
$fn    = 128;

module cableGuide() {
  difference() {
    union() {
        translate([guideH/2+guideT/2,guideW/2-guideH/2-guideT/2,-guideD/2]) rotate([0,0,0])
        rotate_extrude(angle=90) translate([guideH/2,0,0]) square([guideT,guideD]);

        translate([guideH/2+guideT/2,-guideW/2+guideH/2+guideT/2,-guideD/2]) rotate([0,0,270])
        rotate_extrude(angle=90) translate([guideH/2,0,0]) square([guideT,guideD]);

        translate([0,             0,       0]) cube([guideT,         guideW,guideD], center=true);
        translate([guideH/4,     -guideW/2,0]) cube([guideH/2+guideT,guideT,guideD], center=true);
        translate([guideH/4,      guideW/2,0]) cube([guideH/2+guideT,guideT,guideD], center=true);
        translate([guideH+guideT, 0,       0]) cube([guideT,  guideW-guideH,guideD], center=true);   
    }
    union() {
        translate([guideH+guideT,0,0]) 
        rotate([45,0,0]) 
        cube([guideH,gapW,2*guideD], center=true);
    }
  }
}
cableGuide();
