//###############################################################################
//# SkadisParts - T-nut                                                         #
//###############################################################################
//#    Copyright 2025 Dirk Heisswolf                                            #
//#    This file is part of the SkadisParts project.                            #
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
//#   A wrapper for the M2.5 T-Nut designed by "6d6178"                         #
//#   see "https://www.printables.com/model/228663-skadis-t-nuts-mounting-      #
//#        system-for-ikea-skadis-pegb"                                         #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 17, 2025                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <../SkadisParts_Config.scad>

module skandisTNut ()  {
    description = str("Skandis M2,5 T-Nut by [6d6178](https://www.printables.com/model/228663-skadis-t-nuts-mounting-system-for-ikea-skadis-pegb)");
    vitamin(str("skandisTNut(): ", description));

    color(pp1_colour)
    rotate([0,0,90])
    translate([0,0,-8.5])
    import("Skadis T-Nut M2.5.stl", convexity=4);
}
*skandisTNut();

module skandisTNut_with_nut()  {
    skandisTNut();
    translate([0,0,-8.5]) rotate([0,0,120]) nut(M2p5_nut);    
}
*skandisTNut_with_nut();

module skandisTNutCounter()  {
    
    difference() {
        union() {
            hull() {
                translate([0,(SkadisHoleDy-SkadisHoleDx)/2,0])
                rotate([180,0,0])
                cylinder(d1=5, d2=3, h=1);
    
                translate([0,-(SkadisHoleDy-SkadisHoleDx)/2,0])
                rotate([180,0,0])
                cylinder(d1=5, d2=3, h=1);
            }
        }
        union() {
                translate([0,0,-1])
                cylinder(d1=8, d2=6, h=1);

                translate([0,0,-2])
                cylinder(d=8, h=1);

                translate([0,0,0])
                cylinder(d=6, h=1);

            
        }
    }
    
}
skandisTNutCounter();

*skandisTNut_with_nut();
*translate([-5*SkadisHoleSx,-5.5*SkadisHoleSy,0]) skandisBoard();
