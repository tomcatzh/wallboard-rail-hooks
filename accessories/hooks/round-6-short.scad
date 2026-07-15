// round-6-short.scad — minimum-height 25 mm J hook with a round 6 mm rod
// （最短竖向包络的 25 mm 外缘跨度、直径 6 mm 圆杆 J 钩）
//
// This is an independent compact variant. The original round-6.scad remains
// unchanged for A/B comparison. The fit-validated rail interface and 2.0 mm
// wall-contact face stay fixed; only the accessory body moves upward.
//
// The J keeps the original Ø6 rod path, 25 mm outer envelope, centered
// side-print position, and spherical endpoint. A full-width D-shaped root
// spreads load across the plate without adding an upper bulge: its upper extent
// stays at the Ø6 rod radius, while its lower surface grows from the plate's
// bottom datum and stays completely filled through the J-hook bottom. One
// continuous cubic-Bezier loft contracts the width to the unchanged Ø6 circular
// section only at the lowest point of the load-bearing arc.

include <../../lib/rail-mount.scad>

/* [Design] */
part_w = 11.9;
rod_d = 6.0;
j_span = 25.0;
j_sweep = 205;

/* [Compact root] */
// Minimum body datum that preserves the complete 1.2 mm lower pressure-pad
// ramp plus its 0.2 mm clearance.
body_back_y = -22.4;
// The visible root uses the exact 11.9 mm mount width so both side faces stay
// coplanar with the fixed plate for side-face-down printing.
// Relative to the reference centerline it extends only 3.0 mm upward (the rod
// radius), but reaches all the way down to body_back_y. Every transition ring
// solves its lower extent so the world-space lower silhouette remains exactly
// on that datum until it meets the original J path at the hook's lowest point.
// The root section is D-shaped: its lower half has full-width sides and a flat
// full-width bottom, while its upper half curves cleanly back to the unchanged
// 3 mm upper extent. The centerline joins the J path with matched tangent and
// curvature. A matching anchor ring is buried inside the plate as the first
// section of the same polyhedron, giving positive-volume overlap without a
// second solid that can protrude through the final outline.
root_center_y = -15.3;
root_upper_extent = rod_d / 2;
root_lower_extent = root_center_y - body_back_y;
root_z_r = part_w / 2;
root_embed = 0.6;
root_face_depth = 0.4;
transition_join_angle = 270;
transition_start_handle = 3.0;
side_chamfer = 0.0;

/* [Resolution] */
rod_fn = 48;
transition_steps = 36;
j_step_target = 2;
tip_cap_steps = 12;

/* [Derived] */
rod_r = rod_d / 2;
rod_z = part_w / 2;
rod_bed_gap = rod_z - rod_r;
// The unchanged Ø6 circular path and endpoint use the original Round 6 datum.
rod_start_x = rod_r - pad_back;
j_path_r = (j_span - rod_d) / 2;
j_outer_r = j_path_r + rod_r;
j_center_x = rod_start_x + j_path_r;
// Lift the J until its bottom is exactly level with the fixed body bottom.
j_center_y = body_back_y + j_outer_r;
j_bottom_y = j_center_y - j_outer_r;

// One cubic Bezier decouples the eccentric root from the circular J path. It
// ends at the true J bottom. Its final handle is solved so centerline curvature
// equals the J circle's 1/R; width scaling reaches Ø6 with zero first/second
// derivative there.
j_join_angle = transition_join_angle;
j_join_center = [j_center_x + j_path_r * cos(j_join_angle),
                 j_center_y + j_path_r * sin(j_join_angle),
                 rod_z];
j_join_tangent = [-sin(j_join_angle), cos(j_join_angle), 0];
transition_p0 = [x_pf + root_face_depth,
                 root_center_y, rod_z];
transition_p1 = transition_p0 + [transition_start_handle, 0, 0];
transition_p3 = j_join_center;
transition_end_normal_distance = abs(
  j_join_tangent[0] * (transition_p1[1] - transition_p3[1])
  - j_join_tangent[1] * (transition_p1[0] - transition_p3[0]));
transition_end_handle = sqrt(2 * transition_end_normal_distance
                             * j_path_r / 3);
transition_p2 = transition_p3
                - transition_end_handle * j_join_tangent;

root_top_y = root_center_y + root_upper_extent;
root_bottom_y = root_center_y - root_lower_extent;
root_anchor_center = [x_pf - root_embed, root_center_y, rod_z];
shank_drop = -j_center_y;
overall_height = y_top - min(body_back_y, j_bottom_y);

original_shank_drop = 24.0;
original_overall_height = y_top + original_shank_drop + j_outer_r;
height_reduction = original_overall_height - overall_height;

