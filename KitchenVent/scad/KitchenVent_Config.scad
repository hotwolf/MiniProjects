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
//#   Global configurations for the KitchenVent.                                #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 15, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <../../lib/NopSCADlib/lib.scad>
//include <../../lib/NopSCADlib/core.scad>
//include <../../lib/NopSCADlib/vitamins/screws.scad>
use     <./KitchenVent_Parts.scad>
use     <./KitchenVent_ShelfCover.scad>
use     <./KitchenVent_TopMount.scad>
use     <./KitchenVent_Outlet.scad>

//Global Variables
pipeD      = 150;     //outer pipe diameter
pipeC      =   0.4;   //pipe clearance
pipeL      = 600;     //pipe length
pipeY      = 200;     //distance from pipe center to back wall
cutoutMinD = 160;     //diameter of the cut out
cutoutMaxD = 180;     //diameter of the cover
boardW     =  18;     //width of the closet walls/shelfs
boardC     =   0.4;   //board clearance
coverW     =   2;     //width of the cover

