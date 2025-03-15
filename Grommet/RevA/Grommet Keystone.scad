//###############################################################################
//# Grommet - Lid for two Keystone Jacks                                        #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the Grommet project.                                #
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
use <./Grommet.scad>

keyS    =  0.2; //slack
keyX    = 14.6; //X dimension
keyY    = 16.2; //Y dimension

$fn = 256;

module keystone() {

    difference() {
        union() {
            
            translate([-(keyX+keyS)/2,-(keyY+keyS)/2,0])   cube([keyX+keyS, keyY+keyS, 30]);
            translate([     -6,-keyY/2,5])   cube([12, 20+keyS, 25]);
            hull() {
                translate([ -6,-keyY/2,5])   cube([12, 23, 1.6]);
                translate([ -6,-keyY/2,5])   cube([12, 20, 4.6]);
            }
            translate([     -9,2.1-keyY/2,9.7]) cube([18, 12, 20.3]);
            hull() {
                translate([-6,-1-keyY/2,7])   cube([12, keyY+keyS+1, 1]);
                translate([-6,  -keyY/2,7])   cube([12, keyY+keyS,   2]);
            }
        }
        union() {       
        }
    }
}
*keystone();

module grommetLid_2keystone() {
    
    difference() {
        grommetLid(16);       
        union() {
            #translate([-10,0,-2]) keystone();
            #translate([ 10,0,-2]) keystone();            
        }
    }  
    
}
grommetLid_2keystone();

module test() {
    difference() {
        translate([-8,-10,0]) cube([16,26,20]);
        keystone();
    }
}
*test();

