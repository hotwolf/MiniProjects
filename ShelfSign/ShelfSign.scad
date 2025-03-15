//###############################################################################
//# Shelf Sign                                                                  #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the ShelfSign project.                              #
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
//#   A headphone hook                                                          #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 9, 2024                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

//! This is a tray foe essential oil bottles. It is designed to fit inside a box
//! Din A4 footprint. The tray is divided into four pieces to fit on a standard 
//! 3D printer bed.

shelfT  = 17.5; // Thickness of the shelf
springO =  2;   // Room for the Spring
clampW  = 40;   // Width 0f the clamp
clampD  = 20;   // Depth 0f the clamp
clampT  =  2;   // Thickness 0f the clamp
$fn=32;

module shelf() {
    color("white")
    translate([-200,0,0]) cube([400,200,shelfT]);
}
*shelf();

module clamp() {
    translate([-clampW/2,-clampT,shelfT]) cube([clampW,clampD+clampT,clampT]);
    *translate([-clampW/2,-clampT,-clampT-springO]) cube([clampW,clampT,shelfT+2*clampT+springO]);
    
    hull() {
        translate([-clampW/2,-clampT,-clampT-springO]) cube([clampW,clampT,clampT]);
        translate([-clampW/2,clampD/2,-(clampT+springO)/2]) rotate([0,90,0]) cylinder(h=clampW, d=clampT);
    }

    hull() {
        translate([-clampW/2,clampD/2,-(clampT+springO)/2]) rotate([0,90,0]) cylinder(h=clampW, d=clampT);
        translate([-clampW/2,clampD,-clampT/2-springO]) rotate([0,90,0]) cylinder(h=clampW, d=clampT);
    }

    translate([-clampW/2,clampD,-(clampT+springO)/2]) rotate([0,90,0]) cylinder(h=clampW, d=clampT+springO);
}
*clamp();

module arrow() {
    translate([-clampW/2,0,shelfT+clampT])
    rotate([90,0,0])
    linear_extrude(2*clampT)
    polygon([[0,0],
             [clampW,0],
             [clampW,-shelfT-2*clampT-springO], 
             [clampW/2,1.5*(-shelfT-2*clampT-springO)],
             [0,-shelfT-2*clampT-springO]]);
    clamp();
}
*arrow();

module cross() {
    for (m = [0,1]) 
    mirror([m,0,0])
    translate([-clampW/2,0,shelfT+clampT])
    rotate([90,0,0])
    linear_extrude(2*clampT)
    polygon([[0,0],
             [0.4*clampW,0],
             [    clampW,-shelfT-clampT-springO],
             [    clampW,-shelfT-2*clampT-springO],
             [0.6*clampW,-shelfT-2*clampT-springO],
             [0,-clampT]]);
    clamp();
}
cross();


