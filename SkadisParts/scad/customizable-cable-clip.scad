// Customizable cables/wires clip/organizer/holder
// by torwan @ January 14th, 2024

// Description / Hints:
// - See more details on https://www.thingiverse.com/thing:6433628
// - All dimensions in [mm].
// - To generate STL file, render the object using F6 and save it
//   using F7.
// - $fn controls number of a circle fragments. I recommend to use
//   $fn = 50 or more.
// - PRINTING RECOMMENDATIONS: When slicing, increase wall count
//   (wall thickness) in a way that there is no infill between
//   the outer walls. From my experience, this helps the printed
//   clips to be more flexible and to keep their initial shape
//   after exposing them to some (even significant) force.
//   Infill will work against flexibility (to my understanding)
//   and may cause that a clip will permanently deform due to
//   infill-material fatigue.
// - PRE-TENSIONING IDEA: Increasing part 3 "rotation_angle3"
//   above 90 degrees is  one of the basic methods to apply some
//   initial tension to a clip, so there will be no gap between
//   a surface you are going to screw it to and the "knee" of a clip.
//   But don't go too crazy with it, usually a few degrees (like
//   e.g.,5deg) should be enough.

$fn = 100;
cc = 0.01;

// ---------- Model general parameters -----------
clip_width = 10;      // Clip width
clip_thickness = 2.0; // Clip thickness
clip_radius = 0.5;    // Radius for smoothing sharp edges

flat_screw_enabler = true;  /* FALSE -> with a hole for a flat-head screw.
                               TRUE  -> with a hole for a countersunk-head
                               screw.
                               See screw-holes parameters */
                               
dist_between_screws = 0;    /* When this is higher than zero, the second
                               screw hole will be generated. It will be located
                               "dist_between_screws" further from the first screw
                               hole (distance between centers of the holes).
                               Having two screw holes is helpful when you want
                               to make sure that a clip will not rotate. Consider
                               extending the Part 0 length (see below) to have
                               sufficient space for two screw holes. */ 

// ----------- Model shape parameters ------------ 
// Numbering of the individual parts of the whole clip:
//              ____________________
//   ____      /  |       4      |  \
//  / 10 \    / 5 /--------------\ 3 \             
//  \____/   /---/                \---\
//   \ 9 \   | 6 |                | 2 |
//    \---\  /---/                \---\__________________
//     \ 8 \/ 7 /                  \ 1 \         0       |
//      \__|___/                    \___|________________|
//
// Parts 0, 2, 6 & 9 are straight bars (you can define their length).
// Parts 1, 3, 5, 7, 8 are arcs (you can define their radius and angle).
// Part 10 is a basic cylinder to allow easy pull to load a clip
// (you can define its diameter).

// Example for 1x6mm cable ("roundy" space, h=6mm, w=6mm):
// p0 = 9, p1 = [0.5, 90], p2 = 0.5, p3 = [3, 95], p4 = 0,
// p5 = [p3.val0, 90], p6 = p2, p7 = [0.5, 80], p8 = [1, 70], p9 = 8,
// p10 = 5

// Example for 2x6mm cables ("roundy" space, h=6mm, w=12mm):
// p0 = 9, p1 = [0.5, 90], p2 = 0.5, p3 = [3, 95], p4 = 6,
// p5 = [p3.val0, 90], p6 = p2, p7 = [0.5, 80], p8 = [1, 70], p9 = 8,
// p10 = 5

// Example for 1x7mm cable ("roundy" space, h=7mm, w=7mm):
// p0 = 9, p1 = [0.5, 90], p2 = 1, p3 = [3.5, 95], p4 = 0,
// p5 = [p3.val0, 90], p6 = p2, p7 = [0.5, 80], p8 = [1, 70], p9 = 8,
// p10 = 5

// Example for 3x7mm cables ("roundy" space, h=7mm, w=21mm):
// p0 = 9, p1 = [0.5, 90], p2 = 1, p3 = [3.5, 95], p4 = 14,
// p5 = [p3.val0, 90], p6 = p2, p7 = [0.5, 80], p8 = [1, 70], p9 = 8,
// p10 = 5

// Example for 2x7mm cables ("boxy" space, h=7mm, w=14mm):
// p0 = 9, p1 = [0.5, 90], p2 = 4, p3 = [0.5, 95], p4 = 13,
// p5 = [p3.val0, 90], p6 = p2, p7 = [0.5, 80], p8 = [1, 70], p9 = 8,
// p10 = 5

