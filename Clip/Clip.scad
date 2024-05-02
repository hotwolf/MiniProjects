//Measurements
h=29.3;
w1=15.8;
w2=6;
d1=6;
d2=4;
r1=4;
r2=2;
b=3;
$fn=32;

//Inside
module Inside() {
  translate([-w2,0,0]) square([w2,h-r1]);
  hull() {
    translate([-r1,h-r1,0]) circle(r=r1);
    translate([-w1+r2,h-r2,0]) circle(r=r2);
    translate([-w1,h/2-r1,0]) square([w1,h/2]);
  }
}
//Inside();

//Outside
module Outside() {
    minkowski() {
      square(2*b,center=true);
      Inside();
    }
}
//Outside();

module Profile() {
    difference() {
      union() {
        Outside();
        translate([-w1-b,h,0]) circle(r=1);
      }
      union() {
        Inside();
        translate([-w1-10,d2,0]) square([w1+10,h-d1-d2]);
      }
  }
}  
//Profile();

linear_extrude(60) Profile();