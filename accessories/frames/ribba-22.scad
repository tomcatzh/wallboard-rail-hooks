// IKEA RIBBA recessed-back frame bracket, for use as a spaced pair.
// The 22 mm cavity depth comes from the user's physical measurement.

include <../../lib/rail-mount.scad>

part_w = 24.0;
recess_depth = 22.0;
depth_clearance = 0.0;

surface_angle = 1.5;
nose_r = 1.2;
root_fillet_r = 1.0;
platform_t = 4.5;

// The lower wall-contact face sits at X=-wall_contact_back.
// Carry the flat bearing surface to the measured recess. The tangent rounded
// nose extends slightly farther, but does not add more flat bearing length.
frame_back_plane_x = -wall_contact_back;
bearing_end_x = frame_back_plane_x + recess_depth + depth_clearance;

body_back_y = -22.4;
// No room-side root thickening: keep the complete front face on the fixed
// plate-front plane for the light picture-frame load.
root_front_x = x_pf;

// The top rises toward the room, so gravity biases the frame back toward the
// wall/root. A circular nose is tangent to both the inclined top and the
// vertical free end; it rounds the edge without creating an upturned lip.
bearing_run = bearing_end_x - root_front_x;
surface_rise = bearing_run * tan(surface_angle);
// Align the platform underside with the lower edge of the rear wall-contact
// face. Only the fixed 1.2 mm lower ramp and 0.2 mm J clearance extend lower.
platform_bottom_y = wall_contact_bottom_y;
arm_bottom_y = platform_bottom_y;
arm_top_y = arm_bottom_y + platform_t;
bearing_end_y = arm_top_y + surface_rise;
platform_top_clearance = wall_contact_top_y - bearing_end_y;
nose_end_x = bearing_end_x + nose_r * (1 + sin(surface_angle));
nose_center_x = nose_end_x - nose_r;
nose_center_y = bearing_end_y - nose_r * cos(surface_angle);
nose_arc = arc_tail(
    [nose_center_x, nose_center_y],
    nose_r,
    0,
    90 + surface_angle,
    10
);

// Small tangent fillet between the flush vertical front face and the inclined
// platform top. It removes the re-entrant sharp corner without restoring the
// former 2.2 mm root projection.
root_fillet_center_x = root_front_x + root_fillet_r;
root_fillet_center_y = arm_top_y
    + root_fillet_r * tan(surface_angle)
    + root_fillet_r / cos(surface_angle);
root_fillet_top_tangent = [
    root_fillet_center_x + root_fillet_r * sin(surface_angle),
    root_fillet_center_y - root_fillet_r * cos(surface_angle)
];
root_fillet_arc = arc_tail(
    [root_fillet_center_x, root_fillet_center_y],
    root_fillet_r,
    surface_angle - 90,
    -180,
    10
);

// This broad side-face-down part does not need side chamfers. Keeping ch=0 also
// avoids a zero-overlap top chamfer shell in the current shared helper.
side_chamfer = 0.0;

assert(part_w >= 20, "Use a bearing width of at least 20 mm per bracket");
assert(platform_t >= 4, "Platform is too thin for a long-term printed bracket");
assert(depth_clearance >= 0, "Depth clearance must not be negative");
assert(surface_angle > 0 && surface_angle <= 3,
       "Bearing surface angle must be a small inward-bias slope");
assert(platform_bottom_y == wall_contact_bottom_y,
       "Platform underside must align with the wall-contact lower edge");
assert(root_front_x == x_pf,
       "Platform root must stay flush with the fixed plate front");
assert(platform_top_clearance >= 0,
       "Raised platform reaches above the wall-contact face");
assert(bearing_end_x > root_front_x + 10,
       "Arm is too short for the root transition");
assert(nose_r > 0 && nose_r < platform_t / 2,
       "Rounded nose is too large for the platform thickness");
assert(root_fillet_r > 0 && root_fillet_r < platform_t / 2,
       "Root fillet is too large for the platform thickness");
assert(root_fillet_top_tangent[0] < bearing_end_x,
       "Root fillet consumes the bearing surface");
assert(nose_center_y > arm_bottom_y + 3,
       "Rounded nose leaves too little free-end thickness");
assert(wall_contact_ramp_bottom(body_back_y) > 0,
       "Body must include the complete lower wall-contact ramp");

body_pts = concat(
    [
        [root_front_x, platform_bottom_y],
        [nose_end_x, arm_bottom_y],
        [nose_end_x, nose_center_y]
    ],
    nose_arc,
    [root_fillet_top_tangent],
    root_fillet_arc
);

echo(str("RIBBA 22 bracket: width=", part_w,
         " mm, measured recess=", recess_depth,
         " mm, bearing reach from frame plane=", recess_depth + depth_clearance,
         " mm, rounded outer reach=", nose_end_x - frame_back_plane_x,
         " mm, surface angle=", surface_angle,
         " deg, surface rise=", surface_rise,
         " mm, highest platform Y=", bearing_end_y,
         " mm, top clearance=", platform_top_clearance,
         " mm, root platform thickness=", platform_t,
         " mm, front extra=", root_front_x - x_pf,
         " mm, root fillet R=", root_fillet_r,
         " mm, overall height=", y_top - body_back_y, " mm"));

rail_accessory(
    body_back_y = body_back_y,
    body_pts = body_pts,
    w = part_w,
    ch = side_chamfer
);
