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

outerD  = 62;   //outer diameter
innerD  = 59.4; //inner diameter


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

module grommetAdapter() {
    color("blue")
    difference() {
        union() {
            //Frame
            rotate_extrude() {
                polygon([[innerD/2                                ,0],
                         [innerD/2                                ,outerH],
                         [(outerD/2)-(((outerD-innerD)/2)*outerB) ,outerH],
                         [(outerD/2)                              ,outerH-(((outerD-innerD)/2)*outerB)],
                         [(outerD/2)                              ,0]]);
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
        union() {
            translate([-40,-10,12]) cube([80,20,40]);
            
        }
    }
}
grommetAdapter();
