//###############################################################################
//# ShelfLight - Power Supply                                                   #
//###############################################################################
//#    Copyright 2025 Dirk Heisswolf                                            #
//#    This file is part of the ShelfLight project.                             #
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
//#   February 16, 2025                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <../ShelfLight_Config.scad>

module ShelfLight_PowerSupply ()  {
    description = str("LED power supply (Aliexpress COXO Ultra Thin LED Power Supply)");
    vitamin(str("ShelfLight_PowerSupplys(): ", description));

    color("silver")
    difference() {
        union() {
            rotate([90,0,90])
            linear_extrude(supplyX) {
                polygon([[             0,                0],
                         [supplyY,                       0],
                         [supplyY,         supplyZ-supplyC],
                         [supplyY-supplyC, supplyZ],
                         [        supplyC, supplyZ],
                         [        supplyC, supplyZ],
                         [              0, supplyZ-supplyC]]);
            }
        }
        union() {
            translate([       -6,-10,14]) cube([10,73,10]);
            translate([supplyX-4,-10,14]) cube([10,73,10]);           
        }
    }
}
ShelfLight_PowerSupply();


