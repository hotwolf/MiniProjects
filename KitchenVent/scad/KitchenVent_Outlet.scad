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

connectorD = 10;   //diameter of the connector
connectorC =  0.1; //clearance of the connector
socketH    = 15;   //socket height
radius     = 10;   //corner radius

//Outlet top
module KitchenVent_Outlet_top_stl() {
    stl("KitchenVent_Outlet_top");
    $fn=128;
    color(pp1_colour)
    //translate([0,-pipeY,0])
    //Top
    difference() {
        union() {
            translate([0,0,socketH])
            rotate_extrude() {
                hull() {
                    translate([(cutoutMaxD/2)-radius,(cutoutMaxD/2)-2*radius,0]) circle(r=radius);
                    translate([                    0,                    0,0]) square([radius,(cutoutMaxD/2)-radius]);
                    translate([                    0,                    0,0]) square([cutoutMaxD/2,radius]);
                }
            } 
            for (ang=[-40,-20,0,20,40]) {
                rotate([0,0,ang])
                translate([0,(cutoutMaxD+pipeD)/4,0])
                cylinder(d=connectorD-connectorC,h=socketH);
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
*KitchenVent_Outlet_top_stl();

//Outlet bottom
module KitchenVent_Outlet_bottom_stl() {
    stl("KitchenVent_Outlet_bottom");
    $fn=128;
    color(pp1_colour)
    //translate([0,-pipeY,0])
    union() {
        //Rim
        difference() {
            translate([0,0,0]) cylinder(d=cutoutMaxD,h=socketH);
            union() {
                pipeCutout(y=0,z=-10);
                for (ang=[-40,-20,0,20,40]) {
                    rotate([0,0,ang])
                    translate([0,(cutoutMaxD+pipeD)/4,-10])
                    cylinder(d=connectorD+connectorC,h=socketH+20);
                }
            }
         }
    }
}
*KitchenVent_Outlet_bottom_stl();

//! Glue printed parts together
module KitchenVent_Outlet_assembly() {
    //pose([95, 0, 160],[0, 0, 50])
    assembly("KitchenVent_Outlet") {

        //Shelf
        //explode([0,0,0]) cabinetTop(z=pipeL-boardW-10);
        
        //Pipe
        //explode([0,0,0]) pipe();
 
        //Outlet top
        explode([0,0,80])
        translate([0,-pipeY,pipeL-10]) KitchenVent_Outlet_top_stl();
        
        //Outlet bottom
        explode([0,0,40])
        translate([0,-pipeY,pipeL-10]) KitchenVent_Outlet_bottom_stl();
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