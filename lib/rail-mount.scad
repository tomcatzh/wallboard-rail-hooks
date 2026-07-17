// rail-mount.scad — wallboard rail mount LIBRARY（墙板挂条安装接口库）
// Youbang GuaGuaQiang Parallel series rail; mount test-fit validated 2026-07-09.
// Provenance: ~/openscad/work-hook/wiki/ (rail-hook entity, hook-scad outputs).
//
// Datum: X=0 plate back face (rail contact), Y=0 slot ceiling (bearing face).
// +X = room side, +Y = up, extrusion along +Z (width along the rail).
//
// This file defines NO geometry at top level - it is meant to be included:
//
//   include <../../lib/rail-mount.scad>
//   body = j_hook_body(drop, r_out, r_in, lift, sweep, front_extra);
//   rail_accessory(-drop, body, w = 11.9);
//
// Body contract for custom shapes: body_pts continues the outline from
// (-pad_back, body_back_y), below the optional localized wall-contact pad,
// draws your shape clockwise, and ends on the front plane; rail_accessory
// closes the outline via (plate_t, -pad_top_drop) and up the plate front face,
// which keeps the rail-zone face flat as the interface requires.
//
// FIXED mount params are test-fit validated - do not override in design files
// (exception: arm_gusset_r may be tuned or zeroed if the rail interior fouls).

/* [FIXED mount interface - test-fit validated] */
finger_t = 2.40;
slot_gap = 2.75;
head_depth = 7.35;
arm_t = 2.2;
finger_len = 6.75;
plate_above = 9.0;
cap_h = 0.5;
cap_back = 0.8;
pad_back = 0.8;
pad_top_drop = 8.0;
// Localized pressure face below the rail. Test-selected 2026-07-10: the face
// reaches 2.0 mm behind X=0, starts 8 mm below the rail bottom datum, and is
// 5 mm tall. pad_back remains the baseline contour and J-body datum.
wall_contact_back = 2.0;
wall_contact_below_rail = 8.0;
wall_contact_h = 5.0;
wall_contact_j_clearance = 0.2;
// slanted finger tip (original feature) with rounded point
tip_taper = 1.5;
tip_r = 0.4;
// slot-corner fillets (stress relief; keep the 1.85 lip seat)
fillet_finger_root = 0.6;
fillet_plate_root = 0.3;
// arc gusset above the arm (plastic reinforcement; auto-clamps for arm_edge_r)
arm_gusset_r = 5.0;
// rounded bridge-edge corner (the original's outer round)
arm_edge_r = 0.8;

/* [Hidden] */
plate_t = head_depth - slot_gap - finger_t;
x_pf = plate_t;
x_pb = 0;
x_ff = -slot_gap;
x_fb = -slot_gap - finger_t;
y_top = arm_t + plate_above;
y_tip = -finger_len;
fil_f = fillet_finger_root;
fil_p = fillet_plate_root;
arm_span = slot_gap + finger_t;
gusset_r_eff = min(arm_gusset_r, arm_span - arm_edge_r);
tip_ang = atan(tip_taper / finger_t);
tip_cy = y_tip + tip_r * (1 + sin(tip_ang)) / cos(tip_ang);
rail_bottom_drop = pad_top_drop;
wall_contact_top_y = -rail_bottom_drop - wall_contact_below_rail;
wall_contact_bottom_y = wall_contact_top_y - wall_contact_h;
wall_contact_extra = wall_contact_back - pad_back;
wall_contact_ramp_top = wall_contact_extra;

function wall_contact_ramp_bottom(body_back_y) =
  min(wall_contact_extra,
      wall_contact_bottom_y - body_back_y - wall_contact_j_clearance);

assert(plate_t > 0.5, "derived plate thickness too small - check head dims");
assert(slot_gap - fil_f - fil_p > 1.6, "fillets leave too little flat seat for the rail lip");
assert(pad_top_drop > finger_len + 1, "wall pad must start clearly below the finger tip");
assert(wall_contact_extra > 0 && wall_contact_h > 0,
       "wall contact face must extend beyond the baseline pad and have positive height");
assert(wall_contact_top_y + wall_contact_ramp_top < -pad_top_drop - pad_back,
       "wall contact top ramp reaches the rail-zone pad");
assert(arm_gusset_r >= 0 && arm_edge_r >= 0 && arm_edge_r < arm_t, "bad gusset/edge radius");
assert(arm_t + gusset_r_eff < y_top - cap_h - 0.5, "arc gusset reaches the top cap");
assert(finger_len - tip_taper - fillet_finger_root > 1, "tip taper leaves too little straight inner face");

function arc_tail(c, r, a0, a1, n) =
  [for (i = [1 : n]) c + r * [cos(a0 + (a1 - a0) * i / n), sin(a0 + (a1 - a0) * i / n)]];

fil_f_pts = fil_f > 0 ? arc_tail([x_ff + fil_f, -fil_f], fil_f, 180, 90, 6) : [];
fil_p_pts = fil_p > 0
  ? concat([[x_pb - fil_p, 0]], arc_tail([x_pb - fil_p, -fil_p], fil_p, 90, 0, 6))
  : [[x_pb, 0]];

