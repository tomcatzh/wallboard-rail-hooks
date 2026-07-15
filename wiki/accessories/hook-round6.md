---
title: "hook-round6 — 25 mm span J hook with Ø6 mm round rod"
type: output
status: active
sources:
  - raw/rail/hook-installed-on-rail.jpg
updated: 2026-07-14
---

# hook-round6（Ø6 mm 圆杆的 25 mm J 钩）

## Summary（摘要）

EN: [`accessories/hooks/round-6.scad`](../../accessories/hooks/round-6.scad) is the user-requested round-body experiment. It preserves the fit-validated rail claw, the selected 2.0 mm lower wall-contact face, the 11.9 mm mount width, and the 25 mm outer J envelope of [hook-wide25](hook-wide25.md). Below the pressure face, the broad shank blends into a centered plain Ø6.0 mm rod; the free end is closed by a sphere. “M6” is used here only as the 6 mm nominal diameter—the model contains no thread.
ZH: [`accessories/hooks/round-6.scad`](../../accessories/hooks/round-6.scad) 是用户要求尝试的圆杆主体版本。它保留已通过试装的 rail claw（轨道卡爪）、定案的 2.0 mm 下方抵墙承压面、11.9 mm 安装头宽度，以及 [hook-wide25](hook-wide25.md) 的 25 mm J 钩外包络。承压面以下，宽杆身过渡到居中的普通 Ø6.0 mm 圆杆；自由端用球体封成圆头。这里的 “M6” 只表示 6 mm nominal diameter（名义直径），模型中没有螺纹。

## Geometry（几何）

- EN: `rod_d=6.0`, `j_span=25.0`, `shank_drop=24.0`, `j_sweep=205`, `part_w=11.9`; total height is 47.7 mm, matching `hook-wide25`.
  ZH: `rod_d=6.0`、`j_span=25.0`、`shank_drop=24.0`、`j_sweep=205`、`part_w=11.9`；总高 47.7 mm，与 `hook-wide25` 一致。
- EN: The round-rod centerline radius is 9.5 mm. Adding the 3 mm rod radius gives a 12.5 mm outer radius, preserving the 25 mm back-to-front envelope.
  ZH: 圆杆中心线路径半径为 9.5 mm；加上 3 mm 杆半径后外半径为 12.5 mm，从而保持 25 mm 的前后外包络。
- EN: The full-width pressure/shank body ends at `Y=-22.4`, after the complete 1.2 mm lower pressure-pad ramp. A convex 3D transition runs from `Y=-20.8` to the round tangent at `Y=-24`; the remaining broad root is intentional load spreading, not part of the Ø6 rod.
  ZH: 全宽承压/杆身主体在 `Y=-22.4` 结束，此处完整保留 1.2 mm 的承压面下过渡。凸形 3D transition（三维过渡）从 `Y=-20.8` 延伸到 `Y=-24` 的圆杆相切点；保留的宽根部用于分散载荷，不属于 Ø6 圆杆段。
- EN: The swept J has a constant circular section; a sphere at the free end provides the requested fully rounded head in every view.
  ZH: 扫掠生成的 J 段具有恒定圆形截面；自由端球体在所有方向形成用户要求的完整圆头。

## First-Order Strength Comparison（一级强度比较）

EN: The Ø6 circular section modulus is `Z = πd³/32 ≈ 21.2 mm³`. The 4.4 × 11.9 mm reinforced shank on `hook-wide25` has `Z ≈ 38.4 mm³` for the principal in-plane bending case. The round section therefore retains about 55% of that section modulus and sees about 1.81× the nominal bending stress at the same moment.
ZH: Ø6 圆截面的 section modulus（截面模量）为 `Z = πd³/32 ≈ 21.2 mm³`。`hook-wide25` 的 4.4 × 11.9 mm 加强杆身在主要平面内弯曲工况下为 `Z ≈ 38.4 mm³`。因此圆截面约保留其 55% 截面模量，在相同弯矩下名义弯曲应力约为 1.81 倍。

EN: Reusing the prior 5 kg no-wall-contact moment estimate (`M≈505 N·mm`) gives about 24 MPa at the Ø6 section, before print defects, stress concentration, anisotropy, or creep margins. Consequently this prototype does **not** inherit the 5 kg design assumption of `hook-wide25`; begin with light static loads and establish a separate physical rating.
ZH: 沿用此前 5 kg、无抵墙接触的弯矩估算（`M≈505 N·mm`），Ø6 截面的名义应力约为 24 MPa，且尚未计入打印缺陷、应力集中、anisotropy（各向异性）或 creep（蠕变）余量。因此该原型**不继承** `hook-wide25` 的 5 kg 设计假设；应从轻载静置开始，为它单独建立实物承载等级。

## Printing（打印）

- EN: Keep the mount side-face-down so the fit-critical claw and principal J bending remain favorably oriented. Because the round rod is centered at `Z=5.95`, its lowest point is `Z=2.95`; localized support is required below the rod and spherical tip.
  ZH: 保持安装头侧面朝下，使配合关键的卡爪与 J 钩主要弯曲方向维持较有利的打印取向。圆杆中心位于 `Z=5.95`，最低点为 `Z=2.95`；圆杆和球面圆头下方需要局部支撑。
- EN: Prefer PETG or ASA, at least four perimeters, and support settings that minimize scars on the lower half of the rod. Treat the first print as a fit and light-load specimen.
  ZH: 优先使用 PETG 或 ASA、至少四圈壁，并用尽量减少圆杆下半部伤痕的支撑设置。首件应视为试装与轻载样件。

## Verification（验证）

- EN: Docker `scad-render` completed with no warnings or assertions. Echo checks: rod 6, span 25, height 47.7, mount width 11.9, support gap 2.95; fixed-interface echoes remain plate 2.2, head depth 7.35, wall contact 2.0 at `Y=-16…-21`, ramps 1.2/1.2.
  ZH: Docker `scad-render` 无 warning、无 assertion 完成。echo 检查：圆杆 6、跨度 25、总高 47.7、安装头宽 11.9、支撑空隙 2.95；固定接口 echo 仍为主板 2.2、安装头总深 7.35、`Y=-16…-21` 处抵墙 2.0、上下过渡 1.2/1.2。
- EN: Final mesh is one manifold solid: `NoError`, genus 0, 4424 vertices / 8844 facets. Iso, profile, front, and right views show a continuous broad-to-round transition, constant round J, complete claw, and spherical free end.
  ZH: 最终网格为单一 manifold（流形）实体：`NoError`、genus 0、4424 vertices / 8844 facets。等轴、截面、正面与右视图显示宽到圆过渡连续、J 圆杆恒径、卡爪完整、自由端为球面。
- EN: Regression renders for `hook-classic`, `hook-wide25`, and the skill example also remain manifold `NoError`, genus 0. The production library and skill copy remain byte-identical.
  ZH: `hook-classic`、`hook-wide25` 与 skill 示例的回归渲染也仍为 manifold `NoError`、genus 0。正式库与 skill 副本继续保持字节一致。

## Open Questions（开放问题）

- EN: Physical print, rail seating, support removal, surface quality, and progressive load testing are pending. Pay special attention to the broad-to-round root and the support-marked lower rod surface.
  ZH: 尚待完成实物打印、轨道就位、拆支撑、表面质量与逐级承载测试。重点观察宽转圆根部，以及带支撑痕迹的圆杆下表面。
