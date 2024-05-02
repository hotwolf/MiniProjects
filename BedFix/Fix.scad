difference() {
    cylinder(h=17,d=35,$fn=120,center=false);
    union()  {
        translate([-9,-17.5,-1]) cube([35,35,19]);
        translate([0,0,7.5]) rotate([0,90,0]) cylinder(h=60,d=9,$fn=120,center=true);
    }
}