j_tip_angle = 180 + j_sweep;
j_tip = [j_center_x + j_path_r * cos(j_tip_angle),
         j_center_y + j_path_r * sin(j_tip_angle),
         rod_z];
tip_top_y = j_tip[1] + rod_r;
tip_ceiling_gap = -tip_top_y;

function bezier3(p0, p1, p2, p3, t) =
  (1 - t) * (1 - t) * (1 - t) * p0
  + 3 * (1 - t) * (1 - t) * t * p1
  + 3 * (1 - t) * t * t * p2
  + t * t * t * p3;

function bezier3_tangent(p0, p1, p2, p3, t) =
  3 * (1 - t) * (1 - t) * (p1 - p0)
  + 6 * (1 - t) * t * (p2 - p1)
  + 3 * t * t * (p3 - p2);

// Fifth-order smoothstep keeps the root visibly full-width at the plate and
// reaches the round rod with zero first and second width derivatives.
function smoothstep5(t) = t * t * t * (10 + t * (-15 + 6 * t));

// Forty-eight points around a convex D profile, ordered to match the circular
// section angles: curved top, full-width sides, and a full-width flat bottom.
root_profile = concat(
  [for (i = [0 : 11])
    let(a = 90 * i / 12)
    [root_upper_extent * cos(a), root_z_r * sin(a)]],
  [for (i = [0 : 5])
    [-root_lower_extent * i / 6, root_z_r]],
  [for (i = [0 : 11])
    [-root_lower_extent, root_z_r * (1 - 2 * i / 12)]],
  [for (i = [0 : 5])
    [-root_lower_extent * (1 - i / 6), -root_z_r]],
  [for (i = [0 : 11])
    let(a = 270 + 90 * i / 12)
    [root_upper_extent * cos(a), root_z_r * sin(a)]]);

assert(len(root_profile) == rod_fn,
       "D-root profile resolution must match the round rod");

function section_ring(center, tangent, y_r, z_r, normal_offset = 0) =
  let(t_len = sqrt(tangent[0] * tangent[0]
                   + tangent[1] * tangent[1]),
      tx = tangent[0] / t_len,
      ty = tangent[1] / t_len,
      nx = -ty,
      ny = tx)
  [for (i = [0 : rod_fn - 1])
    let(a = 360 * i / rod_fn)
    [center[0] + (normal_offset + y_r * cos(a)) * nx,
     center[1] + (normal_offset + y_r * cos(a)) * ny,
     center[2] + z_r * sin(a)]];

function transition_ring(center, tangent, root_weight, lower_extent) =
  let(t_len = sqrt(tangent[0] * tangent[0]
                   + tangent[1] * tangent[1]),
      tx = tangent[0] / t_len,
      ty = tangent[1] / t_len,
      nx = -ty,
      ny = tx,
      nominal_lower = rod_r
        + (root_lower_extent - rod_r) * root_weight)
  [for (i = [0 : rod_fn - 1])
    let(a = 360 * i / rod_fn,
        circle_n = rod_r * cos(a),
        circle_z = rod_r * sin(a),
        blend_n = circle_n
          + (root_profile[i][0] - circle_n) * root_weight,
        local_n = blend_n < 0
          ? blend_n * lower_extent / nominal_lower
          : blend_n,
        local_z = circle_z
          + (root_profile[i][1] - circle_z) * root_weight)
    [center[0] + local_n * nx,
     center[1] + local_n * ny,
     center[2] + local_z]];

root_anchor_profile = transition_ring(
  root_anchor_center,
  [1, 0, 0],
  1,
  root_lower_extent);

transition_profiles =
  [for (i = [0 : transition_steps])
    let(t = i / transition_steps,
        path_u = t * t,
        root_weight = 1 - smoothstep5(path_u),
        center = bezier3(transition_p0, transition_p1,
                         transition_p2, transition_p3, path_u),
        tangent = bezier3_tangent(transition_p0, transition_p1,
                                  transition_p2, transition_p3, path_u),
        tangent_len = sqrt(tangent[0] * tangent[0]
                           + tangent[1] * tangent[1]),
        normal_y = tangent[0] / tangent_len,
        lower_extent = (center[1] - body_back_y) / normal_y)
    transition_ring(
      center,
      tangent,
      root_weight,
      lower_extent)];

j_loft_steps = ceil((j_tip_angle - j_join_angle) / j_step_target);
j_profiles =
  [for (i = [1 : j_loft_steps])
    let(a = j_join_angle
              + (j_tip_angle - j_join_angle) * i / j_loft_steps)
    section_ring(
      [j_center_x + j_path_r * cos(a),
       j_center_y + j_path_r * sin(a),
       rod_z],
      [-sin(a), cos(a), 0],
      rod_r, rod_r)];

