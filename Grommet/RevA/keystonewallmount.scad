//number of keystone sockets
number_of_sockets=3; //[1:1:20]

//depth of the wallmount (mm)
wallmount_depth=5; //[0:1:100]

//height of the wallmount (mm)
wallmount_height=40; //[10:1:100]

//offset of wallmount to the keystone
wallmount_offset=0; //[0:1:100]

//number the ports
text_enabled=true;

//depth of the numbers  (mm)
text_depth=0.4;

//screw holes in wallmount
screw_hole=true;

//positions that have screw holes
holes_at=[1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0];

//wallmount_screw_offset
wallmount_screw_offset=10;

//diameter of the screw  (mm)
screw_diameter=3.4;

//height of the screw head  (mm)
screw_head_length=4.2;

//diamter of the screw head  (mm)
screw_head_diameter=6.9;


/* Hidden */
front=false;
text_ltr=-1;

/* ************************************************************
 * Keystone code is from https://www.thingiverse.com/thing:6647
 * Mounting plate for keystone jack
 * by jsadusk https://www.thingiverse.com/jsadusk
 *
 * Changes 
 * - catch_hangover from 3 to 2 (line 26)
 * - X translate of the clip_catch from 28.5 to 29 (line 76)
 */
/* Hidden */
jack_length =16.5;
jack_width = 15;

wall_height = 10;
wall_thickness = 4;

catch_overhang = 2;
small_clip_depth = catch_overhang;
big_clip_depth = catch_overhang + 2;
big_clip_clearance = 3; //4
small_clip_clearance = 6.5;

outer_length = jack_length + small_clip_depth + big_clip_depth +
                            (wall_thickness * 2);
outer_width = jack_width + (wall_thickness * 2);

module clip_catch() {
  rotate([90, 0, 0]) {
    linear_extrude(height = outer_width) {
      polygon(points = [[0,0],
                                       [catch_overhang,0],
                                       [wall_thickness,catch_overhang],
                                       [0,catch_overhang]],
                      paths = [[0,1,2,3]]);
    }
  }
}

module keystone() {
union() {

difference() {
  difference() {
    cube([outer_length, outer_width, wall_height]);
   translate([wall_thickness, wall_thickness, big_clip_clearance]) {
      cube([outer_length, jack_width, wall_height]);
    }
  }
  translate([wall_thickness + small_clip_depth, wall_thickness, 0]){
    cube([jack_length, jack_width, wall_height + 1]);
  }
}

cube([wall_thickness, outer_width, wall_height]);

cube([wall_thickness + small_clip_depth,
           outer_width, small_clip_clearance]);

translate([2, 23, 8]) {
  clip_catch();
}

translate([26.5,0,0]) {
  cube([4, 23, 10]);
}

translate([29, 0, 8]) { //28.5,0,8
  rotate([0, 0, -180]) {
    clip_catch();
  }
}


}
}
/* ************************************************************
 * end of https://www.thingiverse.com/thing:6647 code
 */

module screw()
{
	$fn=64;
	
	translate([screw_head_length,0,0])
	rotate([0,90,0])
		union()
		{
			cylinder(h=wallmount_depth,d=screw_diameter);
			translate([0,0,-screw_head_length])
				cylinder(r1=screw_head_diameter/2,r2=screw_diameter/2,screw_head_length);
			translate([0,0,-screw_head_length-100])
				cylinder(h=100,d=screw_head_diameter);
		}
}

module wallmount(hole=false)
{
	keystone();

	translate([outer_length-4+wallmount_offset,0,0])
	{
		difference()
		{
			union()
			{
				cube([wallmount_depth,outer_width,wallmount_height]);
				translate([-wallmount_offset+1,0,0])
					cube([wallmount_offset,outer_width,wall_height]);
			}
			union()
			{
				if(hole && screw_hole)
				{
					translate([0,outer_width/2,wallmount_height-wallmount_screw_offset])
						screw();
				}
			}
		}
	}
	
	if(front)
	{
		difference()
		{
			translate([0,0.2,0])
				cube([1,outer_width-0.4,wallmount_height]);
			
			union()
			{
				if(hole && screw_hole)
				{
					translate([0,outer_width/2,wallmount_height-wallmount_screw_offset])
						screw();
				}
			}
		}
	}
}

for(i=[1:1:number_of_sockets])
{
	translate([0,text_ltr*(i-1)*outer_width,0])	
	{
		difference()
		{
			if(holes_at[i-1]==1)
			{
				wallmount(hole=true);
			}
			else
			{
				wallmount(hole=false);
			}
		
			if(text_enabled)
			{
				translate([text_depth,outer_width/2,1.5])
					rotate([90,0,0])
						rotate([0,-90,0])
							linear_extrude(text_depth)
								text(text=str(i),size=7,halign="center",font="DejaVu Sans:style=Regular");
			}
		}
	}
}

