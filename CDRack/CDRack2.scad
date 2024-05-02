




module jewelCase(tilt=false) {
   translate([0,-71.5,2]) rotate([0,tilt?-10:0,0]) cube([10.4,143,125]);
}

module 2xJewelCase(tilt=false) {
   translate([0,-71.5,2]) rotate([0,tilt?-10:0,0]) cube([23,143,125]);
}

module jewelCaseSlot() {
   translate([0,0,0]) jewelCase(true);
   translate([0,0,0]) jewelCase(false);
}

difference() {
   union() {
      translate([0,-80,0]) rotate([0,0,0]) cube([232,160,20]);
      hull() {
        translate([0,-80,0]) rotate([0,0,0]) cube([232,8.5,20]);
        translate([0,-80,0]) rotate([0,0,0]) cube([232,4,24]);         
      } 
      hull() {
        translate([0,71.5,0]) rotate([0,0,0]) cube([232,8.5,20]);
        translate([0,76,0]) rotate([0,0,0]) cube([232,4,24]);         
      } 
       
   }
   union() {
      for(x=[36:14:230]) {
         translate([x,0,0]) jewelCaseSlot();
      }
      translate([25,-60,-10]) rotate([0,0,0]) cube([203,120,40]);
      translate([2,0,0]) rotate([0,0,0]) 2xJewelCase();
      translate([2,0,20]) rotate([0,30,0]) 2xJewelCase();

      
   }  
}