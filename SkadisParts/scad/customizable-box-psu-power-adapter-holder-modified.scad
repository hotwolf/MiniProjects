/* Customizable box/psu/power adapter bracket/holder
   written by torwan @ February 18th, 2024

   Design concept by bekudrei/bequ3:
   https://www.thingiverse.com/thing:4977737
   https://www.printables.com/model/77598-fasta-parametric-mounting-bracket

   Description / Hints:
   - See more details on https://www.thingiverse.com/thing:6490337
   - All dimensions in [mm].
   - Use "what_to_show" parameter to control what to generate.
   - Use "bracket_base_type" parameter to switch between holder base
     types (flat vs arched with one screw)
   - Use "endstop_enabler" parameter to add or remove an end-stop.
     It can be useful when you mount your object vertically.
   - To generate STL file, render the object using F6 and save it
     using F7.
   - $fn controls number of a circle fragments. I recommend to use
     $fn = 50 or more.
   - Explanation of the design segments (this is being drawn and then
     mirrored to create a complete bracket):
     
                     shoulder
                     --------
                     |
         upper_arm   |
                     |
                     /
         lower_arm  / 
                   /__ finger

Parameter values that will work with my Sonoff DualR3 Enclosure:
 bracket_base_type = 0, bracket_width = 10, bracket_thickness = 3,
 box_width = 60, box_play = 0.5, upper_arm_l = 20, upper_arm_ang = -2,
 lower_arm_l = 20, lower_arm_ang = 3, finger_l = 10, finger_ang = -135,
 end_stop_h = 5, end_stop_th = 3, end_stop_lf = 0.6

Parameter values that will work with HP Zbook TPN-CA11 150W AC/DC adapter:
 bracket_base_type = 0, bracket_width = 15, bracket_thickness = 3,
 box_width = 66.3, box_play = 0.2, upper_arm_l = 12, upper_arm_ang = -2,
 lower_arm_l = 18, lower_arm_ang = 3, finger_l = 10, finger_ang = -130

Parameter values that will work with HP HSTNN-CA40 45W AC/DC adapter:
 bracket_base_type = 0, bracket_width = 12, bracket_thickness = 3,
 box_width = 40, box_play = 0.5, upper_arm_l = 17.5, upper_arm_ang = -2,
 lower_arm_l = 18, lower_arm_ang = 3, finger_l = 10, finger_ang = -130
*/

// ----------- Model general parameters ----------
/* [Model general parameters] */

// 0 - show a holder with a box & text, 1 - show only a holder (to print)
what_to_show = 0; //[0, 1]

// Bracket type, 0 - straight base, 1 - arched base with one screw hole
bracket_base_type = 0; //[0, 1]

// End-stop activation
endstop_enabler = 0; //[0, 1]

// Bracket width
bracket_width = 12.0;

// Bracket thickness
bracket_thickness = 3.0;

// Bracket rounding radius
rounding_radius = 0.5;

// Your box width
box_width = 40.0;

// Play for your box width play
box_play = 0.5;

// Upper arm length
upper_arm_l = 17.5;

// Upper arm angle
upper_arm_ang = -2;

// Lower arm length
lower_arm_l = 18.0;

// Lower arm angle
lower_arm_ang = 3;

// Bottom finger length
finger_l = 10.0;

// Bottom finger angle
finger_ang = -130;

// Base radius (for arched base, when bracket_base_type == 1)
base_radius = 400;

// End stop height
end_stop_h = 5.0;

// End stop thickness
end_stop_th = 3.0;

// End stop width (as fraction of upper arm length)
end_stop_lf = 0.6;

// ----------- Screw-holes dimensions ------------
/* [Screw-holes dimensions] */

// Distance between screws (zero means one screw hole)
screws_distance = 20;

// Screw head diameter
screw_head_dia = 6.4; 

// Screw leg diameter (make it 0.1-0.2 bigger than real)
screw_leg_dia = 3.3;

// Screw head height
screw_head_h = 2.6;

// How much a screw has to drop into material (hiding head)
screw_head_drop = 0.2;

// ------------ Supporting parameters ------------
/* [Supporting parameters] */
// Number of a circle fragments
$fn = 50;

// ------------- Helping parameters --------------
// (do not modify below parameters)
cc = 0.01;

shoulder_l = box_width/2 + box_play/2 + bracket_thickness/2;

ua_lx = sin(upper_arm_ang) * upper_arm_l;
ua_ly = cos(upper_arm_ang) * upper_arm_l;

la_lx = sin(lower_arm_ang) * lower_arm_l;
la_ly = cos(lower_arm_ang) * lower_arm_l;

finger_lx = sin(finger_ang) * finger_l;
finger_ly = cos(finger_ang) * finger_l;

box_height = ua_ly + la_ly + finger_ly - bracket_thickness;

angle_arched = (shoulder_l*360) / (2 * PI * base_radius);

shoulder_lx = (bracket_base_type == 0)
            ? (shoulder_l)
            : (sin(angle_arched)*base_radius);

shoulder_ly = (bracket_base_type == 0)
            ? 0
            : base_radius - (cos(angle_arched)*base_radius);

finger_support_dist = (box_width/2)
                     -(shoulder_lx+ua_lx+la_lx+finger_lx);

