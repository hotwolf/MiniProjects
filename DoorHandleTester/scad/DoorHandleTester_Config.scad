//###############################################################################
//# KitchenVent - Configuration                                                 #
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
//#   Global configurations for the DoorHandleTester project.                   #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 15, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
//include <../../lib/NopSCADlib/lib.scad>
include <../../lib/NopSCADlib/core.scad>
include <../../lib/NopSCADlib/vitamins/screws.scad>
use     <../../lib/NopSCADlib/printed/handle.scad>
use     <./DoorHandleTester_Parts.scad>
use     <./DoorHandleTester_Clamp.scad>

//Global Variables
doorW      = 16.5;                                //width of the door
doorC      =  0.2;                                //door clearance
screwT     = M4_dome_screw;                       //screw type
screwHoleR = screw_clearance_radius(screwT);      //radius of the screw hole
//screwHeadR = screw_head_radius(screwT);         //radius of the screw head
screwHeadR =  9.4/2;                              //radius of the screw head
//screwHeadH = screw_head_height(screwT);         //height of the screw head
screwHeadH =  4;                                  //height of the screw head
screwHeadC =  0.4;                                //screw head clearance
screwX     = 25;                                  //X position of the screw
clampD     =  2;                                  //depth of the clamp (one side)
clampL     = screwX+screwHeadR+clampD;            //length of the clamp (one side)
clampW     = 20;                                  //width of the clamp (one side)

