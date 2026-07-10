// hook-classic.scad — replica of the original Youbang J hook（原厂同款 J 钩）
// Span from the back face = 2 * j_r_out = 17 mm. The J/body params match the
// former hook.scad v5.3 fit-validated print; the shared v7 mount adds the
// selected 2.0 mm lower wall-contact face. Only the body params below belong
// to this design.

include <../lib/rail-mount.scad>

/* [Design] */
// width along the rail = print height (original hook: 11.9)
part_w = 11.9;
// straight shank below the slot ceiling
shank_drop = 22.3;
// J outer radius (span = 2*r_out) / inner radius / inner-center lift / sweep
j_r_out = 8.5;
j_r_in = 5.5;
j_lift = 0.7;
j_sweep = 205;

rail_accessory(-shank_drop,
               j_hook_body(shank_drop, j_r_out, j_r_in, j_lift, j_sweep),
               w = part_w);

echo(str("hook-classic: span = ", 2 * j_r_out, " mm; overall height = ",
         y_top + shank_drop + j_r_out, " mm; width = ", part_w));
