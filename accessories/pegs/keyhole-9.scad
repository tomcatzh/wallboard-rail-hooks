// keyhole-9.scad — short mushroom peg for a 9.5/4.0 mm keyhole slot
// （适配 9.5/4.0 mm 钥匙孔挂片的短蘑菇头挂钩）
//
// User-selected fit diameters: 9.0 mm head and 3.8 mm capture neck.
// Total projection from the reinforced body front is 8.0 mm. The narrow neck
// is kept only beside the retaining shoulder; a 7 mm root and tapered blend
// carry the load into the full-width body. The head has a flat rear shoulder
// and a shallow rounded front for easy insertion through the large opening.

include <../../lib/rail-mount.scad>

/* [Keyhole fit] */
head_d = 9.0;
neck_d = 3.8;
peg_projection = 8.0;

/* [Head and reinforced root] */
head_t = 2.4;
head_dome = 0.8;
root_d = 7.0;
root_len = 1.4;
taper_len = 1.2;
root_overlap = 0.6;

/* [Mount body] */
part_w = 11.9;
side_chamfer = 0.4;
shank_front_extra = 1.4;
// Compact placement: the full-width body ends at the minimum Y that still
// preserves the complete lower pressure-pad ramp and its 0.2 mm clearance.
peg_y = -19.0;
body_back_y = -22.4;
body_round_y = -22.5;
body_round_ry = 1.0;

/* [Resolution] */
round_fn = 64;

/* [Derived] */
eps = 0.05;
head_r = head_d / 2;
neck_r = neck_d / 2;
root_r = root_d / 2;
peg_z = part_w / 2;
body_front_x = x_pf + shank_front_extra;
body_center_x = (body_front_x - pad_back) / 2;
body_round_rx = (body_front_x + pad_back) / 2;

head_front_x = body_front_x + peg_projection;
head_back_x = head_front_x - head_t;
head_cap_base_x = head_front_x - head_dome;
root_end_x = body_front_x + root_len;
taper_end_x = root_end_x + taper_len;
capture_neck_len = head_back_x - taper_end_x;
head_bed_gap = peg_z - head_r;
body_bottom_y = body_round_y - body_round_ry;
overall_height = y_top - body_bottom_y;

neck_section_modulus = PI * pow(neck_d, 3) / 32;
nominal_5kg_neck_stress = 5 * 9.81 * capture_neck_len
                            / neck_section_modulus;

assert(head_d > neck_d && root_d > neck_d,
       "head and reinforced root must be larger than the capture neck");
assert(head_d <= part_w,
       "mushroom head must fit inside the mount width");
assert(head_t > head_dome && head_dome > 0,
       "head needs a flat cylindrical land before the rounded front");
assert(capture_neck_len >= 2.5,
       "capture neck is too short for the keyhole plate and clearance");
assert(body_back_y <= wall_contact_bottom_y
                      - wall_contact_extra - wall_contact_j_clearance,
       "body starts too high for the complete lower pressure-pad ramp");
assert(abs(body_bottom_y - (peg_y - head_r)) < 0.001,
       "compact body bottom must align with the mushroom-head envelope");

function ellipse_arc_tail(c, rx, ry, a0, a1, n) =
  [for (i = [1 : n])
    let (a = a0 + (a1 - a0) * i / n)
      c + [rx * cos(a), ry * sin(a)]];

// Full-width body: straight below the pressure pad, elliptical rounded bottom,
// then a 4.4 mm reinforced room-side face around the peg root.
mount_body_pts = concat(
  [[-pad_back, body_round_y]],
  ellipse_arc_tail([body_center_x, body_round_y],
                   body_round_rx, body_round_ry, 180, 360, 18),
  [[body_front_x, -pad_top_drop - 2.5 * shank_front_extra]]
);

module x_cylinder(x, h, r1, r2 = undef) {
  translate([x, peg_y, peg_z])
    rotate([0, 90, 0])
      if (is_undef(r2))
        cylinder(h = h, r = r1, $fn = round_fn);
      else
        cylinder(h = h, r1 = r1, r2 = r2, $fn = round_fn);
}

module rounded_front_head() {
  // Flat rear shoulder and cylindrical land provide the retaining face.
  x_cylinder(head_back_x - eps,
             head_t - head_dome + eps,
             head_r);

  // Positive-X half of a flattened ellipsoid forms the shallow front dome.
  intersection() {
    translate([head_cap_base_x, peg_y, peg_z])
      scale([head_dome / head_r, 1, 1])
        sphere(r = head_r, $fn = round_fn);
    translate([head_cap_base_x, peg_y - head_r - 1, peg_z - head_r - 1])
      cube([head_dome + 1, 2 * head_r + 2, 2 * head_r + 2]);
  }
}

module mushroom_peg() {
  // Root overlaps the body, then tapers to the short keyhole capture neck.
  x_cylinder(body_front_x - root_overlap,
             root_len + root_overlap + eps,
             root_r);
  x_cylinder(root_end_x - eps,
             taper_len + 2 * eps,
             root_r, neck_r);
  x_cylinder(taper_end_x - eps,
             capture_neck_len + 2 * eps,
             neck_r);
  rounded_front_head();
}

union() {
  rail_accessory(body_back_y, mount_body_pts,
                 w = part_w, ch = side_chamfer);
  mushroom_peg();
}

echo(str("hook-keyhole9: head/neck = ", head_d, "/", neck_d,
         " mm; projection = ", peg_projection, " mm; head thickness = ",
         head_t, " mm; capture neck = ", capture_neck_len, " mm"));
echo(str("hook-keyhole9: reinforced root = ", root_d,
         " mm; head side-print support gap = ", head_bed_gap,
         " mm; nominal neck Z = ", neck_section_modulus, " mm^3"));
echo(str("hook-keyhole9: compact vertical center/bottom/overall = ",
         peg_y, "/", body_bottom_y, "/", overall_height, " mm"));
echo(str("hook-keyhole9: first-order 5 kg neck stress = ",
         nominal_5kg_neck_stress,
         " MPa before print/stress/creep margins (not a rating)"));
