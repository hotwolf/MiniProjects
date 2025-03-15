//###############################################################################
//# Drill Template                                                              #
//###############################################################################
//#    Copyright 2025 Dirk Heisswolf                                            #
//#    This file is part of the DrillTemplate project.                          #
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
//#   A replacement cap for a metal berrm stick.                                #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   February 25, 2025                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

templateT =  2;   // Thickness of the template
holeD     =  1;   // Drill hole diameter
holeX     = 32.5; // Drill hole X offset
holeY     = 39;   // Drill hole Y offset
$fn=128;

module drillTemplate() {
   difference() {
       union() {
           translate([0,0,0]) cube([50+2*holeX,2*holeY,templateT]);
           translate([-templateT,0,0]) cube([templateT,2*holeY,5+templateT]);
           translate([5+2*holeX,0,0]) cube([45,templateT,5+templateT]);
           translate([5+2*holeX,2*holeY-templateT,0]) cube([45,templateT,5+templateT]);
       }
       union() {
          translate([holeX,holeY,-10]) cylinder(h=30, d=holeD);
          translate([holeX,holeY,0]) cylinder(h=templateT, d2=holeD, d1=3);
       }
   }
} 
drillTemplate();