// Example for 2x7mm cables ("boxy" space, h=7.5mm, w=14mm):
// p0 = 9, p1 = [0.5, 90], p2 = 3, p3 = [2, 95], p4 = 10,
// p5 = [2, 90], p6 = p2, p7 = [0.5, 80], p8 = [1, 70], p9 = 8,
// p10 = 6

color_parts = false;  /* TRUE  -> every part in different color in the pre-view,
                         FALSE -> all parts in the same color in the pre-view */

// Part 0:
straight0 = 9;          // Length of part 0, default 9mm

// Part 1:
rotation_radius1 = 0.5; // Rotation radius for part 1,  default 0.5mm
rotation_angle1 = 90;   // Rotation angle for part 1,  default 90deg

// Part 2:
straight2 = 1.0;        // Length of part 1

// Part 3:
rotation_radius3 = 3.5; // Rotation radius for part 3
rotation_angle3 = 95;   // Rotation angle for part 3

// Part 4:
straight4 = 7;          // Length of part 4

// Part 5:
rotation_radius5 = rotation_radius3;   // Rotation radius for part 5
rotation_angle5 = 90;                  // Rotation angle for part 5

// Part 6:
straight6 = straight2;  // Length of part 6

// Part 7:
rotation_radius7 = 0.5; // Rotation radius for part 7, default 0.5mm
rotation_angle7 = 80;   // Rotation angle for part 7, default 80deg

// Part 8:
rotation_radius8 = 1;   // Rotation radius for part 8, default 1mm
rotation_angle8 = 70;   // Rotation angle for part 8, default 70deg

// Part 9:
straight9 = 7;          // Length of part 9

// Part 10:
clip_cylinder_dia = 5;  // Diameter of part 10

// ----------- Screw-holes dimensions ------------
screw_offset = 5.5;      /* Distance of the first screw hole from the beginning
                            of the Part 0, default 5.5mm*/
screw_leg_dia = 3.3;     // Screw leg diameter (make it 0.1-0.2 bigger than real)
screw_head_dia = 6.0;    // Screw head diameter
screw_head_h = 3;        // Screw head height
screw_head_drop = 0.0;   // How much a screw has to drop into material (hiding head)

screw_cnrsnk_add = 0.2;  /* Supporting cylinder height add-on when using
                            countersunk-head screw that has head higher than
                            the clip thickness. */
screw_cnrsnk_surr = 2;   /* Supporting cylinder diameter add-on above head diameter. */


// ------------- Helping parameters --------------
// (do not modify below parameters)

screw_head_h_corr = flat_screw_enabler ? 0 : screw_head_h;
screw_supp_cyl_h = (screw_head_h>(clip_thickness-screw_head_drop))
                   ? (screw_head_h+screw_head_drop+screw_cnrsnk_add-clip_thickness)
                   : 0;
screw_supp_cyl_h_corr = flat_screw_enabler ? 0 : screw_supp_cyl_h;
screw_supp_shp_corr = (screw_supp_cyl_h_corr>0) ? clip_radius : 0;

available_width  = rotation_radius3
                 + straight4
                 + rotation_radius5;
available_height = clip_thickness
                 + rotation_radius1
                 + straight2
                 + rotation_radius3;
                 
echo(str("Estimated space width: ", available_width));
echo(str("Estimated space height: ", available_height));

part0_col  =  color_parts ? "Gold" : "Gold";
part1_col  =  color_parts ? "Yellow" : "Gold";  
part2_col  =  color_parts ? "Olive" : "Gold"; 
part3_col  =  color_parts ? "DarkKhaki" : "Gold"; 
part4_col  =  color_parts ? "BurlyWood" : "Gold"; 
part5_col  =  color_parts ? "RosyBrown" : "Gold"; 
part6_col  =  color_parts ? "Coral" : "Gold"; 
part7_col  =  color_parts ? "Goldenrod" : "Gold"; 
part8_col  =  color_parts ? "Chocolate" : "Gold"; 
part9_col  =  color_parts ? "MistyRose" : "Gold"; 
part10_col =  color_parts ? "Maroon" : "Gold"; 
// --------------- GENERATION AREA ---------------

rotate([0, -90, 0]) // Rotate 90deg to make it pre-oriented for printing
    make_clip();

// ------------------ MODULES --------------------
// (you do not need to touch anything below unless you
// know what you do :) )

