//###############################################################################
//# KitchenVent - Clamp                                                         #
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
//#   A hook for the Radiator.                                                  #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 21, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./RadiatorHooks_Config.scad> 

//Clamp
module RadiatorHooks_Clamp_stl() {
    stl("RadiatorHooks_Clamp");
    $fn=64;
    color(pp1_colour)
    //translate([0,-pipeY,0])
    //Top
    difference() {
        union() {
           //Clamp 
           rotate([0,0,90-clampA/2]) 
           rotate_extrude(angle=clampA)
           translate([(pipeD+pipeC)/2,0,0])
           square([clampD,clampW]);
            
           rotate([0,0,clampA/2]) 
           translate([0,(pipeD+pipeC)/2+clampD,0]) 
           cylinder(d=2*clampD,h=clampW);    
            
           rotate([0,0,-clampA/2]) 
           translate([0,(pipeD+pipeC)/2+clampD,0]) 
           cylinder(d=2*clampD,h=clampW);    
            
            //Hook
            hull() {
                translate([0,-2+(pipeD+pipeC)/2,2])
                scale([16,5,10])
                sphere(d=1);
            
                translate([0,8+(pipeD+pipeC)/2,(clampW/2)])
                scale([8,5,10])
                sphere(d=1);
            }
            
             hull() {
                translate([0,8+(pipeD+pipeC)/2,(clampW/2)])
                scale([8,5,10])
                sphere(d=1);
            
                translate([0,8+(pipeD+pipeC)/2,clampW-5])
                scale([8,5,10])
                sphere(d=1);
            }
         }
        union() {
            pipeCutout();
            translate([0,0,-50]) cube(100, center=true);
        }
    }
}
*RadiatorHooks_Clamp_stl();

//! Attach handle to clamp
module RadiatorHooks_Clamp_assembly() {
    //pose([95, 0, 160],[0, 0, 50])
    assembly("RadiatorHooks_Clamp") {

        //Clamps
        translate([0,0,0]) RadiatorHooks_Clamp_stl();
    }
}

if ($preview) {
    $explode=1;
    
    //Pipe
    explode([0,-40,0])
    pipe();
        
    //Clamp
    RadiatorHooks_Clamp_assembly();
}