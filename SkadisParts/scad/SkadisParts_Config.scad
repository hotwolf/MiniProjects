//###############################################################################
//# SkadisParts - Configuration                                                 #
//###############################################################################
//#    Copyright 2025 Dirk Heisswolf                                            #
//#    This file is part of the SkadisParts project.                            #
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
//#   Global configurations for printable Skadis accessories.                   #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 17, 2025                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
//include <../../lib/NopSCADlib/lib.scad>
include <../../lib/NopSCADlib/core.scad>
use     <./vitamins/SkadisParts_Board.scad>
use     <./vitamins/SkadisParts_Tnut.scad>
use     <./SkadisParts_MountingBracket.scad>


//Skadis measurements
SkadisHoleDx   =  5;    // X dimension of each hole
SkadisHoleDy   = 15;    // Y dimension of each hole
SkadisHoleSx   = 40;    // Distance between the centers of two holes in X direction
SkadisHoleSy   = 40;    // Distance between the centers of two holes in Y direction
SkadisHoleOx   = 20;    // Distance between the edge of the board and the center of the closest hole in X direction
SkadisHoleOy   = 20;    // Distance between the edge of the board and the center of the closest hole in Y direction
SkadisDz       =  5;    // Thickness of the board
SkadisEdgeR    =  1;    // Edge radius
SkadisCornerR  = 10;    // Corner Radius

//Screws
screwType      = M2p5_pan_screw;
screwL         = 20;