module make_clip()
{
    rotate([rotation_angle8
            +rotation_angle7
            -rotation_angle5
            -rotation_angle3
            +rotation_angle1 , 0, 0])
    {
        // Part 0 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9
        part_0_1_2_3_4_5_6_7_8_9();
        
        // Part 10 (round cylinder)
        color(part10_col)
        rotate([0, 90, 0])
            translate([0, 0, clip_radius+cc/4])
                minkowski()
                {
                    cylinder(d = clip_cylinder_dia-2*clip_radius,
                             h = clip_width-2*clip_radius-cc/2);
                    sphere(r = clip_radius);
                }
    }
}

module part_0_1_2_3_4_5_6_7_8_9()
{    
    translate([0, -straight9, clip_thickness/2])
    {
        // Part 0 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8
        part_0_1_2_3_4_5_6_7_8();
        
        // Part 9 (straight)
        color(part9_col)
        translate([0, 0, -clip_thickness])
            make_straight(len = straight9);    
    }
}

module part_0_1_2_3_4_5_6_7_8()
{
    rotate([-rotation_angle8, 0, 0])
    {
        ty8 = rotation_radius8 * sin(rotation_angle8);
        tz8 = rotation_radius8 * (1 - cos(rotation_angle8));     
        translate([0, -ty8, -tz8])    
        {
            // Part 0 + 1 + 2 + 3 + 4 + 5 + 6 + 7
            part_0_1_2_3_4_5_6_7();
            
            // Part 8
            color(part8_col)
            translate([0, 0, 0])
                prepare_arc(rot_r = rotation_radius8,
                            rot_ang = rotation_angle8,
                            rot_part = 0,
                            part_type = "lu");        
        }
    }
}

module part_0_1_2_3_4_5_6_7()
{
    rotate([-rotation_angle7, 0, 0])
    {
        ty7 = rotation_radius7* sin(rotation_angle7);
        tz7 = rotation_radius7 * (1 - cos(rotation_angle7));     
        translate([0, -ty7, -tz7-clip_thickness])
        {
            // Part 0 + 1 + 2 + 3 + 4 + 5 + 6
            part_0_1_2_3_4_5_6();
            
            // Part 7
            color(part7_col)
            translate([0, 0, clip_thickness])
                prepare_arc(rot_r = rotation_radius7,
                            rot_ang = rotation_angle7,
                            rot_part = 0,
                            part_type = "lu");    
        }
    }
}

module part_0_1_2_3_4_5_6()
{
    translate([0, -straight6, 0])
    {    
        // Part 0 + 1 + 2 + 3 + 4 + 5
        part_0_1_2_3_4_5();
        
        // Part 6 (straight)
        color(part6_col)
        translate([0, 0, 0])
            make_straight(len = straight6);
    }    
}

module part_0_1_2_3_4_5()
{
    rotate([rotation_angle5, 0, 0])
    {
        ty5 = rotation_radius5* sin(rotation_angle5);
        tz5 = rotation_radius5 * (1 - cos(rotation_angle5)); 
        translate([0, -ty5, tz5])
        {   
            // Part 0 + 1 + 2 + 3 + 4
            part_0_1_2_3_4(); 
            
            // Part 5
            color(part5_col)
            translate([0, 0, clip_thickness])
                prepare_arc(rot_r = rotation_radius5,
                            rot_ang = rotation_angle5,
                            rot_part = 0,
                            part_type = "ld");
        }
    }
}

module part_0_1_2_3_4()
{
    translate([0, -straight4, 0])
    {   
        // Part 0 + 1 + 2 + 3
        part_0_1_2_3();
        
        // Part 4 (straight)
        color(part4_col)
        translate([0, 0, 0])
            make_straight(len = straight4);     
    }
}

module part_0_1_2_3()
{
    rotate([rotation_angle3, 0, 0])
    {
        ty3 = rotation_radius3* sin(rotation_angle3);
        tz3 = clip_thickness + rotation_radius3 * (1 - cos(rotation_angle3)); 
        translate([0, -ty3, tz3])
        {
            // Part 0 + 1 + 2
            part_0_1_2();
            
            // Part 3
            color(part3_col)
            prepare_arc(rot_r = rotation_radius3,
                        rot_ang = rotation_angle3,
                        rot_part = 0,
                        part_type = "ld");   
        }
    }
}

