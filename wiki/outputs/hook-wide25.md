---
title: "hook-wide25 — 25 mm span J hook, plastic-sized"
type: output
status: active
sources:
  - raw/assets/hook-installed-on-rail.jpg
updated: 2026-07-09
---

# hook-wide25（25 mm 大跨度 J 钩）

## Summary（摘要）

EN: [`hooks/hook-wide25.scad`](../../hooks/hook-wide25.scad) matches the metal original's 25 mm outer span (the classic replica is 17 mm — the photo-derived J was undersized, as the user's caliper showed). Per the user's insight, a scaled copy would NOT work in plastic: the load hangs ~1.5× further out while PETG has ~1/10 the strength of the 6-series aluminum — so the sections are re-sized where the moment lives, not scaled.
ZH: [`hooks/hook-wide25.scad`](../../hooks/hook-wide25.scad) 对齐金属原版 25 mm 的外缘跨度（复刻版是 17 mm —— 照片推出的 J 偏小，用户卡尺证实）。按用户的判断，塑料不能简单放大：载荷悬出远了约 1.5 倍，而 PETG 强度只有六系铝的约 1/10 —— 所以按弯矩所在位置重配截面，而不是等比缩放。

## Sizing Math（尺寸计算，5 kg 额定 / PETG）

- EN: Span 25 = 2 × `j_r_out` → `j_r_out = 12.5`; outer-arc center (≈ the load line for items resting in the curve) sits at x ≈ 11.7 vs 7.7 on the classic.
  ZH: 跨度 25 = 2 × `j_r_out` → `j_r_out = 12.5`；外弧圆心（挂物停在弧底时的载荷线）在 x ≈ 11.7，经典版为 7.7。
- EN: Shank, worst case (wall pad not engaged): M ≈ 49 N × (11.7 − 1.4) ≈ 505 N·mm. At the original's 3.0 mm thickness: σ ≈ 30 MPa — over PETG's sustained limit, confirming "no simple scaling". At 4.4 mm (`shank_front_extra = 1.4`): Z = 38.4 mm³ → σ ≈ 13 MPa worst case, ≈ 4–5 MPa in the design case with the pad engaged. ✓
  ZH: 杆身最坏工况（凸台未贴墙）：M ≈ 49 N × (11.7 − 1.4) ≈ 505 N·mm。按原版 3.0 mm 厚：σ ≈ 30 MPa —— 超出 PETG 长期限值，印证"不能简单放大"。取 4.4 mm（`shank_front_extra = 1.4`）：Z = 38.4 mm³ → 最坏 σ ≈ 13 MPa，凸台贴墙的设计工况 ≈ 4–5 MPa。✓
- EN: J wall (`j_r_in = 9.3`, effective 8.6 with the thickening): bottom ≈ 4.6, tip ≈ 3.2 (classic: 3.7 / 2.8); mouth inner dia ≈ 17 — takes thick coat loops and rods.
  ZH: J 壁（`j_r_in = 9.3`，加厚后有效 8.6）：底部 ≈ 4.6、尖部 ≈ 3.2（经典版 3.7 / 2.8）；钩口内径 ≈ 17 —— 能挂粗衣环、杆件。
- EN: Claw (fixed mount): the tipping couple grows ~×1.3 with the reach; the full-span arc gusset absorbs it (worst mid-arm ≈ 10–19 MPa @5 kg — still fine).
  ZH: 爪部（固定安装头）：倾覆力偶随悬出增大约 1.3 倍；全跨圆弧加强可以吃下（5 kg 最坏顶桥中段 ≈ 10–19 MPa —— 仍然安全）。

## Parameters & Verification（参数与验证）

- EN: `part_w 11.9 / shank_front_extra 1.4 / shank_drop 24 / j_r_out 12.5 / j_r_in 9.3 / j_lift 0.7 / j_sweep 205`. Overall height 47.7; volume ≈ 3.5 cm³ (~4.4 g PETG).
  ZH: `part_w 11.9 / shank_front_extra 1.4 / shank_drop 24 / j_r_out 12.5 / j_r_in 9.3 / j_lift 0.7 / j_sweep 205`。总高 47.7；体积 ≈ 3.5 cm³（PETG 约 4.4 g）。
- EN: Rendered clean via docker scad-render; echoes: span 25 ✓, shank 4.4 ✓; bbox x-extent 29.35 = claw 5.15 + span 25 − pad 0.8 exactly. Same print rules as the classic (flat, PETG, ≥4 perimeters).
  ZH: docker scad-render 渲染零 warning；echo：跨度 25 ✓、杆身 4.4 ✓；包围盒 x 向 29.35 = 爪 5.15 + 跨度 25 − 凸台 0.8，分毫不差。打印规则同经典版（平放、PETG、≥4 圈壁）。
