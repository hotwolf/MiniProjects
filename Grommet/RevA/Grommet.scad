//###############################################################################
//# Grommet - Frame                                                             #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the HeadphoneHook project.                          #
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
//#   The parameterizable outside ring of a grommet.                            #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 15, 2025                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

outerD  = 58;   //outer diameter
innerD  = 54;   //inner diameter
rimD    = 70;   //rim diameter
outerH  = 25;   //height of the outer frame
lidH    = 20;   //height of the lid0
lidT    =  2;   //thickness of the lid
lidTopT =  8;   //thickness of the top of the lid
outerB  =  0.5; //frame bevel ratio (0=no bevel, 1=full thickness)
lidB    =  0.5; //frame bevel ratio (0=no bevel, 1=full thickness)
rimB    =  0.8; //bevel ratio (0=no bevel, 1=full thickness)
gapW    =  0.2; //width of the gap between lid and frame
ridgeT  =  0.2; //thickness of the outer ridges
ridgeA  = 30;   //angle between ridges
$fn = 256;

module grommetFrame() {
    color("blue")
    union() {
        //Frame
        rotate_extrude() {
            polygon([[innerD/2                                ,0],
                     [innerD/2                                ,outerH],
                     [(outerD/2)-(((outerD-innerD)/2)*outerB) ,outerH],
                     [(outerD/2)                              ,outerH-(((outerD-innerD)/2)*outerB)],
                     [(outerD/2)                              ,0],
                     [(rimD/2)                                ,0],
                     [(rimD/2)                                ,-lidT*(1-rimB)],
                     [(rimD/2)-(lidT*rimB)                    ,-lidT],
                     [(outerD/2)                              ,-lidT]]);
        }
        //Ridges
        for (angle = [ridgeA:ridgeA:360]) {
            rotate([0,0,angle])    
            translate([outerD/2,0,0])
            union() {
                cylinder(h=outerH-(((outerD-innerD)/2)*outerB)-ridgeT, r=ridgeT);
                translate([0,0,outerH-(((outerD-innerD)/2)*outerB)-ridgeT])
                cylinder(h=ridgeT, r1=ridgeT, r2=0);
            }
        }
        
    }
}
*grommetFrame();

module grommetLid(lidTopT=lidTopT) {
    color("green")
    union() {
        rotate_extrude() {
            polygon([[(innerD/2)-gapW                        ,0],
                     [(innerD/2)-gapW                        ,lidH-(lidT*lidB)],
                     [(innerD/2)-gapW-(lidT*lidB)            ,lidH],
                     [(innerD/2)-gapW-lidT                   ,lidH],
                     [(innerD/2)-gapW-lidT                   ,lidTopT-lidT],
                     [0                                      ,lidTopT-lidT],
                     [0                                      ,-lidT],
                     [(outerD/2)-gapW                        ,-lidT]]);
         }
    }
}
*grommetLid();

module grommetLid_cutout(cutoutD=25, cutoutN=2) {
    difference() {
        grommetLid();
        union() {
            for (angle = [360/cutoutN:360/cutoutN:360]) {
                rotate([0,0,angle]) { 
                    translate([(outerD-cutoutD)/2,0,-50]) cylinder(h=outerH+100, d=cutoutD);
                    translate([(outerD-cutoutD)/2,-cutoutD/2,-50]) cube([cutoutD,cutoutD,outerH+100]);
                }
            }
        }                           
    }
}   
*grommetLid_cutout(cutoutD=12, cutoutN=3);

module grommetLid_2cutouts(cutoutD1=25, cutoutA1=0, cutoutD2=15, cutoutA2=180, ) {
    difference() {
        grommetLid();
        union() {
            rotate([0,0,cutoutA1]) {
                translate([(outerD-cutoutD1)/2,0,-50]) cylinder(h=outerH+100, d=cutoutD1);
                translate([(outerD-cutoutD1)/2,-cutoutD1/2,-50]) cube([cutoutD1,cutoutD1,outerH+100]);
            }
            rotate([0,0,cutoutA2]) {
                translate([(outerD-cutoutD2)/2,0,-50]) cylinder(h=outerH+100, d=cutoutD2);
                translate([(outerD-cutoutD2)/2,-cutoutD2/2,-50]) cube([cutoutD2,cutoutD2,outerH+100]);
            }
        }                           
    }
}   
grommetLid_2cutouts(cutoutD1=24, cutoutD2=12);