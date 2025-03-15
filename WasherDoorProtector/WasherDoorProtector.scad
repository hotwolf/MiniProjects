//###############################################################################
//# Washer Door Protector                                                       #
//###############################################################################
//#    Copyright 2025 Dirk Heisswolf                                            #
//#    This file is part of the WasherDoorProtector project.                    #
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
//#   A stop for the washer door                                                #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   March 1, 2025                                                             #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

d1 = 44;
d2 = 30.2;
d3 = 48;
l1 = 10;
l2 = 32;
l3 = 43;
c  = 2;
$fn=128;

module washerDoorProtector() {
   rotate_extrude(angle=240) 
   difference() {
       union() {
           polygon([[d1/2,    0],
                    [d1/2,   l1],
                    [d1/2,   l2],
                    [d2/2,   l2],
                    [d2/2,   l3],
                    [d3/2-c, l3],
                    [d3/2,   l3-c],
                    [d3/2,   c],
                    [d3/2-c, 0]]);
                    

        


       }
       union() {



       }
   }
} 
washerDoorProtector();