screws_distance_corr = (bracket_base_type == 0)
                     ? screws_distance
                     : 0;

end_stop_l = end_stop_lf * upper_arm_l;
end_stop = (endstop_enabler == 0) ? false : true;

box_width_rounded = round(10*box_width)/10;
box_height_rounded = round(10*box_height)/10;
finger_support_dist_rounded = round(10*finger_support_dist)/10;
echo(str("Box width: ", box_width_rounded));
echo(str("Box hength: ", box_height_rounded));
echo(str("Finger support distance: ", finger_support_dist_rounded));

// --------------- GENERATION AREA ---------------
/* [GENERATION AREA] */

show_holder(wts = what_to_show);


// ------------------ MODULES --------------------
// (you do not need to touch anything below unless you
// know what you do :) )

module show_holder(wts = 0)
{
    create_holder();
    mirror([1, 0, 0]) create_holder();

    if (wts == 0)
    {
        // Hold object
        color("YellowGreen", alpha = 0.75)
            translate([-box_width/2, bracket_thickness/2, 0])
                cube([box_width,
                      box_height,
                      bracket_width], center = false);    
        // Text with width, height and finger support distance
        translate([0, -15, 0])
            color("YellowGreen")
                text(str("Suitable object WIDTH: ", box_width_rounded),
                     size = 8,
                     halign = "center");
         translate([0, -30, 0])
            color("YellowGreen")
                text(str("Suitable object HEIGHT: ", box_height_rounded),
                     size = 8,
                     halign = "center");
         translate([0, -45, 0])
            color("YellowGreen")
                text(str("Finger support distance: ",
                     finger_support_dist_rounded),
                     size = 8,
                     halign = "center");        
    }
}

module create_holder()
{
    difference()
    {
        union()
        {
            // Shoulder
            if (bracket_base_type == 0)
                make_straight(shoulder_lx, 90);
            else
                make_arched(rad = base_radius, ang = angle_arched);
            
            // 1st joint
            translate([shoulder_lx, -shoulder_ly, 0])
                make_joint();

            // Upper arm
            translate([shoulder_lx, -shoulder_ly, 0])
                make_straight(upper_arm_l, upper_arm_ang, es = end_stop);
             
            // 2nd joint
            translate([shoulder_lx+ua_lx, -shoulder_ly+ua_ly, 0])
                make_joint();    
            
            // Lower arm
            translate([shoulder_lx+ua_lx,
                      -shoulder_ly+ua_ly,
                      0])
                    make_straight(lower_arm_l, lower_arm_ang);

            // 3nd joint
            translate([shoulder_lx+ua_lx+la_lx, -shoulder_ly+ua_ly+la_ly, 0])
                make_joint();

            // Finger
            translate([shoulder_lx+ua_lx+la_lx,
                      -shoulder_ly+ua_ly+la_ly,
                      0])
                    make_straight(finger_l, finger_ang);
                    
            // Finger tip
            translate([shoulder_lx+ua_lx+la_lx+finger_lx,
                       -shoulder_ly+ua_ly+la_ly+finger_ly,
                       0])
                make_joint();
        } // end of union
        
        // Screw hole
        translate([screws_distance_corr/2, bracket_thickness/2, bracket_width/2])
            rotate([90, 0, 0])
                screw_nest(head_dia = screw_head_dia,
                      head_drop = screw_head_drop,
                      screw_head_h = screw_head_h,
                      total_length = bracket_thickness+cc,
                      screw_leg_dia = screw_leg_dia);
        }    
}

module make_straight(len = 0, ang = 0, es = false)
{
        rotate([90, 0, 180-ang])
        {
            translate([-bracket_thickness/2, 0, 0])
                linear_extrude(len)
                    bracket_blueprint();
            if (es == true)
                translate([bracket_thickness/2-rounding_radius,
                           0,
                           -end_stop_l/2+len/2])
                    create_endstop();
        }
} 

module make_arched(rad = 0, ang = 0)
{
    mirror([0, 1, 0])    
        rotate([0, 0, 90])
                translate([rad, 0, 0])
                    rotate_extrude(angle = ang, $fn = base_radius)
                        translate([-rad-bracket_thickness/2, 0, 0])
                            bracket_blueprint();
} 

module make_joint()
{   
    translate([0, 0, rounding_radius])
        minkowski()
        {
            cylinder(d = (bracket_thickness-2*rounding_radius),
                     h = bracket_width-2*rounding_radius);
            sphere(r = rounding_radius);
        }
}

module create_endstop()
{   rotate([90, 0, 180])
        difference()
        {
            translate([-end_stop_h,
                       rounding_radius,
                       rounding_radius])
                minkowski()
                {    
                    cube([2*end_stop_h-2*rounding_radius,
                          end_stop_l-2*rounding_radius,
                          end_stop_th-2*rounding_radius]);
                    sphere(r = rounding_radius);
                }
            translate([-cc/2, -cc/2, -cc/2])   
                cube([end_stop_h+cc, end_stop_l+cc, end_stop_th+cc]);
        }
}

module bracket_blueprint()
{
    translate([rounding_radius, rounding_radius, 0])
        offset(r = rounding_radius)
            square([bracket_thickness-2*rounding_radius,
                    bracket_width-2*rounding_radius]);    
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