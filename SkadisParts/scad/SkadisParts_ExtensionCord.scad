//###############################################################################
//# SkadisParts - Extension cord mount                                          #
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
//#   A mount for a Hama 10 socket extension cord                               #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 18, 2025                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./SkadisParts_Config.scad>

//Screw positions
sPosLeft = [[-4*SkadisHoleSx, 1.5*SkadisHoleSy,0],
            [-4*SkadisHoleSx,-1.5*SkadisHoleSy,0]];

sPosRight = [[ 4*SkadisHoleSx, 1.5*SkadisHoleSy,0],
             [ 4*SkadisHoleSx,-1.5*SkadisHoleSy,0]];

sPos = concat(sPosLeft, sPosRight);

*cube([338,70,40],center=true);

//Bottom of the extension cord
module extensionCord() {
    
        translate([-129,0,0]) {
            hull() {
                translate([-20,0,0]) scale([40,77,2.4]) cylinder(h=1, d=1);
                translate([  0,0,0]) scale([40,77,2.4]) cylinder(h=1, d=1);
            }
            translate([  0,0,0]) scale([40,77,10]) cylinder(h=1, d=1);
        }
    
         translate([ 129,0,0]) {
            hull() {
                translate([ 20,0,0]) scale([40,77,2.4]) cylinder(h=1, d=1);
                translate([  0,0,0]) scale([40,77,2.4]) cylinder(h=1, d=1);
            }
            #translate([  0,0,0]) scale([40,77,10]) cylinder(h=1, d=1);
        }        
}
*extensionCord();

// Extension cord mount
module skadisExtensionCordMount_stl() {
    $fn = 128;
    stl("skadisExtensionCordMount");
    color(pp1_colour)
 
    difference() {
        union() {
            //Holder
            hull() {
                for (pos = sPosLeft) translate(pos) cylinder(h=5, d=20);
                *for (pos = sPosLeft) translate(pos) translate([SkadisHoleSx/2,0,0]) cylinder(h=5, d=20);

                translate([-3*SkadisHoleSx,-1*SkadisHoleSy,0]) cylinder(h=5, d=35);
                translate([-3*SkadisHoleSx, 1*SkadisHoleSy,0]) cylinder(h=5, d=35);


                translate([-4*SkadisHoleSx,-0.5*SkadisHoleSy,0]) cylinder(h=5, d=35);
                translate([-4*SkadisHoleSx, 0.5*SkadisHoleSy,0]) cylinder(h=5, d=35);
            }
            
            
            //T-nut counters
            for (pos = sPosLeft) translate(pos) skandisTNutCounter();
            
        }
        union() {
            //Extension cord
            hull() {
                translate([-150,0,0]) scale([42,79,2.8]) cylinder(h=1, d=1);
                translate([ 150,0,0]) scale([42,79,2.8]) cylinder(h=1, d=1);
            }
            hull() {
                translate([-130,0,0]) scale([42,79,20]) cylinder(h=1, d=1);
                translate([ 130,0,0]) scale([42,79,20]) cylinder(h=1, d=1);
            }
            //Screws
            for (pos = sPosLeft) translate(pos) { 
                translate([0,0,-40]) cylinder(h=80, d=2*screw_clearance_radius(screwType));
            
                translate([0,0,4.5-screw_head_height(screwType)]) cylinder(h=20, d=screw_boss_diameter(screwType));
           
            
                
            }   

        }
    }  
}
skadisExtensionCordMount_stl();

//Assembly of the extension cord mount
module skadisExtensionCordMount_assembly() {
    //pose([25,30,20], [80,0,240])
    assembly("skadisExtensionCordMount") {

        //Mounts
        skadisExtensionCordMount_stl();
        rotate([0,0,180]) skadisExtensionCordMount_stl();

        //T-Nuts
        for (pos = sPos) translate(pos) skandisTNut_with_nut();

        //Screws
        for (pos = sPos) translate(pos) translate([0,0,2.7]) screw_and_washer(screwType, screwL);

    }
}
*skadisExtensionCordMount_assembly();

if($preview) {
    $explode = 0;
    
    //Extension cord mount
    skadisExtensionCordMount_assembly();
    
    //Extension Cord 
    extensionCord();
    
    //Skadis board
    translate([-4.5*SkadisHoleSx,-3.5*SkadisHoleSy,0]) skandisBoard();
}

