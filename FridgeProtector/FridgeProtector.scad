//###############################################################################
//# FridgeProtector                                                             #
//###############################################################################
//#    Copyright 2021 Dirk Heisswolf                                            #
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
//#   Prevents dents in the fridge from the kitchen handle                      #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 11, 2024                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

//Global Parameters
dimH    = 100;   //height
dimW    =  40;   //width
dimD    =   6;   //depth
rad     =   3;   //radius

magD    =  12;   //magnet diameter
magH    =   2.7; //magnet height
magB    =   3.4; //mahnet bore

module magnetHole(x=0,y=0) {
  $fn=64;
  difference() {
    translate([x,y,0.2]) cylinder(h=magH+0.4,d=magD+0.4);
    translate([x,y,-1]) cylinder(h=magH+2,d=magB-0.4);
  }
}
*magnetHole();

difference() {
  hull() {
    for (xyz = [[0+rad,0+rad,0],
                [0+rad,dimH-rad,0],
                [dimW-rad,dimH-rad,0],
                [dimW-rad,0+rad,0]]) translate(xyz) {
      $fn=64;             
      translate([0,0,dimD-rad]) sphere(r=rad);
      cylinder(h=1,r=rad);
    }
  }
  union(){
     magnetHole(x=dimW/2, y=4+magD/2); 
     magnetHole(x=dimW/2, y=dimH-4-magD/2); 
  }
}





