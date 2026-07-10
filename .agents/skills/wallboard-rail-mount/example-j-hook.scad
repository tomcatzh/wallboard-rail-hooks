// example-j-hook.scad — classic J hook on the canonical rail-mount library.
// Copy this file as a body-design starting point; keep the mount library fixed.

include <rail-mount.scad>

/* [Design] */
part_w = 11.9;
shank_drop = 22.3;
j_r_out = 8.5;
j_r_in = 5.5;
j_lift = 0.7;
j_sweep = 205;

rail_accessory(-shank_drop,
               j_hook_body(shank_drop, j_r_out, j_r_in, j_lift, j_sweep),
               w = part_w);

echo(str("example-j-hook: span = ", 2 * j_r_out, " mm; overall height = ",
         y_top + shank_drop + j_r_out, " mm; width = ", part_w));
