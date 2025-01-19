//###############################################################################
//# SkadisParts - Board                                                         #
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
include <../SkadisParts_Config.scad>

module skandisBoard (x=36,y=56)  {
    description = str("IKEA Skandis biard ",x,"x",y);
    vitamin(str("skandisTNut(", x,",", y," cm): ", description));

    color("white")
    //minkowski() {
        //sphere(r=SkadisEdgeR, $fn=4);
        difference() {
            union() {
                hull() {
                    //translate([       SkadisCornerR,       SkadisCornerR,-SkadisDz+SkadisEdgeR]) cylinder(r=SkadisCornerR-SkadisEdgeR, h=SkadisDz-2*SkadisEdgeR);
                    //translate([       SkadisCornerR,(10*y)-SkadisCornerR,-SkadisDz+SkadisEdgeR]) cylinder(r=SkadisCornerR-SkadisEdgeR, h=SkadisDz-2*SkadisEdgeR);
                    //translate([(10*x)-SkadisCornerR,       SkadisCornerR,-SkadisDz+SkadisEdgeR]) cylinder(r=SkadisCornerR-SkadisEdgeR, h=SkadisDz-2*SkadisEdgeR);
                    //translate([(10*x)-SkadisCornerR,(10*y)-SkadisCornerR,-SkadisDz+SkadisEdgeR]) cylinder(r=SkadisCornerR-SkadisEdgeR, h=SkadisDz-2*SkadisEdgeR);                
                    translate([       SkadisCornerR,       SkadisCornerR,-SkadisDz]) cylinder(r=SkadisCornerR, h=SkadisDz);
                    translate([       SkadisCornerR,(10*y)-SkadisCornerR,-SkadisDz]) cylinder(r=SkadisCornerR, h=SkadisDz);
                    translate([(10*x)-SkadisCornerR,       SkadisCornerR,-SkadisDz]) cylinder(r=SkadisCornerR, h=SkadisDz);
                    translate([(10*x)-SkadisCornerR,(10*y)-SkadisCornerR,-SkadisDz]) cylinder(r=SkadisCornerR, h=SkadisDz);                
               }
            }
            union() {
                for (offset=[[SkadisHoleSx/2,SkadisHoleSy],[SkadisHoleSx,SkadisHoleSy/2]]) {
                    //echo("offset = ",offset);
                    for (yPos=[offset.y:SkadisHoleSy:(9.9*y)]) {
                        //echo("yPos = ",yPos);
                        for (xPos=[offset.x:SkadisHoleSx:(9.9*x)]) {
                            //echo("xPos = ",xPos);
                            hull() {
                                //translate([xPos,yPos+SkadisHoleDy/2,-20]) cylinder(d=SkadisHoleDx+2*SkadisEdgeR, h=40);
                                //translate([xPos,yPos-SkadisHoleDy/2,-20]) cylinder(d=SkadisHoleDx+2*SkadisEdgeR, h=40);
                                translate([xPos,yPos+(SkadisHoleDy-SkadisHoleDx)/2,-20]) cylinder(d=SkadisHoleDx, h=40);
                                translate([xPos,yPos-(SkadisHoleDy-SkadisHoleDx)/2,-20]) cylinder(d=SkadisHoleDx, h=40);
                            }  
                        }
                    }
                }
            }
        }
    //}
}
*skandisBoard();
