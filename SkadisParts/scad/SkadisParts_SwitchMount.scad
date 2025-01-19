//###############################################################################
//# SkadisParts - Mount for TP-Link Switch                                      #
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
//#   Mount for a TP-Link 8-port switch, utilizing the customizable mounting    #
//#   bracket by torwan (see https://www.thingiverse.com/thing:6490337)         #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 17, 2025                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./SkadisParts_Config.scad>

//Switch dimensions
module switch() {
    
    color("DarkBlue")
    translate([-51.5,-79,3]) cube([103,158,26.4]);
    
}
*switch();

//Switch mount
module skadisSwitchMount_stl() {
    stl("WPClampScrewGrip");
    color(pp1_colour)

    skadisBracket(boxW             =  160,
                  lowerArmL        =   18.0,
                  lowerArmA        =    5,
                  upperArmL        =   18,
                  upperArmA        =   -5,
                  fingerL          =   8.5,
                  fingerA          = -140,
                  bracketW         =   12,
                  bracketT         =    3);      
}    
skadisSwitchMount_stl();

module skadisSwitchMount_assembly() {
  //pose([25,30,20], [80,0,240])
    assembly("skadisSwitchMount") {

        for (bPos = [[ 0.5*SkadisHoleSx,0,0],
                    [-0.5*SkadisHoleSx,0,0]]) {
            translate(bPos) {
                skadisSwitchMount_stl();
                
                for (sPos = skadisBracket_screwPos(160)) {
                    translate(sPos) {
                        skandisTNut_with_nut();
                        translate([0,0,1]) screw_and_washer(screwType, screwL);
                    }
                }
            }
        }
    }
}
*skadisSwitchMount_assembly();

if($preview) {
    $explode = 0;
    skadisSwitchMount_assembly();

    *switch();

    *translate([-5.5*SkadisHoleSx,-5*SkadisHoleSy,0]) skandisBoard();
}
