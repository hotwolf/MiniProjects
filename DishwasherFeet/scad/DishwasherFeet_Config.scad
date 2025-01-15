//###############################################################################
//# DishwasherFeet - Configuration                                                 #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the DishwasherFeet project.                            #
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
//#   Global configurations for the DishwasherFeet.                                #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 25, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
//include <../../lib/NopSCADlib/lib.scad>
include <../../lib/NopSCADlib/core.scad>
//include <../../lib/NopSCADlib/vitamins/screws.scad>
use     <./DishwasherFeet_Parts.scad>
use     <./DishwasherFeet_Main.scad>


//Global Variables
washerD      = 43.2;     //washer outer diameter
washerB      = 13.8;     //washer bore
washerT      =  3.8;     //washer thickness
washerS      =  0.2;     //washer slack

carriageW    = 50;       //carriage width
carriageL    = 60;       //carriage length
latchH       =  4.6;     //latch height
latchT       =  1.6;     //latch thickness
latchS       =  0.2;     //latch slack

feetH        = 20;       //feet height
