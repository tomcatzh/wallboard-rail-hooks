// IKEA RIBBA recessed-back frame bracket, for use as a spaced pair.
// The 22 mm cavity depth comes from the user's physical measurement.

include <../../lib/rail-mount.scad>

part_w = 24.0;
recess_depth = 22.0;
depth_clearance = 0.0;

surface_angle = 1.5;
nose_r = 1.2;
root_fillet_r = 1.0;
bottom_fillet_r = 1.0;
platform_t = 4.5;
platform_top_gap = 12.0;
platform_overlap = 0.25;
gusset_reach = 13.0;
gusset_drop = 10.0;
gusset_overlap = 0.6;
gusset_fillet_r = 1.5;

// The lower wall-contact face sits at X=-wall_contact_back.
// Carry the flat bearing surface to the measured recess. The tangent rounded
// nose extends slightly farther, but does not add more flat bearing length.
frame_back_plane_x = -wall_contact_back;
bearing_end_x = frame_back_plane_x + recess_depth + depth_clearance;

body_back_y = -22.4;
// No room-side root thickening: keep the complete front face on the fixed
// plate-front plane for the light picture-frame load.
root_front_x = x_pf;
platform_back_x = root_front_x - platform_overlap;

// The top rises toward the room, so gravity biases the frame back toward the
// wall/root. A circular nose is tangent to both the inclined top and the
// vertical free end; it rounds the edge without creating an upturned lip.
bearing_run = bearing_end_x - root_front_x;
surface_rise = bearing_run * tan(surface_angle);
// Raise the free bearing edge to the user-selected visual datum: 12 mm below
// the unchanged fixed mount top. The root top is lower by the 1.5-degree rise.
bearing_end_y = y_top - platform_top_gap;
arm_top_y = bearing_end_y - surface_rise;
platform_bottom_y = arm_top_y - platform_t;
bearing_top_gap = y_top - bearing_end_y;
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
root_fillet_top_gap = y_top - root_fillet_center_y;

// Round both exposed bottom corners. The root radius adds a compact quarter-
// round under the arm; the free-end radius removes the sharp lower tip.
bottom_root_center = [
    root_front_x + bottom_fillet_r,
    platform_bottom_y - bottom_fillet_r
];
bottom_root_arc = arc_tail(
    bottom_root_center,
    bottom_fillet_r,
    180,
    90,
    8
);
bottom_tip_center = [
    nose_end_x - bottom_fillet_r,
    platform_bottom_y + bottom_fillet_r
];
bottom_tip_arc = arc_tail(
    bottom_tip_center,
    bottom_fillet_r,
    -90,
    0,
    8
);

// This broad side-face-down part does not need side chamfers. Keeping ch=0 also
// avoids a zero-overlap top chamfer shell in the current shared helper.
side_chamfer = 0.0;

assert(part_w >= 20, "Use a bearing width of at least 20 mm per bracket");
assert(platform_t >= 4, "Platform is too thin for a long-term printed bracket");
assert(depth_clearance >= 0, "Depth clearance must not be negative");
assert(surface_angle > 0 && surface_angle <= 3,
       "Bearing surface angle must be a small inward-bias slope");
assert(root_front_x == x_pf,
       "Platform root must stay flush with the fixed plate front");
assert(abs(bearing_top_gap - platform_top_gap) < 0.001,
       "Platform free-edge height misses the visual datum");
assert(platform_bottom_y > -pad_top_drop,
       "Raised platform must overlap the fixed front plate vertically");
assert(platform_overlap > 0 && platform_back_x > x_pb,
       "Raised platform needs a small solid overlap inside the front plate");
assert(bearing_end_x > root_front_x + 10,
       "Arm is too short for the root transition");
assert(nose_r > 0 && nose_r < platform_t / 2,
       "Rounded nose is too large for the platform thickness");
assert(root_fillet_r > 0 && root_fillet_r < platform_t / 2,
       "Root fillet is too large for the platform thickness");
assert(bottom_fillet_r > 0 && bottom_fillet_r < platform_t / 2,
       "Bottom fillets are too large for the platform thickness");
assert(root_fillet_top_tangent[0] < bearing_end_x,
       "Root fillet consumes the bearing surface");
assert(nose_center_y > platform_bottom_y + bottom_fillet_r + 2,
       "Rounded nose leaves too little free-end thickness");
assert(root_fillet_top_gap > 0,
       "Raised root fillet reaches above the fixed mount top");
assert(wall_contact_ramp_bottom(body_back_y) > 0,
       "Body must include the complete lower wall-contact ramp");

// The unchanged rear mount continues as a straight front plate down to the
// fixed body datum. The elevated platform overlaps that plate by 0.25 mm, so
// the final union has positive volume rather than a face-only contact.
base_body_pts = [[root_front_x, body_back_y]];

