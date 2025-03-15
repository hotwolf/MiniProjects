// Customizable cables/rods FLAT organizer/holder 
// by torwan @ February 10th, 2024

// Description / Hints:
// - See more details on https://www.thingiverse.com/thing:6478394
// - All dimensions in [mm].
// - Overall width and length of a holder are auto-calculated. You
//   can override them by specifying minimum values that are higher
//   than auto-calculated ones.
// - To generate STL file, render the object using F6 and save it
//   using F7.
// - Print up-side-down (without supports).
// - $fn controls number of a circle fragments. I recommend to use
//   $fn = 50 or more.


// ------------ Supporting parameters ------------
/* [Supporting parameters] */
$fn = 50;
cc = 0.01;

// ----------- Model general parameters ----------
/* [Model general parameters] */

// Number of sections
no_sections = 3;   

// Holder height
holder_height = 4;

// Distance between sections
dist_sections = 2; 

// Distance of section opening from holder edge (does not include rounded part)
dist_w_edge = 1;

// Rounding radius
rounding_radius = 1.0;

// Minimum holder width
minimum_holder_width = 0;

// Minimum holder length
minimum_holder_length = 0;

// --------------- Slot dimensions ---------------
/* [Slot dimensions] */

// Slot width
slot_width = 13;

// Amount of space for an object to hold
object_space_width = 7;

// Slot height
slot_height = 2.4;

// Slot top opening width
slot_opening_width = 3.5;

// Slot smoothing wall height
slot_smoothing_wall = 0.6;


// ----------- Screw-holes dimensions ------------
/* [Screw-holes dimensions] */

// Distance of a screw hole from the edge of the base
screw_offset = 5.0;

// Screw head diameter
screw_head_dia = 6.4; 

// Screw leg diameter (make it 0.1-0.2 bigger than real)
screw_leg_dia = 3.3;

// Screw head height
screw_head_h = 3;

// How much a screw has to drop into material (hiding head)
screw_head_drop = 0.2;

// ------------- Helping parameters --------------
// (do not modify below parameters)
top_far = object_space_width/2 + slot_opening_width;
bottom_close = top_far - holder_height;
slot_roof_h = holder_height - slot_height;

no_sections_c = (no_sections >=1) ? no_sections : 1;

required_holder_length = (no_sections_c+1) * dist_sections
                         + no_sections_c * (2*top_far)
                         + 2*screw_offset
                         + 2*screw_head_dia/2;
required_holder_width = slot_width + 2*dist_w_edge + 2*rounding_radius;
holder_length = (required_holder_length>minimum_holder_length) ? 
                 required_holder_length :
                 minimum_holder_length;
ext_length_split = (minimum_holder_length>required_holder_length) ?
                    (minimum_holder_length-required_holder_length)/2 : 0;
holder_width = (required_holder_width>minimum_holder_width) ? 
                required_holder_width :
                minimum_holder_width;
1st_section_start = screw_offset
                  + screw_head_dia/2
                  + dist_sections
                  + top_far;
section_jump = 2* top_far + dist_sections;

echo(str("holder_width: ", holder_width));
echo(str("holder_length: ", holder_length));

// --------------- GENERATION AREA ---------------
/* [GENERATION AREA] */
// 0 - cross-secion, 1 - model ready2print, 2 - model top view
what_to_show = 1; //[0, 1, 2]

create_holder(what_to_show);

// ------------------ MODULES --------------------
// (you do not need to touch anything below unless you
// know what you do :) )
module create_holder(wts = 0)
{
    flip = (wts == 1) ? 180 : 0;
    rotate([flip, 0, 0])
        difference()
        {
            // Base body
            base_body();
            
            // Mounting screw slots
            for(off = [screw_offset, holder_length-screw_offset])
                translate([off, holder_width/2, holder_height+cc])
                    rotate([180, 0, 0])
                        screw_nest(head_dia = screw_head_dia,
                                    head_drop = screw_head_drop,
                                    screw_head_h = screw_head_h,
                                    total_length = 10,
                                    screw_leg_dia = screw_leg_dia);
            
            // Deploy section one after another
            for(idx = [0:1:(no_sections_c-1)])
                translate([1st_section_start+ext_length_split+idx*section_jump,
                           slot_width/2+holder_width/2,
                           0])
                    rotate([90, 0, 0]) make_cut();
            
            // Cut off half to present cross section
            if (wts == 0)
                translate([-cc/2, holder_width/2, -cc/2])
                    cube([holder_length+cc, holder_width+cc, holder_height+cc]);
        }
}

module base_body()
{   
    difference()
    {
        translate([rounding_radius, rounding_radius, rounding_radius-holder_height])
            minkowski()
            {
                cube([holder_length-2*rounding_radius,
                      holder_width-2*rounding_radius,
                      2*holder_height-2*rounding_radius]);
                sphere(rounding_radius);
            }
        translate([-cc/2, -cc/2, -holder_height-cc])
            cube([holder_length+cc, holder_width+cc, holder_height+cc]);
    }
}

module make_cut_half()
{
    translate([0, 0, -cc])
        linear_extrude(slot_width)
            polygon([[0, -cc],
                     [bottom_close, -cc],
                     [top_far, holder_height+cc],
                     [object_space_width/2, holder_height+cc],
                     [object_space_width/2, holder_height-slot_smoothing_wall],   
                     [object_space_width/2-slot_roof_h, slot_height],
                     [0, slot_height]
                     ]);
}

module make_cut()
{
    make_cut_half();
    mirror([1, 0, 0])
        make_cut_half();
}

module screw_nest(head_dia = 6,
                  head_drop = 1,
                  screw_head_h = 3,
                  total_length = 10,
                  screw_leg_dia = 2) // Template for space for a mounting screw
{
    rotate_extrude(angle = 360)
        polygon([[0, 0],
                 [head_dia/2, -cc],
                 [head_dia/2, head_drop],
                 [screw_leg_dia/2, head_drop + screw_head_h],
                 [screw_leg_dia/2, total_length+cc],
                 [0, total_length+cc]
                ]);
}