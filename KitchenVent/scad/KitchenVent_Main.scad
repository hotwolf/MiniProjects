//###############################################################################
//# KitchenVent - Main Assembly                                                 #
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
//#   Main assembly.                                                            #
//#                                                                             #
//###############################################################################
//# Version History:                                                            #
//#   December 16, 2024                                                         #
//#      - Initial release                                                      #
//#                                                                             #
//###############################################################################
include <./KitchenVent_Config.scad>

//! Assemble all parts 
module main_assembly() {
    //pose([95, 0, 160],[0, 0, 50])
    assembly("main") {

        //Shelf
        explode([0,-400,0]) shelf(z=pipeL/2);

        //Cabinet top
        explode([0,0,0]) cabinetTop(z=pipeL-boardW-10);
        
        //Pipe
        explode([0,0,-100]) pipe();

        //Shelf cover
        //KitchenVent_ShelfCover_assembly();
        
        //Top mount
        explode(-40)
        KitchenVent_TopMount_assembly();
        
        //Outlet
        explode(20)
        KitchenVent_Outlet_assembly();
    }
}

if ($preview) {
    $explode=1;
    main_assembly();
}


