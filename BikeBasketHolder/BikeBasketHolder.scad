
module topMount() {
    translate([-45,0,0]) topClamp();
    translate([45,0,0])  topClamp();
    translate([-60,0,8]) cube([120,20,2]);
}

module bottomMount() {
    translate([-45,0,0]) bottomClamp();
    translate([45,0,0])  bottomClamp();
}

module topClamp() {
 
    difference() {
        hull() {
            translate([-8,0,0]) cube([16,20,8]);
            translate([-11,0,8]) cube([22,20,2]);
        }
        translate([0,50,0]) rotate([90,0,0]) cylinder(100, d=12);
    }
}

module bottomClamp() {

    difference() {
        hull() {
            translate([-8,0,-3]) cube([16,20,2]);
            translate([-5,0,-8]) cube([10,20,2]);
        }
        translate([0,50,0]) rotate([90,0,0]) cylinder(100, d=12);
    }
}

module rack () {
  color("green") {
    translate([-45,50,0]) rotate([90,0,0]) cylinder(100, d=12);
    translate([45,50,0])  rotate([90,0,0]) cylinder(100, d=12);
  }
}

//topMount();
//bottomMount();

bottomClamp();

//rack();