// hook.scad — wallboard rail hook replica, v3（墙板挂条挂钩复刻 第三版）
// Knowledge base: wiki/entities/rail-hook.md, wiki/topics/hook-replication-requirements.md
// Strength review: wiki/outputs/hook-strength-review.md
//
// Datum（基准）: X=0 plate back face (rail-lip contact plane 主板背面/贴唇面),
//                Y=0 slot ceiling (bearing face 槽顶/承重面).
// +X = room side（房间侧）, +Y = up, extrusion along +Z (width along the rail).
// As modeled the part lies side-face-down at Z=0 — the correct FDM print orientation.
//
// v3 (2026-07-09, after user's test print and caliper pass):
//   - plate_above measured 8.8 on the original, built as 9.0 (was a 7.0 photo guess).
//   - NEW top cap（顶部小帽）: 0.5 tall, 3.0 total thick — 0.8 proud toward the wall.
//   - CORRECTED: the lower back feature is a 3.0-thick WALL PAD（抵墙凸台）bulging
//     0.8 toward the wall (braces the wall = the H contact), not a forward step.
//     v1/v2 had the step direction misread from photos.
//   - Cap and pad imply the wall panel sits ≈0.8 behind the rail face; hook back
//     rests on rail face + panel simultaneously.
//   - shank_front_extra now defaults 0 (the pad is the original's own
//     reinforcement); raise it if extra stiffness is wanted.
// Mounting-head dims remain the user-confirmed nominals, verbatim.

/* [Mounting head - fit-critical, annotated] */
// rear finger thickness (D1, annotated)
finger_t = 2.40;
// slot gap that swallows the rail lip (D2, annotated)
slot_gap = 2.75;
// total head depth, serrated front face to finger back face (D3, annotated)
head_depth = 7.35;

/* [Mounting head - verticals] */
// bridge-arm vertical thickness (D5, photo est.; scale correction suggests ~2.7 - measure)
arm_t = 2.2;
// finger length below slot ceiling (D6; user caliper: claw total arm_t+finger ~= 9.0 -> 6.75)
finger_len = 6.75;
// plate extension above arm top (D7, user-measured 8.8, built as 9.0)
plate_above = 9.0;
// slanted finger tip (original feature): the bottom face rises from the outer
// point toward the inner face - ramps over the lip during tilt-in insertion
tip_taper = 1.5;
// rounded tip point, tangent to the outer face and the slanted bottom
// (printability; the aluminum original is sharper)
tip_r = 0.4;

/* [Top cap and wall pad - from original, user-measured] */
// cap height at plate top
cap_h = 0.5;
// cap protrusion toward the wall (total cap thickness = plate_t + cap_back = 3.0)
cap_back = 0.8;
// wall-pad protrusion toward the wall (total pad thickness = plate_t + pad_back = 3.0)
pad_back = 0.8;
// pad top edge, distance below the slot ceiling (must clear the rail strip's bottom edge)
pad_top_drop = 8.0;

/* [Strength] */
// 45-deg chamfer on both side faces, whole outline (0 = off)
side_chamfer = 0.4;
// fillet at slot-ceiling / finger-front corner
fillet_finger_root = 0.6;
// fillet at slot-ceiling / plate-back corner (0 if test fit rides high)
fillet_plate_root = 0.3;
// arc gusset above the arm: ONE tangent arc from the plate back face sweeping
// down to the arm top - no corners at all (user proposal). Radius: 5.0 ~= full
// span to the bridge edge (strongest), 0 = original flat arm. The arc lives
// inside the rail above the slot opening; drop the radius if a test fit fouls.
arm_gusset_r = 5.0;
// rounded bridge-edge corner (restores the original's r~0.8 outer round; also
// the tilt-in leading edge); the gusset arc auto-clamps to leave room for it
arm_edge_r = 0.8;
// extra forward shank thickness (0 = original-faithful; pad already braces the wall)
shank_front_extra = 0;

/* [Body and J-hook - variable parts] */
// width along the rail = print height (D10; original measured 11.9)
hook_w = 11.9;
// straight shank length below ceiling before the J curve starts
shank_drop = 22.3;
// J outer radius / base inner radius / inner-center lift
j_r_out = 8.5;
j_r_in = 5.5;
j_lift = 0.7;
// J arc sweep in degrees
j_sweep = 205;

/* [Serration - cosmetic, off by default (weakens tension face)] */
serr_on = false;
serr_len = 15;
serr_pitch = 0.65;
serr_depth = 0.25;