j_tip_tangent = [-sin(j_tip_angle), cos(j_tip_angle), 0];
tip_cap_profiles =
  [for (i = [1 : tip_cap_steps - 1])
    let(a = 90 * i / tip_cap_steps,
        cap_r = rod_r * cos(a),
        cap_offset = rod_r * sin(a))
    section_ring(
      [j_tip[0] + j_tip_tangent[0] * cap_offset,
       j_tip[1] + j_tip_tangent[1] * cap_offset,
       rod_z],
      j_tip_tangent,
      cap_r, cap_r)];

loft_profiles = concat([root_anchor_profile], transition_profiles, j_profiles,
                       tip_cap_profiles);
loft_profile_count = len(loft_profiles);
tip_apex = [j_tip[0] + j_tip_tangent[0] * rod_r,
            j_tip[1] + j_tip_tangent[1] * rod_r,
            rod_z];
tip_apex_index = loft_profile_count * rod_fn;
loft_points = concat([for (profile = loft_profiles) each profile],
                     [tip_apex]);
loft_side_faces =
  [for (s = [0 : loft_profile_count - 2])
    for (i = [0 : rod_fn - 1])
    let(j = (i + 1) % rod_fn,
        a = s * rod_fn + i,
        b = s * rod_fn + j,
        c = (s + 1) * rod_fn + j,
        d = (s + 1) * rod_fn + i)
    [a, d, c, b]];
loft_tip_faces =
  [for (i = [0 : rod_fn - 1])
    let(j = (i + 1) % rod_fn,
        ring_start = (loft_profile_count - 1) * rod_fn)
    [ring_start + i, tip_apex_index, ring_start + j]];
loft_faces = concat(
  [[for (i = [0 : rod_fn - 1]) i]],
  loft_side_faces,
  loft_tip_faces);

assert(rod_d > 0 && part_w > rod_d,
       "round rod must be positive and narrower than the mount");
assert(j_span > 2 * rod_d,
       "J span is too small for the requested rod diameter");
assert(body_back_y <= wall_contact_bottom_y
                      - wall_contact_extra - wall_contact_j_clearance,
       "body starts too high for the complete lower pressure-pad ramp");
assert(abs(j_bottom_y - body_back_y) < 0.001,
       "compact J bottom must align with the fixed body bottom");
assert(abs(root_upper_extent - rod_r) < 0.001,
       "upper root contour must not bulge beyond the Ø6 rod radius");
assert(root_lower_extent > rod_r,
       "lower root extent must reinforce the Ø6 rod");
assert(root_z_r > rod_r,
       "root width must contract toward the Ø6 rod");
assert(abs(2 * root_z_r - part_w) < 0.001,
       "root must remain inside the complete mount width");
assert(root_embed > 0 && root_anchor_center[0] < x_pf,
       "root anchor must overlap the fixed plate with positive volume");
assert(root_face_depth > 0 && transition_p0[0] > x_pf,
       "full-width root face must extend visibly beyond the plate");
assert(abs(root_bottom_y - body_back_y) < 0.001,
       "loft root must start exactly at the fixed body bottom datum");
assert(abs(j_join_angle - 270) < 0.001,
       "loft must join the circular J path at its true bottom");
assert(abs(j_join_center[1] - rod_r - body_back_y) < 0.001,
       "circular join bottom must match the fixed body bottom datum");
assert(root_top_y < -pad_top_drop,
       "loft root reaches the fixed rail-zone body datum");
assert(tip_top_y < 0,
       "raised round tip reaches the slot-ceiling datum");

// Keep only the minimum straight fixed plate below the pressure face. The
// single embedded loft supplies local width where the round rod enters.
base_body_pts = [[x_pf, body_back_y]];

union() {
  rail_accessory(body_back_y, base_body_pts,
                 w = part_w, ch = side_chamfer);
  polyhedron(points = loft_points, faces = loft_faces, convexity = 10);
}

echo(str("hook-round6-short: rod = ", rod_d,
         " mm; outer span = ", j_span,
         " mm; J center/bottom = ", j_center_y, "/", j_bottom_y,
         " mm; overall height = ", overall_height, " mm"));
echo(str("hook-round6-short: original height = ", original_overall_height,
         " mm; reduction = ", height_reduction,
         " mm; mount width = ", part_w));
echo(str("hook-round6-short: centered side-print support gap = ",
         rod_bed_gap, " mm; root U/L/W = ",
         root_upper_extent, "/", root_lower_extent, "/",
         2 * root_z_r, " mm at reference Y = ", root_center_y,
         "; Bezier join/handles = ", j_join_angle, "/",
         transition_start_handle, "/", transition_end_handle,
         "; root Y = ", root_bottom_y, "..", root_top_y,
         "; tip ceiling gap = ", tip_ceiling_gap, " mm"));
