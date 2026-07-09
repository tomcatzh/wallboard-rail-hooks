// hook-wide25.scad — 25 mm span J hook（大跨度 J 钩，对齐金属原版的 25 mm 外缘跨度）
// NOT a scaled copy: the load hangs ~1.5x further out, so plastic needs thicker
// sections where the moment lives. Sizing (5 kg, PETG):
//   - load line at the curve bottom x ~= 11.7; worst-case (no wall contact)
//     shank moment ~= 505 N*mm
//   - shank at the original 3.0 -> 30 MPa (creep NG); at 4.4 -> ~13 MPa OK,
//     design case with the wall pad engaged ~4-5 MPa
//   - J wall: bottom ~4.6, tip ~3.2 (classic: 3.7 / 2.8); mouth inner dia ~17
// Full math: wiki/outputs/hook-wide25.md

include <../lib/rail-mount.scad>

/* [Design] */
// width along the rail = print height
part_w = 11.9;
// forward shank thickening: 3.0 -> 4.4 (sized for the longer moment arm)
shank_front_extra = 1.4;
// straight shank below the slot ceiling (a touch longer for proportion)
shank_drop = 24;
// J outer radius: span = 2*12.5 = 25 mm as on the metal original
j_r_out = 12.5;
// inner radius param (effective 8.6 with the thickening) / lift / sweep
j_r_in = 9.3;
j_lift = 0.7;
j_sweep = 205;

rail_accessory(-shank_drop,
               j_hook_body(shank_drop, j_r_out, j_r_in, j_lift, j_sweep, shank_front_extra),
               w = part_w);

echo(str("hook-wide25: span = ", 2 * j_r_out, " mm; shank = ",
         x_pf + shank_front_extra + pad_back, " mm; overall height = ",
         y_top + shank_drop + j_r_out, " mm; width = ", part_w));
