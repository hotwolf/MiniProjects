//###############################################################################
//# ShelfLight - Configuration                                                  #
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
//#   Global configurations for printable Skadis accessories.                   #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   February 16, 2025                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
//include <../../lib/NopSCADlib/lib.scad>
include <../../lib/NopSCADlib/core.scad>
use     <./vitamins/ShelfLight_PowerSupply.scad>

//Layer height
layerH =  0.2;

//Power supply dimensions
supplyX = 225; //Length of the power supply
supplyY =  53; //Width of the power supply
supplyZ =  21; //Height of the power supply
supplyC =   7; //Chamfer of the power supply

//Cover
coverT  =  2;  //Thickness of the cover

//Screws
screwT         = M3_pan_screw;
screwL         = 20;

//Screw hole
module ShelfLight_ScrewHole(type=screwT, layerH=layerH, h=40) {
    translate([0,0,-h]) cylinder(h=h, r=screw_clearance_radius(type));
    translate([0,0,0])  cylinder(h=h, d=screw_boss_diameter(type));
    intersection() {
        translate([0,0,-2*layerH])  cylinder(h=2*layerH, d=screw_boss_diameter(type));
        union() {
            translate([0,0,-0.5*layerH])  cube([screw_boss_diameter(screwT),2*screw_clearance_radius(type),layerH], center=true);
            translate([0,0,   -layerH])  cube([2*screw_clearance_radius(screwT),2*screw_clearance_radius(type),2*layerH], center=true); 
        }
    }
}
*ShelfLight_ScrewHole();

//Nut hole
module ShelfLight_NutHole(type=screwT, layerH=layerH, h=40) {
    translate([0,0,-h]) cylinder(h=h, r=screw_clearance_radius(type));
    rotate([0,0,30])
    translate([0,0,0])  cylinder(h=h, r=screw_nut_radius(type), $fn=6);
    intersection() {
        rotate([0,0,30])      
        translate([0,0,-2*layerH])  cylinder(h=2*layerH, r=screw_nut_radius(type), $fn=6);
        union() {
        translate([0,0,-0.5*layerH])  cube([screw_boss_diameter(screwT),2*screw_clearance_radius(type),layerH], center=true);
        translate([0,0,   -layerH])   cube([2*screw_clearance_radius(screwT),2*screw_clearance_radius(type),2*layerH], center=true); 
        }
    }
}
*ShelfLight_NutHole();