// ===== FIXED SECTION - the mount outline, from the plate top-front corner
// counterclockwise: top cap, plate back, arc gusset, rounded bridge edge,
// finger with slanted rounded tip, slot-corner fillets, lip-contact face,
// baseline wall-pad ramp, optional localized pressure face, then down to
// body_back_y where the body takes over.
function rail_mount_pts(body_back_y, wall_contact = true) = concat(
  [[x_pf, y_top],
   [-cap_back, y_top],
   [-cap_back, y_top - cap_h],
   [x_pb, y_top - cap_h]],
  gusset_r_eff > 0
    ? concat([[x_pb, arm_t + gusset_r_eff]],
             arc_tail([-gusset_r_eff, arm_t + gusset_r_eff], gusset_r_eff, 0, -90, 12))
    : [[x_pb, arm_t]],
  arm_edge_r > 0 && gusset_r_eff < arm_span - arm_edge_r - 0.01
    ? [[-(arm_span - arm_edge_r), arm_t]] : [],
  arm_edge_r > 0
    ? arc_tail([x_fb + arm_edge_r, arm_t - arm_edge_r], arm_edge_r, 90, 180, 6)
    : (gusset_r_eff < arm_span - 0.01 ? [[x_fb, arm_t]] : []),
  tip_r > 0
    ? concat([[x_fb, tip_cy]],
             arc_tail([x_fb + tip_r, tip_cy], tip_r, 180, 270 + tip_ang, 6))
    : [[x_fb, y_tip]],
  [[x_ff, y_tip + tip_taper],
   [x_ff, -fil_f]],
  fil_f_pts,
  fil_p_pts,
  [[x_pb, -pad_top_drop],
   [-pad_back, -pad_top_drop - pad_back]],
  wall_contact
    ? [[-pad_back, wall_contact_top_y + wall_contact_ramp_top],
       [-wall_contact_back, wall_contact_top_y],
       [-wall_contact_back, wall_contact_bottom_y],
       [-pad_back, wall_contact_bottom_y
                   - wall_contact_ramp_bottom(body_back_y)],
       [-pad_back, body_back_y]]
    : [[-pad_back, body_back_y]]
);

// Extrude the mount + body outline to width w with stepped 45-deg side
// chamfers (ch=0 disables). Lies side-face-down: already the right FDM pose.
module rail_accessory(body_back_y, body_pts, w, ch = 0.4,
                      wall_contact = true) {
  assert(w > 2 * ch + 1, "part width too small for the side chamfer");
  assert(body_back_y < -pad_top_drop - pad_back,
         "body must start below the baseline mount pad");
  assert(!wall_contact || wall_contact_ramp_bottom(body_back_y) > 0,
         "body starts too high for the wall-contact bottom ramp");
  assert(!wall_contact
           || wall_contact_bottom_y - wall_contact_ramp_bottom(body_back_y)
           >= body_back_y + wall_contact_j_clearance,
         "wall-contact pad reaches the custom body; lower body_back_y");
  pts = concat(rail_mount_pts(body_back_y, wall_contact), body_pts,
               [[x_pf, -pad_top_drop]]);
  echo(wall_contact
    ? str("rail_accessory: wall contact = ", wall_contact_back,
          " mm at y = ", wall_contact_top_y, "..", wall_contact_bottom_y,
          "; ramps = ", wall_contact_ramp_top, "/",
          wall_contact_ramp_bottom(body_back_y), "; width = ", w)
    : str("rail_accessory: wall contact = off; baseline back = ", pad_back,
          " mm; body bottom = ", body_back_y, "; width = ", w));
  if (ch > 0) {
    steps = 2;
    dz = ch / steps;
    union() {
      translate([0, 0, ch]) linear_extrude(w - 2 * ch) polygon(pts);
      for (i = [0 : steps - 1], z = [i * dz, w - (i + 1) * dz])
        translate([0, 0, z]) linear_extrude(dz + 0.001)
          offset(delta = -(ch - (i + 0.5) * dz)) polygon(pts);
    }
  } else {
    linear_extrude(w) polygon(pts);
  }
}
// ===== END FIXED SECTION =====

// ---- Flexible body helper: the classic J-hook shape ----
// drop: straight shank below the ceiling; r_out: J outer radius (span from the
// back face = 2*r_out); r_in: inner radius parameter (effective r_in - extra/2);
// lift: inner-center rise (controls thickening toward the bottom);
// sweep: arc degrees; extra: forward shank thickening (blends into the J);
// tip_round: dome the free end with a semicircular cap instead of a flat cut
// with two corners - kinder to hands (esp. CF/GF prints) and to fabrics.
function j_hook_body(drop, r_out, r_in, lift = 0.7, sweep = 205, extra = 0,
                     tip_round = true) =
  let (
    xs = x_pf + extra,
    co = [-pad_back + r_out, -drop],
    ri = r_in - extra / 2,
    ci = [xs + ri, -drop + lift],
    n = ceil(sweep / 2),
    a_end = 180 + sweep,
    oe = co + r_out * [cos(a_end), sin(a_end)],
    ie = ci + ri * [cos(a_end), sin(a_end)],
    m = (oe + ie) / 2,
    rc = norm(oe - ie) / 2,
    ph = atan2(oe[1] - m[1], oe[0] - m[0])
  )
  concat(
    [for (i = [1 : n]) let (a = 180 + sweep * i / n) co + r_out * [cos(a), sin(a)]],
    tip_round ? arc_tail(m, rc, ph, ph + 180, 8) : [],
    [for (i = [(tip_round ? 1 : 0) : n]) let (a = 180 + sweep * (n - i) / n)
      ci + ri * [cos(a), sin(a)]],
    extra > 0 ? [[xs, -pad_top_drop - 2.5 * extra]] : []
  );

echo(str("rail-mount lib: plate_t = ", plate_t, " (expect 2.2); head depth = ",
         x_pf - x_fb, " (expect ", head_depth, ")"));
echo(str("rail-mount lib: cap = ", plate_t + cap_back, " / base pad = ",
         plate_t + pad_back, " (expect 3.0/3.0); wall contact back = ",
         wall_contact_back, "; lip seat = ", slot_gap - fil_f - fil_p,
         "; claw total = ", arm_t + finger_len, " (target 9.0)"));