module part_0_1_2()
{
    translate([0, -straight2, 0])
    {
        // Parts 0 + 1
        part_0_1();
        
        // Part 2
        color(part2_col)
        translate([0, 0, -clip_thickness])
            make_straight(len = straight2);
    }     
}

module part_0_1()
{
    rotate([-rotation_angle1, 0, 0])
    {    
        ty1 = sin(rotation_angle1) * (rotation_radius1);
        tz1 = (rotation_radius1)* (1 - cos(rotation_angle1));    
        translate([0, -ty1, -clip_thickness-tz1])
        {
            // Part 0 (straight, with screw hole)
            color(part0_col)
            translate([0, -straight0, 0])
                difference()
                {
                    union()
                    {
                        // Main body
                        make_straight(len = straight0);
                        // Rounded ending
                        translate([0, 0, clip_thickness/2])
                            rotate([0, 90, 0])
                                translate([0, 0, clip_radius])
                                    minkowski()
                                    {
                                        cylinder(d = clip_thickness
                                                    -2*clip_radius,
                                                 h = clip_width
                                                    -2*clip_radius);
                                        sphere(r = clip_radius);
                                    }
                        // Cylinder supporting countersunk-head screw
                        if (flat_screw_enabler == false)
                            for (off = [0, dist_between_screws])            
                                translate([clip_width/2,
                                           -clip_thickness/2+screw_offset+off,
                                           clip_thickness-screw_supp_shp_corr])
                            scale([clip_width/(screw_head_dia+screw_cnrsnk_surr),
                                  1, 1])        
                            cylinder(d = screw_head_dia+screw_cnrsnk_surr,
                                     h = screw_supp_cyl_h_corr+screw_supp_shp_corr);
                    }
                    // Screw slot no. 1 & 2
                    for (off = [0, dist_between_screws])
                        translate([clip_width/2,
                                  -clip_thickness/2+screw_offset+off,
                                   clip_thickness+screw_supp_cyl_h_corr+cc])
                            rotate([0, -90, 0])
                                screw_slot();
                }
         
            // Part 1 (angled)
            color(part1_col)
            translate([0, 0, clip_thickness])
                prepare_arc(rot_r = rotation_radius1,
                            rot_ang = rotation_angle1,
                            rot_part = 0,
                            part_type = "lu");    
        }
    }
}

module prepare_arc(rot_r = 0, rot_ang = 0, rot_part = 0, part_type = "")
{
    rotate([-rot_part, 0, 0])
        prepare_arc_preorient();
    
    module prepare_arc_preorient()
    {
        if (part_type == "lu") 
                translate([0, 0, -clip_thickness])
                    make_arc(rot_r = rot_r, rot_ang = rot_ang);

        if (part_type == "ul") 
                mirror([0, 1, 0])
                    rotate([90, 0, 0])
                        make_arc(rot_r = rot_r, rot_ang = rot_ang);    
      
        if (part_type == "ld") 
                mirror([0, 0, 1])
                    make_arc(rot_r = rot_r, rot_ang = rot_ang);  
     
        if (part_type == "dl")
                translate([0, -clip_thickness, 0])
                    rotate([-90, 0, 0]) 
                        make_arc(rot_r = rot_r, rot_ang = rot_ang); 
    }
}  

module make_arc(rot_r = 0, rot_ang = 0)
{
translate([0, 0, rot_r+clip_thickness])
    rotate([0, 90, 0])
        rotate_extrude(angle = rot_ang)
            translate([rot_r, 0, 0])
                clip_blueprint();
}                            
                            
module make_straight(len = 0)
{   
    translate([clip_width, 0, clip_thickness])
        rotate([0, 90, 90])
            linear_extrude(len)
                clip_blueprint();
} 
                            
module clip_blueprint()
{
    translate([clip_radius, clip_radius, 0])
        offset(r = clip_radius)
            square([clip_thickness-2*clip_radius,
                    clip_width-2*clip_radius]);    
}

module screw_slot() {
    rotate([0, -90, 0])
        rotate_extrude(angle = 360)
            polygon([[0, 0],
                     [screw_head_dia/2, 0],
                     [screw_head_dia/2, screw_head_drop],    
                     [screw_leg_dia/2,  screw_head_drop+screw_head_h_corr],
                     [screw_leg_dia/2,  screw_head_drop+screw_head_h_corr+clip_thickness+2*cc],
                     [0, screw_head_drop+screw_head_h_corr+clip_thickness+2*cc],
                     ]);     
}