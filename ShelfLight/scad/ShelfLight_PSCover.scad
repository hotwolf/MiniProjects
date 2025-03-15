//###############################################################################
//# ShelfLight - Power Supply Cover                                             #
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
include <./ShelfLight_Config.scad>

module ShelfLight_PSCover()  {
 
    difference() {
        union() {
            
            translate([0,0,0])
            rotate([90,0,90])
            linear_extrude(supplyX) {
                polygon([[               -coverT,                      0],
                         [supplyY        +coverT,                      0],
                         [supplyY        +coverT, supplyZ-supplyC+coverT],
                         [supplyY-supplyC+coverT, supplyZ        +coverT],
                         [        supplyC-coverT, supplyZ        +coverT],
                         [        supplyC-coverT, supplyZ        +coverT],
                         [               -coverT, supplyZ-supplyC+coverT]]);
            }
            
        }
        union() {
            
            translate([-10,0,0])
            rotate([90,0,90])
             linear_extrude(supplyX+20) {
                polygon([[             0,               -1],
                         [supplyY,                      -1],
                         [supplyY,         supplyZ-supplyC],
                         [supplyY-supplyC, supplyZ],
                         [        supplyC, supplyZ],
                         [        supplyC, supplyZ],
                         [              0, supplyZ-supplyC]]);
            }
            *translate([-40,0,-1])
            cube([supplyX+80,supplyY,supplyZ-supplyC+1]);
            *translate([-40,supplyC,0])
                cube([supplyX+80,supplyY-2*supplyC,supplyZ]);
            
            
        }
    }
}
*ShelfLight_PSCover();
 
module ShelfLight_PSEnd()  {
    difference() {
        union() {
 
            hull() {
                translate([-30,-2*coverT,-coverT-3])
                cube([50,supplyY+4*coverT,supplyZ+1*coverT+5]);
                
                 translate([-30+coverT,-coverT,-coverT-3])
                cube([50-2*coverT,supplyY+2*coverT,supplyZ+2*coverT+5]);
            }
        }
        union() {
            
            translate([0,0,0])
            rotate([90,0,90])
            linear_extrude(supplyX) {
                polygon([[               -coverT,                     -6],
                         [supplyY        +coverT,                     -6],
                         [supplyY        +coverT, supplyZ-supplyC+coverT],
                         [supplyY-supplyC+coverT, supplyZ        +coverT],
                         [        supplyC-coverT, supplyZ        +coverT],
                         [        supplyC-coverT, supplyZ        +coverT],
                         [               -coverT, supplyZ-supplyC+coverT]]);
            }

            translate([-40,supplyY/2-18,-24]) cube([80,36,40]);
            translate([-55,supplyY/2-24,-24]) cube([40,48,40]);

            translate([-10,3,-3]) ShelfLight_ScrewHole(type=M3_cap_screw);
            translate([-10,supplyY-3,-3]) ShelfLight_ScrewHole(type=M3_cap_screw);

            translate([-22,10,supplyZ-1])         ShelfLight_ScrewHole(type=M3_cap_screw);
            translate([-22,supplyY-10,supplyZ-1]) ShelfLight_ScrewHole(type=M3_cap_screw);
           
        }
    }
    difference() {
        union() {
            translate([-18,supplyY,supplyZ-5])
            rotate([90,0,0])   
            linear_extrude(supplyY) {
                polygon([[-1,0],[1,0],[0,-2]]);
            }
            translate([-22,supplyY,supplyZ-5])
            rotate([90,0,0])   
            linear_extrude(supplyY) {
                polygon([[-1,0],[1,0],[0,-2]]);
            }
            translate([-26,supplyY,supplyZ-5])
            rotate([90,0,0])   
            linear_extrude(supplyY) {
                polygon([[-1,0],[1,0],[0,-2]]);
            }
        }
        union() {
            translate([-22,10,supplyZ-1])         ShelfLight_ScrewHole(type=M3_cap_screw);
            translate([-22,supplyY-10,supplyZ-1]) ShelfLight_ScrewHole(type=M3_cap_screw);
        }
    }    
}
*ShelfLight_PSEnd();

module ShelfLight_PSEndClamp()  {
    difference() {
        union() {

            translate([-28,supplyY/2-23,0])
            cube([12,46,4]);

            translate([-18,supplyY/2+23,4])
            rotate([90,0,0])   
            linear_extrude(46) {
                polygon([[-1,0],[1,0],[0,2]]);
            }
            translate([-22,supplyY/2+23,4])
            rotate([90,0,0])   
            linear_extrude(46) {
                polygon([[-1,0],[1,0],[0,2]]);
            }
            translate([-26,supplyY/2+23,4])
            rotate([90,0,0])   
            linear_extrude(46) {
                polygon([[-1,0],[1,0],[0,2]]);
            }
        }
        union() {
            translate([-22,10,2])
            rotate([180,0,0])
            ShelfLight_NutHole(type=M3_cap_screw);
            translate([-22,supplyY-10,2])
            rotate([180,0,0])
            ShelfLight_NutHole(type=M3_cap_screw);


        }
    }
}
ShelfLight_PSEndClamp();