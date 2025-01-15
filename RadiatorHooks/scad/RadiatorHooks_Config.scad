//###############################################################################
//# RadioHooks - Configuration                                                  #
//###############################################################################
//#    Copyright 2024 Dirk Heisswolf                                            #
//#    This file is part of the RadiatorHooks project.                          #
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
//#   Global configurations for the RadiatorHooks project.                      #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 21, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
//include <../../lib/NopSCADlib/lib.scad>
include <../../lib/NopSCADlib/core.scad>
use     <./RadiatorHooks_Parts.scad>
use     <./RadiatorHooks_Clamp.scad>

//Global Variables
pipeD      =  25;      //diameter of a radiator pipe
pipeC      =   0.0;    //clearance
clampD     =   2;      //thickness of the clamp
clampW     =  20;      //width of the clamp
clampA     = 240;      //width of the clamp

