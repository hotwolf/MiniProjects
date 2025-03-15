//###############################################################################
//# Broom Stick Tip                                                             #
//###############################################################################
//#    Copyright 2025 Dirk Heisswolf                                            #
//#    This file is part of the BroomStickTip project.                          #
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
//#   A replacement cap for a metal berrm stick.                                #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   February 25, 2025                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

stickD  = 23;   // Diameter od the broom stick
capT    =  2;   // Thickness of the cap
capH    = 24;   // Height of the cap

$fn=128;

module broomStickTip() {
   difference() {
       union() {
           rotate_extrude() {
               hull() {
                   translate([stickD/2,0,0]) circle(r=capT);
                   translate([stickD/2,capH,0]) circle(r=capT);
               }
           }
           translate([0,0,-capT]) cylinder(h=capH+2*capT, d=stickD);
       }
       union() {
           translate([0,0,0]) cylinder(h=capH+capT+1, d=stickD);   
       }
   }
   intersection() {
       union() {
           for (angle = [0:60:360]) {
               rotate([0,0,angle]) {
                  #hull() { 
                       translate([ 0.5+stickD/2,0,0]) sphere(d=1);
                       translate([ 0.5+stickD/2,0,capH]) sphere(d=1);
                       translate([-0.5+stickD/2,0,0]) sphere(d=1);
                       translate([-0.5+stickD/2,0,capH]) sphere(d=1);
                       
                       
                       
                   }
               }
           }
       }
       union() {
          translate([0,0,0]) cylinder(h=capH+capT+1, d=stickD);   
       }
   }
} 
broomStickTip();
