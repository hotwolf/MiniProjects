//###############################################################################
//# SkadisParts - Wrapper for the customizable bracket by torwan                #
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
//#   A general purpose mounting bracket utilising a design by torwan           #
//#   (see https://www.thingiverse.com/thing:6490337)                           #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   January 18, 2025                                                          #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./SkadisParts_Config.scad>

//Customizable mounting bracket by torwan (https://www.thingiverse.com/thing:6490337)
//===================================================================================
module bracketWrapper(my_what_to_show      =    0,                // 0 - show a holder with a box & text, 1 - show only a holder (to print)
                      my_bracket_base_type =    0,                // Bracket type, 0 - straight base, 1 - arched base with one screw hole
                      my_endstop_enabler   =    0,                // End-stop activation
                      my_bracket_width     =   12.0,              // Bracket width
                      my_bracket_thickness =    3.0,              // Bracket thickness
                      my_rounding_radius   =    0.5,              // Bracket rounding radius      
                      my_box_width         =   40.0,              // Your box width
                      my_box_play          =    0.5,              // Play for your box width play
                      my_upper_arm_l       =   17.5,              // Upper arm length
                      my_upper_arm_ang     =   -2,                // Upper arm angle
                      my_lower_arm_l       =   18.0,              // Lower arm length
                      my_lower_arm_ang     =    3,                // Lower arm angle
                      my_finger_l          =   10.0,              // Bottom finger length
                      my_finger_ang        = -130,                // Bottom finger angle
                      my_base_radius       =  400,                // Base radius (for arched base, when bracket_base_type == 1)
                      my_end_stop_h        =    5.0,              // End stop height
                      my_end_stop_th       =    3.0,              // End stop thickness
                      my_end_stop_lf       =    0.6,              // End stop width (as fraction of upper arm length)
                      my_screws_distance   =   20,                // Distance between screws (zero means one screw hole)
                      my_screw_head_dia    =    6.4,              // Screw head diameter
                      my_screw_leg_dia     =    3.3,              // Screw leg diameter (make it 0.1-0.2 bigger than real)
                      my_screw_head_h      =    2.6,              // Screw head height
                      my_screw_head_drop   =    0.2) {            // How much a screw has to drop into material (hiding head)

   //Bracket
   include    <./customizable-box-psu-power-adapter-holder.scad>
   what_to_show      = my_what_to_show;                 // 0 - show a holder with a box & text, 1 - show only a holder (to print)
   bracket_base_type = my_bracket_base_type;            // Bracket type, 0 - straight base, 1 - arched base with one screw hole  
   endstop_enabler   = my_endstop_enabler;              // End-stop activation							  
   bracket_width     = my_bracket_width;                // Bracket width							  
   bracket_thickness = my_bracket_thickness;            // Bracket thickness							  
   rounding_radius   = my_rounding_radius;              // Bracket rounding radius      					  
   box_width         = my_box_width;                    // Your box width							  
   box_play          = my_box_play;                     // Play for your box width play					  
   upper_arm_l       = my_upper_arm_l;                  // Upper arm length							  
   upper_arm_ang     = my_upper_arm_ang;                // Upper arm angle							  
   lower_arm_l       = my_lower_arm_l;                  // Lower arm length							  
   lower_arm_ang     = my_lower_arm_ang;                // Lower arm angle							  
   finger_l          = my_finger_l;                     // Bottom finger length						  
   finger_ang        = my_finger_ang;                   // Bottom finger angle							  
   base_radius       = my_base_radius;                  // Base radius (for arched base, when bracket_base_type == 1)		  
   end_stop_h        = my_end_stop_h;                   // End stop height							  
   end_stop_th       = my_end_stop_th;                  // End stop thickness							  
   end_stop_lf       = my_end_stop_lf;                  // End stop width (as fraction of upper arm length)			  
   screws_distance   = my_screws_distance;              // Distance between screws (zero means one screw hole)			  
   screw_head_dia    = my_screw_head_dia;               // Screw head diameter							  
   screw_leg_dia     = my_screw_leg_dia;                // Screw leg diameter (make it 0.1-0.2 bigger than real)		  
   screw_head_h      = my_screw_head_h;                 // Screw head height							  
   screw_head_drop   = my_screw_head_drop;              // How much a screw has to drop into material (hiding head)		  
}
*bracketWrapper(my_box_width=100);

//Screw positions
function skadisBracket_screwOff(boxW) = floor((boxW-SkadisHoleSx/2)/SkadisHoleSx)*(SkadisHoleSx/2);
function skadisBracket_screwPos(boxW) = [[0,-skadisBracket_screwOff(boxW),0],
                                         [0, skadisBracket_screwOff(boxW),0]];

// Skadis mounting bracket
module skadisBracket(boxW             =  100,
                     lowerArmL        =   18.0,
                     lowerArmA        =    3,
                     upperArmL        =   17.5,
                     upperArmA        =   -2,
                     fingerL          =   10.0,
                     fingerA          = -130,
                     bracketW         =   12,
                     bracketT         =    3,
                     screwType        = screwType) {
    
   //Screw positions
   screwOff = skadisBracket_screwOff(boxW);
   *translate([0,-screwOff,0]) cylinder(d=5,h=40);
   *translate([0, screwOff,0]) cylinder(d=5,h=40);
                     
    difference() {
        union() {
                         
            // Bracket
            translate([-bracketW/2,0,bracketT/2])
            rotate([90,0,90])
            bracketWrapper(my_what_to_show      = 1,
                           my_box_width         = boxW,
                           my_upper_arm_l       = upperArmL,
                           my_upper_arm_ang     = upperArmA,
                           my_lower_arm_l       = lowerArmL,
                           my_lower_arm_ang     = lowerArmA,
                           my_finger_l          = fingerL,
                           my_finger_ang        = fingerA,
                           my_bracket_width     = bracketW,
                           my_bracket_thickness = bracketT,
                           my_screws_distance   = 2*skadisBracket_screwOff(boxW),
                           my_screw_head_dia    = screw_boss_diameter(screwType),				  
                           my_screw_leg_dia     = 2*screw_clearance_radius(screwType),			  
                           my_screw_head_h		= 0,				  
                           my_screw_head_drop	= screw_head_height(screwType)+0.5 
            );
            
            // Nut counters
            for (pos=skadisBracket_screwPos(boxW))
                translate(pos) skandisTNutCounter();
    
        }
        union() {
            //Just in case
        }
    }
}
skadisBracket(boxW=99);

// Skadis mounting bracket with screws




*translate([-5*SkadisHoleSx,-5*SkadisHoleSy,0]) skandisBoard();