platform_pts = concat(
    [
        [platform_back_x, root_fillet_center_y],
        [platform_back_x, platform_bottom_y - bottom_fillet_r],
        [root_front_x, platform_bottom_y - bottom_fillet_r]
    ],
    bottom_root_arc,
    [[nose_end_x - bottom_fillet_r, platform_bottom_y]],
    bottom_tip_arc,
    [[nose_end_x, nose_center_y]],
    nose_arc,
    [root_fillet_top_tangent],
    root_fillet_arc
);

// Full-width diagonal support. Build its exposed root and toe as tangent inner
// arcs on the FINAL union boundary. Rounding a standalone triangle would make
// the obtuse toe bulge outward after union with the platform.
gusset_root_y = platform_bottom_y - gusset_drop;
gusset_top_y = platform_bottom_y + gusset_overlap;
gusset_end_x = root_front_x + gusset_reach;
gusset_angle = atan2(gusset_drop, gusset_reach);
gusset_u = [cos(gusset_angle), sin(gusset_angle)];
gusset_root = [root_front_x, gusset_root_y];
gusset_toe = [gusset_end_x, platform_bottom_y];

// Inner fillet from the vertical plate face into the rising diagonal.
gusset_root_t = gusset_fillet_r
    * (1 - sin(gusset_angle)) / cos(gusset_angle);
gusset_root_center = [
    root_front_x + gusset_fillet_r,
    gusset_root_y - gusset_root_t
];
gusset_root_vertical_tangent = [root_front_x, gusset_root_y - gusset_root_t];
gusset_root_diagonal_tangent = gusset_root + gusset_root_t * gusset_u;
gusset_root_arc = arc_tail(
    gusset_root_center,
    gusset_fillet_r,
    180,
    90 + gusset_angle,
    10
);

// Inner fillet from the rising diagonal into the horizontal platform bottom.
gusset_toe_t = gusset_fillet_r
    * (1 - cos(gusset_angle)) / sin(gusset_angle);
gusset_toe_center = [
    gusset_end_x + gusset_toe_t,
    platform_bottom_y - gusset_fillet_r
];
gusset_toe_diagonal_tangent = gusset_toe - gusset_toe_t * gusset_u;
gusset_toe_horizontal_tangent = [
    gusset_end_x + gusset_toe_t,
    platform_bottom_y
];
gusset_toe_arc = arc_tail(
    gusset_toe_center,
    gusset_fillet_r,
    90 + gusset_angle,
    90,
    10
);

gusset_pts = concat(
    [
        [root_front_x - gusset_overlap, gusset_top_y],
        [root_front_x - gusset_overlap, gusset_root_vertical_tangent[1]],
        gusset_root_vertical_tangent
    ],
    gusset_root_arc,
    [gusset_toe_diagonal_tangent],
    gusset_toe_arc,
    [
        [gusset_toe_horizontal_tangent[0], gusset_top_y]
    ]
);

assert(gusset_reach > bearing_run / 2 && gusset_end_x < nose_end_x - 3,
       "Diagonal gusset reach is outside the useful platform region");
assert(gusset_drop > platform_t && gusset_fillet_r > 0,
       "Diagonal gusset is too shallow or lacks edge rounding");
assert(gusset_overlap > platform_overlap,
       "Diagonal gusset needs positive overlap with the plate and platform");
assert(gusset_root_diagonal_tangent[0] < gusset_toe_diagonal_tangent[0],
       "Gusset inner fillets consume the diagonal support");

echo(str("RIBBA 22 bracket: width=", part_w,
         " mm, measured recess=", recess_depth,
         " mm, bearing reach from frame plane=", recess_depth + depth_clearance,
         " mm, rounded outer reach=", nose_end_x - frame_back_plane_x,
         " mm, surface angle=", surface_angle,
         " deg, surface rise=", surface_rise,
         " mm, free bearing edge Y=", bearing_end_y,
         " mm, bearing top gap=", bearing_top_gap,
         " mm, root fillet top gap=", root_fillet_top_gap,
         " mm, platform underside Y=", platform_bottom_y,
         " mm, root platform thickness=", platform_t,
         " mm, front extra=", root_front_x - x_pf,
         " mm, root fillet R=", root_fillet_r,
         " mm, bottom fillets R=", bottom_fillet_r,
         " mm, gusset reach/drop=", gusset_reach, "/", gusset_drop,
         " mm, gusset fillet R=", gusset_fillet_r,
         " mm, overall height=", y_top - body_back_y, " mm"));

union() {
    rail_accessory(
        body_back_y = body_back_y,
        body_pts = base_body_pts,
        w = part_w,
        ch = side_chamfer
    );
    linear_extrude(part_w) polygon(platform_pts);
    linear_extrude(part_w) polygon(gusset_pts);
}