/* [Hidden] */
plate_t = head_depth - slot_gap - finger_t;
x_pf = plate_t;
x_pb = 0;
x_ff = -slot_gap;
x_fb = -slot_gap - finger_t;
y_top = arm_t + plate_above;
y_tip = -finger_len;
y_jstart = -shank_drop;
fil_f = fillet_finger_root;
fil_p = fillet_plate_root;
arm_span = slot_gap + finger_t;
gusset_r_eff = min(arm_gusset_r, arm_span - arm_edge_r);
tip_ang = atan(tip_taper / finger_t);
tip_cy = y_tip + tip_r * (1 + sin(tip_ang)) / cos(tip_ang);
x_sf = x_pf + shank_front_extra;
y_ramp0 = -pad_top_drop;
y_ramp1 = -pad_top_drop - 2.5 * shank_front_extra;
r_in_eff = j_r_in - shank_front_extra / 2;
co = [-pad_back + j_r_out, y_jstart];
ci = [x_sf + r_in_eff, y_jstart + j_lift];
j_steps = ceil(j_sweep / 2);
y_slo = y_top - serr_len;
n_teeth = floor(serr_len / serr_pitch);

assert(plate_t > 0.5, "derived plate thickness (D4) too small - check head dims");
assert(hook_w > 2 * side_chamfer + 1, "hook_w too small for side_chamfer");
assert(slot_gap - fil_f - fil_p > 1.6, "fillets leave too little flat seat for the rail lip");
assert(pad_top_drop > finger_len + 1, "wall pad must start clearly below the finger tip / rail strip");
assert(arm_gusset_r >= 0 && arm_edge_r >= 0 && arm_edge_r < arm_t, "bad gusset/edge radius");
assert(finger_len - tip_taper - fillet_finger_root > 1, "tip taper leaves too little straight inner face");
assert(arm_t + gusset_r_eff < y_top - cap_h - 0.5, "arc gusset reaches the top cap");

function arc_tail(c, r, a0, a1, n) =
  [for (i = [1 : n]) c + r * [cos(a0 + (a1 - a0) * i / n), sin(a0 + (a1 - a0) * i / n)]];

head_pts = concat(
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
   [x_ff, -fil_f]]
);
fil_f_pts = fil_f > 0 ? arc_tail([x_ff + fil_f, -fil_f], fil_f, 180, 90, 6) : [];
fil_p_pts = fil_p > 0
  ? concat([[x_pb - fil_p, 0]], arc_tail([x_pb - fil_p, -fil_p], fil_p, 90, 0, 6))
  : [[x_pb, 0]];
back_pts = [
  [x_pb, -pad_top_drop],
  [-pad_back, -pad_top_drop - pad_back],
  [-pad_back, y_jstart]
];
outer_arc = [for (i = [1 : j_steps]) let (a = 180 + j_sweep * i / j_steps)
             co + j_r_out * [cos(a), sin(a)]];
inner_arc = [for (i = [0 : j_steps]) let (a = 180 + j_sweep * (j_steps - i) / j_steps)
             ci + r_in_eff * [cos(a), sin(a)]];
bulge_pts = shank_front_extra > 0 ? [[x_sf, y_ramp1], [x_pf, y_ramp0]] : [];
serr_pts = serr_on
  ? [for (i = [0 : n_teeth - 1]) each
      [[x_pf, y_slo + i * serr_pitch],
       [x_pf - serr_depth, y_slo + (i + 0.5) * serr_pitch]]]
  : [];

profile_pts = concat(head_pts, fil_f_pts, fil_p_pts, back_pts,
                     outer_arc, inner_arc, bulge_pts, serr_pts);

module hook_profile() { polygon(profile_pts); }

module hook() {
  if (side_chamfer > 0) {
    side_steps = 2;
    dz = side_chamfer / side_steps;
    union() {
      translate([0, 0, side_chamfer])
        linear_extrude(hook_w - 2 * side_chamfer) hook_profile();
      for (i = [0 : side_steps - 1], z = [i * dz, hook_w - (i + 1) * dz])
        translate([0, 0, z]) linear_extrude(dz + 0.001)
          offset(delta = -(side_chamfer - (i + 0.5) * dz)) hook_profile();
    }
  } else {
    linear_extrude(hook_w) hook_profile();
  }
}

hook();

shank_t = x_sf + pad_back;
echo(str("derived plate thickness D4 = ", plate_t, " mm"));
echo(str("head depth check = ", x_pf - x_fb, " mm (target ", head_depth, ")"));
echo(str("cap thickness = ", plate_t + cap_back, " mm (target 3.0); pad thickness = ",
         plate_t + pad_back, " mm (target 3.0)"));
echo(str("overall height = ", y_top - (y_jstart - j_r_out), " mm"));
echo(str("shank thickness = ", shank_t, " mm; lip flat seat = ", slot_gap - fil_f - fil_p, " mm"));
echo(str("arc gusset top = ", arm_t + gusset_r_eff,
         " mm above slot ceiling; claw total height = ", arm_t + finger_len,
         " mm (target 9.0 measured)"));
echo(str("worst-case shank stress ~ ",
         (co[0] - (x_sf - pad_back) / 2) / (hook_w * shank_t * shank_t / 6),
         " MPa per N load"));
