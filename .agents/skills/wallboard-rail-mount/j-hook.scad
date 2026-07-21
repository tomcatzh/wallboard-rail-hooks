// j-hook.scad — reusable parametric J-hook body helper（参数化 J 钩主体库）
// Defines no top-level geometry. The helper uses the validated rail library's
// body datums and arc utility, so including this file also loads rail-mount.scad.

include <rail-mount.scad>

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
