//###############################################################################
//# RadiatorHooks - Non-printable Parts                                         #
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
//#   Non-printable parts                                                       #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 21, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./RadiatorHooks_Config.scad>

module pipe(x=0,y=0,z=0) {
    color("white")
    translate([x,y,z-50]) cylinder(d=pipeD,100);
}
*pipe();

module pipeCutout(x=0,y=0,z=0) {
    translate([x,y,z-50]) cylinder(d=pipeD+pipeC,100);
}
*pipeCutout();
