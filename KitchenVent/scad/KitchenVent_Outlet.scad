//###############################################################################
//# KitchenVent - Outlet                                                        #
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
//#   Outlet of the KitchenVent.                                                #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 16, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./KitchenVent_Config.scad>

socketH = 10;  //socket height
radius  = 10;  //corner radius
//Outlet
module KitchenVent_Outlet_stl() {
    stl("KitchenVent_Outlet");
    $fn=64;
    color(pp1_colour)
    //translate([0,-pipeY,0])
    union() {
        //Rim
        difference() {
            translate([0,0,0]) cylinder(d=cutoutMaxD,h=socketH);
             pipeCutout(y=0,z=-10);
        }
        //Top
        difference() {
            translate([0,0,socketH])
            rotate_extrude() {
                hull() {
                    translate([(cutoutMaxD/2)-radius,(cutoutMaxD/2)-radius,0]) circle(r=radius);
                    translate([                    0,                    0,0]) square([radius,cutoutMaxD/2]);
                    translate([                    0,                    0,0]) square([cutoutMaxD/2,radius]);
                }
            }
            hull() {       
                for (pos=[[  0,    0,socketH],
                          [-200,-100,socketH],
                          [ 200,-100,socketH]]) {
                    translate(pos)
                    scale([pipeD+pipeC,pipeD+pipeC,(pipeD+pipeC)]) sphere(r=0.5);
                }
            }
        }
    }
}
*KitchenVent_Outlet_stl();
//! Assemble outlet
module KitchenVent_Outlet_assembly() {
    //pose([95, 0, 160],[0, 0, 50])
    assembly("KitchenVent_Outlet") {

        //Shelf
        //explode([0,0,0]) cabinetTop(z=pipeL-boardW-10);
        
        //Pipe
        //explode([0,0,0]) pipe();
 
        //Outlet
        explode([0,0,40])
        translate([0,-pipeY,pipeL-10]) KitchenVent_Outlet_stl();
    }
}

if ($preview) {
    $explode=1;
    
    //Shelf
    explode([0,0,0]) cabinetTop(z=pipeL-boardW-10);
        
    //Pipe
    explode([0,0,0]) pipe();


    //Outlet
    KitchenVent_Outlet_assembly();
}