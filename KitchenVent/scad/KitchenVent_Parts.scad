//###############################################################################
//# KitchenVent - Non-printable Parts                                           #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the KitchenVent project.                            #
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
//#   Non-printable parts                                                       #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 15, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./KitchenVent_Config.scad>

module pipe(x=0,y=-pipeY,z=0) {
    color("white")
    difference() {
        translate([x,y,z]) cylinder(d=pipeD, h=pipeL);
        translate([x,y,z-1]) cylinder(d=pipeD-1, h=pipeL+2);
    }
}
*pipe();
    
module pipeCutout(x=0,y=-pipeY,z=0) {
    translate([x,y,z]) cylinder(d=pipeD+pipeC, h=pipeL);
}
*pipeCutout();
    
module shelf(x=0,y=0,z=0) {
    color("white")
    difference() {
        translate([x-300,y-380,z]) cube([600,380,boardW]);
        union() {
            translate([x,y-pipeY,z-1]) cylinder(d=cutoutMinD, h=boardW+2);
            translate([x-cutoutMinD/2,y-pipeY,z-1]) cube([cutoutMinD,pipeY+1,boardW+2]);       
        }
    }
}
*shelf();
    
 module cabinetTop(x=0,y=0,z=0) {
    color("white")
    difference() {
        translate([x-300,y-380,z]) cube([600,380,boardW]);
        translate([x,y-pipeY,z-1]) cylinder(d=cutoutMinD, h=boardW+2);
    }
}
*cabinetTop();
    
 