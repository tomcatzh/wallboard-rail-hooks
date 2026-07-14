// hook-round6.scad — 25 mm-span J hook with a round 6 mm rod
// （25 mm 外缘跨度、直径 6 mm 圆杆 J 钩）
//
// The fit-validated rail interface and 2.0 mm wall-contact face stay unchanged.
// Below the pressure face, the 11.9 mm-wide shank blends into a centered round
// rod. The rod follows the same 25 mm outer envelope as hook-wide25 and ends in
// a spherical cap. "M6" here means a plain 6.0 mm nominal diameter, no thread.
//
// Printing in the library's normal side-face-down orientation leaves the round
// rod 2.95 mm above the bed at its lowest Z point, so supports are expected.

include <../lib/rail-mount.scad>

/* [Design] */
// Mount width along the rail; kept at the measured original width.
part_w = 11.9;
// Plain round-rod diameter (M6 nominal diameter, deliberately unthreaded).
rod_d = 6.0;
// Outer back-to-front envelope of the J, matching hook-wide25.
j_span = 25.0;
// Straight shank below the slot ceiling, matching hook-wide25.
shank_drop = 24.0;
// Retain the wide25 front-side shank reinforcement above the round transition.
shank_front_extra = 1.4;
// Arc sweep; the free end rises 25 degrees beyond the forward horizontal.
j_sweep = 205;

/* [Round transition] */
// The transition starts just above the lower edge of the pressure face and
// reaches the round section at the J tangent point.
transition_top_y = -20.8;
transition_slice = 0.6;
side_chamfer = 0.4;

/* [Resolution] */
rod_fn = 48;
sweep_fn = ceil(j_sweep / 2);

/* [Derived] */
rod_r = rod_d / 2;
rod_z = part_w / 2;
rod_bed_gap = rod_z - rod_r;
shank_front_x = x_pf + shank_front_extra;
shank_center_x = (shank_front_x - pad_back) / 2;
shank_size_x = shank_front_x + pad_back;
// The full-width mount stops as soon as the 1.2 mm lower wall-pad ramp is done;
// the 3D transition alone carries the remaining distance to the round rod.
mount_body_bottom_y = wall_contact_bottom_y
                      - wall_contact_extra - wall_contact_j_clearance;
// At the tangent point, the rod's back is flush with the baseline body back.
rod_start_x = rod_r - pad_back;
j_path_r = (j_span - rod_d) / 2;
j_center_x = rod_start_x + j_path_r;
j_center_y = -shank_drop;
j_tip_angle = 180 + j_sweep;
j_tip = [j_center_x + j_path_r * cos(j_tip_angle),
         j_center_y + j_path_r * sin(j_tip_angle),
         rod_z];

assert(rod_d > 0 && part_w > rod_d,
       "round rod must be positive and narrower than the mount");
assert(j_span > 2 * rod_d,
       "J span is too small for the requested rod diameter");
assert(transition_top_y > -shank_drop,
       "round transition must start above the J tangent point");
assert(transition_top_y > mount_body_bottom_y
       && mount_body_bottom_y > -shank_drop,
       "full-width body must end inside the round transition");
assert(abs((rod_start_x - rod_r) + pad_back) < 0.001,
       "round rod must align with the baseline body back");

// The mount-side body remains full width where strength and wall contact matter,
// then narrows in profile toward the round-rod tangent point.
mount_body_pts = [
  [shank_front_x, transition_top_y],
  [shank_front_x, -pad_top_drop - 2.5 * shank_front_extra]
];

module round_transition() {
  hull() {
    // Full-width rectangular shank slice, inset to meet the mount chamfer core.
    translate([shank_center_x, transition_top_y, rod_z])
      cube([shank_size_x, transition_slice,
            part_w - 2 * side_chamfer], center = true);

    // Circular XZ slice at the J tangent point (cylinder axis along Y).
    translate([rod_start_x, j_center_y, rod_z])
      rotate([90, 0, 0])
        cylinder(h = transition_slice, r = rod_r, center = true, $fn = rod_fn);
  }
}

module round_j_rod() {
  // A swept circle makes the constant-diameter J tube.
  translate([j_center_x, j_center_y, rod_z])
    rotate([0, 0, 180])
      rotate_extrude(angle = j_sweep, convexity = 10, $fn = sweep_fn)
        translate([j_path_r, 0])
          circle(r = rod_r, $fn = rod_fn);

  // A sphere turns the swept tube's flat free end into a true round head.
  translate(j_tip)
    sphere(r = rod_r, $fn = rod_fn);
}

union() {
  rail_accessory(mount_body_bottom_y, mount_body_pts,
                 w = part_w, ch = side_chamfer);
  round_transition();
  round_j_rod();
}

echo(str("hook-round6: rod = ", rod_d, " mm; outer span = ", j_span,
         " mm; overall height = ", y_top + shank_drop + j_path_r + rod_r,
         " mm; mount width = ", part_w));
echo(str("hook-round6: centered side-print support gap = ", rod_bed_gap,
         " mm; round transition y = ", transition_top_y, "..", j_center_y));
