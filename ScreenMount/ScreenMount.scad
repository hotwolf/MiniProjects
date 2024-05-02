//###############################################################################
//# ScreenMount - Main Assembly                                                 #
//###############################################################################
//#    Copyright 2021 Dirk Heisswolf                                            #
//#    This file is part of the DiffCaSt project.                               #
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
//#   Screen mount                                                              #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   September 22, 2021                                                        #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################

//Global Parameters
Rod_diameter    = 26;
LProf_height    = 20;
LProf_width     = 20;
LProf_thickness = 1.6;
Wall_thickness  = 2;
Clamp_length    = 25;
Slack           = 1;

//Aluminium L-profile
module LProfile(trans     = [0,0,0], 
                rot       = [0,0,0],
                length    = 100,
                height    = LProf_height,
                width     = LProf_width,
                thickness = LProf_thickness) {
    translate(trans)
    rotate(rot) {
        color("gray") { 
            cube([length,width,thickness]);
            cube([length,thickness,height]);                    
        }            
    }
}

//Rod
module Rod(trans     = [0,0,0], 
           rot       = [0,0,0],
           length    = 100,
           diameter  = Rod_diameter) {
    translate(trans)
    rotate(rot) {
        color("brown") { 
            cylinder(h=length,d=diameter);                
        }            
    }
}

//Rod mount
module RodMount() {
    color("green")
    difference() {
        union() {
           translate([-Wall_thickness,
                      -Wall_thickness,
                      0]) 
           cube([Rod_diameter+(2*Wall_thickness),
                 LProf_width+(2*Wall_thickness),
                 (Rod_diameter/2+Wall_thickness)]);
            
           translate([-Wall_thickness,
                      -Wall_thickness,
                      -LProf_height-Wall_thickness]) 
           cube([Rod_diameter+(2*Wall_thickness),
                 LProf_thickness+(2*Wall_thickness),
                 LProf_height+Wall_thickness]);
            
           translate([-Wall_thickness,
                      -Wall_thickness,
                      -LProf_thickness-Wall_thickness]) 
           cube([Rod_diameter+(2*Wall_thickness),
                 LProf_width+(2*Wall_thickness),
                 LProf_thickness+Wall_thickness]);
        }  
        union() {

            //Lower profile
            LProfile(rot=[270,0,0]);

            //Rod
            Rod(rot=[90,0,0],
                trans=[(Rod_diameter/2),50,(Rod_diameter/2)+Wall_thickness]);
 
        }
    }
} 

//Lower guide
module LowerGuide() {
    color("green")
    difference() {
        union() {
            
           translate([-Wall_thickness,
                      -Wall_thickness,
                      -LProf_height-Wall_thickness]) 
           cube([Clamp_length+(2*Wall_thickness),
                 LProf_thickness+(2*Wall_thickness),
                 LProf_height+Wall_thickness]);
            
           translate([-Wall_thickness,
                      -Wall_thickness,
                      -LProf_thickness-Wall_thickness]) 
           cube([Clamp_length+(2*Wall_thickness),
                 LProf_width+(2*Wall_thickness),
                 LProf_thickness+(2*Wall_thickness)]);

           translate([-Wall_thickness,
                      -Wall_thickness,
                      0]) 
           cube([Clamp_length+(2*Wall_thickness),
                 (2*Wall_thickness),
                 (1.5*LProf_thickness)+(2*Wall_thickness)]);
  
           translate([-Wall_thickness,
                      -Wall_thickness,
                      (1.5*LProf_thickness)+Wall_thickness]) 
           cube([Clamp_length+(2*Wall_thickness),
                 LProf_width+(2*Wall_thickness),
                 (2*Wall_thickness)]);
        
        }  
        union() {

            //Lower profile
            LProfile(rot=[270,0,0]);
 
        }
    }
} 

//Brace
module Brace() {
    color("green")
    union() {
        
       translate([30,
                  -(2*Wall_thickness)-(Slack/2),
                  LProf_thickness+Wall_thickness+(Slack/2)]) 
       cube([Clamp_length,
             LProf_width+(6*Wall_thickness)+Slack,
             (2*Wall_thickness)]);
  
       translate([30,
                  LProf_width+(2*Wall_thickness)+(Slack/2),
                  -LProf_height+LProf_thickness-(1*Wall_thickness)-(Slack/2)]) 
       cube([Clamp_length,
             (2*Wall_thickness),
             LProf_height+(4*Wall_thickness)+Slack]);
  
       translate([30,
                  -(2*Wall_thickness)-(Slack/2),
                  -LProf_height+LProf_thickness-(3*Wall_thickness)]) 
       cube([Clamp_length,
             (2*Wall_thickness),
             LProf_height+(6*Wall_thickness)+(Slack/2)]);

        translate([30,
                  -(2*Wall_thickness)-(Slack/2),
                  -LProf_height-(2*Wall_thickness)-(Slack/2)]) 
        cube([Clamp_length,
              (2*Wall_thickness)+LProf_thickness+Slack,
              (2*Wall_thickness)]);

        translate([30,
                  LProf_width-LProf_thickness+(2*Wall_thickness)-(Slack/2),
                  -LProf_height-Slack]) 
        cube([Clamp_length,
              (2*Wall_thickness)+LProf_thickness+Slack,
              (2*Wall_thickness)]);
        
    }
} 

//Upper guide
module UpperGuide() {
    color("green")
    rotate([0,0,180])
    translate([-100,
               -LProf_width-LProf_thickness-Wall_thickness,
               LProf_thickness+Wall_thickness])
    difference() {
        union() {
            
           translate([-Wall_thickness,
                      -Wall_thickness,
                      -LProf_height-Wall_thickness]) 
           cube([Clamp_length+(2*Wall_thickness),
                 LProf_thickness+(2*Wall_thickness),
                 LProf_height+Wall_thickness]);
            
           translate([-Wall_thickness,
                      -Wall_thickness,
                      -LProf_thickness-Wall_thickness]) 
           cube([Clamp_length+(2*Wall_thickness),
                 LProf_width+(2*Wall_thickness),
                 LProf_thickness+(2*Wall_thickness)]);
  
           translate([-Wall_thickness,
                       Wall_thickness,
                      -(2.5*LProf_thickness)-(3*Wall_thickness)]) 
           cube([Clamp_length+(2*Wall_thickness),
                 LProf_width,
                 (2*Wall_thickness)]);
        
        }  
        union() {

            //Lower profile
            LProfile(rot=[270,0,0]);
 
        }
    }
} 

//Rod mount
//RodMount();
//mirror([0,1,0]) RodMount();

//Lower guide
//LowerGuide();
//mirror([0,1,0]) LowerGuide();

//Upper Guide
//UpperGuide();
//mirror([0,1,0]) UpperGuide();

//Brace
Brace();

//Lower profile
//LProfile(rot=[270,0,0]);

//Upper profile
//LProfile(rot=[180,0,0], 
//         trans=[0,LProf_width+(2*Wall_thickness),Wall_thickness+LProf_thickness]);

//Rod
//Rod(rot=[90,0,0],
//    trans=[(Rod_diameter/2),50,(Rod_diameter/2)+Wall_thickness]);








