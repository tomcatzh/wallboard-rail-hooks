---
title: "Strength & stress-concentration review of hook.scad v1"
type: output
status: active
sources:
  - raw/rail/hook-mount-dimensions.jpg
  - raw/rail/hook-full-view.jpg
updated: 2026-07-10
---

# Strength Review of hook.scad v1（v1 强度与应力集中审查）

## Load Model（受力模型）

EN: Hanging load W acts at the J bottom, ≈8.9 mm in front of the rail face (x datum). Three reactions: V ≈ W upward where the slot ceiling bears on the lip top; a horizontal couple formed by F (lip back face pushes the finger rearward) and H (rail face / wall pushes the lower shank outward). F and H depend strongly on where the lower contact lands: contact near the shank bottom (y ≈ −22) gives F ≈ H ≈ 0.36 W and relieves the shank; contact right at the step (y ≈ −7.3), or no contact at all, leaves the shank carrying up to the full cantilever moment.
ZH: 挂载 W 作用在 J 钩底部，距挂条面（x 基准）约 8.9 mm。三个支反力：槽顶压在唇顶上的 V ≈ W（向上）；由 F（唇背向后推爪指）和 H（挂条面/墙面向外顶下段杆身）组成的水平力偶。F、H 大小强烈依赖下部接触点位置：接触落在杆身下端（y ≈ −22）时 F ≈ H ≈ 0.36 W，且能卸掉杆身弯矩；接触正好在台阶处（y ≈ −7.3）或完全不接触时，杆身要扛接近全悬臂的弯矩。

EN: Bending moment in the shank: M ∈ [2.3 W, 7.6 W] N·mm (good wall contact → none). Bending tension is on the FRONT (room-side) face; compression on the wall side.
ZH: 杆身弯矩范围：M ∈ [2.3 W, 7.6 W] N·mm（墙面接触良好 → 无接触）。弯曲受拉面在**正面（房间侧）**，受压面在墙侧。

## Hotspots（应力集中点，编号对应受力图）

| # | Location（位置） | Section / feature | σ @3 kg (30 N) | Verdict（结论） |
|---|------------------|-------------------|----------------|-----------------|
| 1 | Shank below the back step（台阶下方杆身） | 1.8×8 mm, Z=4.32 mm³ — thinnest structural section | 16–53 MPa nominal | **Governing weakness（决定性弱点）** |
| 2 | Claw internal corners（爪部两个内角：槽顶↔主板背面、槽顶↔爪指前面） | sharp 90°, Kt≈3; arm-root nominal 0.14–0.8 MPa/N | local peak up to ~70 MPa worst case | fillet needed; also lip-edge creep indentation（需圆角；唇缘还会压出蠕变压痕） |
| 3 | Serration grooves（正面锯齿槽） | notch field ON the tension face, ends only ~1.5 mm above the max-moment section; FDM-printed Kt≈1.5–2 | local 12–35+ MPa | reduce depth / round roots / keep clear of step（减深/圆根/远离台阶） |
| 4 | Step reentrant corner（台阶内角） | 0.4 step at the max-moment height, but on the compression face | secondary | cheap fillet（顺手加圆角） |
| 5 | J inner fiber（J 钩内侧） | curved-beam factor ~1.2–1.3 (R/t≈1.9), section ≥3.2 thick, moment < shank | not governing | OK |

EN: Non-issues: bearing pressure at the lip (~2 MPa at 3 kg), the mounting-head walls themselves (short lever arms), the J tip, and layer orientation — the default print pose (side face down) keeps every major stress in-plane.
ZH: 不构成问题的：唇顶承压（3 kg 时约 2 MPa）、安装头壁本身（力臂很短）、钩尖、层向 —— 默认打印姿态（侧面朝下）让所有主应力都在层平面内。

## Material & Rating（材料与承载评级）

EN: Sustained-load (creep-aware) allowables: PLA yield 50–60 but only ~8–12 MPa creep-safe; PETG ~50 yield, ~12–18 creep-safe; ASA/ABS 35–45 yield with better creep than PLA. Original aluminum 6063-T5 yields 145–215 MPa — that is why the 1.8 mm section is fine in metal and marginal in plastic.
ZH: 持续载荷（考虑蠕变）的许用值：PLA 屈服 50–60 但长期只能按 ~8–12 MPa 用；PETG 屈服 ~50，长期 ~12–18；ASA/ABS 屈服 35–45，抗蠕变优于 PLA。原件铝 6063-T5 屈服 145–215 MPa —— 这就是 1.8 mm 截面在金属上没问题、在塑料上勉强的原因。

- EN: v1 as-is, PETG, ≥4 perimeters, printed flat: ≈1.5–2 kg sustained guaranteed (no wall-contact assumed); ≈3–4 kg if the lower shank reliably bears on the rail/wall. Short-term peaks ≈2×. PLA: roughly halve, plus creep.
  ZH: v1 原样、PETG、≥4 圈壁、平放打印：保守（不指望墙面接触）持续承载 ≈1.5–2 kg；下段杆身可靠顶墙时 ≈3–4 kg。短时峰值约 2 倍。PLA 大致减半，且有蠕变问题。
- EN: Key insight: the back-face step is STRUCTURAL, not just cosmetic — it decides whether the H contact exists. Verify step_depth vs the rail-face protrusion (D13) at test fit.
  ZH: 关键认识：背面台阶是**结构性**的，不只是外观 —— 它决定 H 接触是否存在。试装时要验证 step_depth 与挂条面凸出量（D13）的匹配。

## Recommendations（改进建议，全部保持配合面不变）

1. EN: Fillets: finger-root corner r0.6–0.8 (safe — real lip ≈1.8 < slot 2.75 minus r); plate-back corner r0.3 (ride-up ≤0.1–0.2 mm given the aluminum lip's own edge radius — confirm at test fit); step corner r0.5–1; serration groove roots rounded or depth → 0.15.
   ZH: 圆角：爪指根内角 r0.6–0.8（安全 —— 实际唇厚 ≈1.8 < 槽 2.75 − r）；主板背内角 r0.3（考虑铝唇自身棱边圆角，抬高 ≤0.1–0.2 mm，试装确认）；台阶内角 r0.5–1；锯齿槽根倒圆或深度改 0.15。
2. EN: Thicken the shank forward below the rail-overlap zone: 1.8 → ~3.2, tapering from y ≈ −7.3, blending into the J inner face. Front face in the rail zone stays at x=+2.2 (looks + head_depth untouched).
   ZH: 挂条重叠区以下把杆身向前加厚：1.8 → ~3.2，从 y ≈ −7.3 起渐变，并入 J 内侧。挂条区内的正面仍在 x=+2.2（外观与 head_depth 不动）。
3. EN: Widen hook_w 8 → 10 (variable per user).
   ZH: 宽度 hook_w 8 → 10（用户已定为可变项）。
4. EN: Material PETG or ASA; avoid PLA for a permanently loaded hook. ≥4 perimeters or 100% infill (near-solid at these thicknesses anyway).
   ZH: 材料选 PETG 或 ASA；常载挂钩避免 PLA。≥4 圈壁或 100% 填充（此壁厚下本来就近实心）。

EN: With (1)+(2)+(3): worst-case σ @5 kg ≈ 22 MPa → PETG sustained OK ⇒ ~5 kg rating even without wall contact, ~2× margin with contact.
ZH: 叠加（1）+（2）+（3）后：5 kg 最坏情况 σ ≈ 22 MPa → PETG 长期可用 ⇒ 即使不靠墙面接触也可标 ~5 kg，有接触时余量约 2 倍。

EN: Status 2026-07-09: implemented in hook.scad v2 — (1) fillets, (2) shank thickening, step ramp, serration off by default, plus whole-outline side chamfers requested by the user. `hook_w` left at 8 (widening to 10 remains available). See the v2 section of [hook-scad-v1](hook-scad-v1.md).
ZH: 状态 2026-07-09：已在 hook.scad v2 落地 —— （1）圆角、（2）杆身加厚、台阶斜坡、锯齿默认关，另加用户点名的整圈侧面倒角。`hook_w` 暂留 8（随时可加到 10）。见 [hook-scad-v1](hook-scad-v1.md) 的 v2 小节。

EN: Update (v3, same day): the corrected reading of the original shows it solves the H contact BY DESIGN — a 0.8 mm wall pad below the rail zone (plus a matching top cap against over-rotation). v3 models both; "no wall contact" is no longer the design case. Design-case σ @5 kg ≈ 9 MPa (PETG comfortable) with the shank at the original's 3.0 mm; `shank_front_extra` returns to 0.
ZH: 更新（v3，同日）：纠正解读后发现原件本来就把 H 接触做进了设计 —— 挂条区以下 0.8 mm 抵墙凸台（另有防过转的顶部小帽）。v3 两者都已建模；“无墙面接触”不再是设计工况。设计工况 5 kg 时 σ ≈ 9 MPa（PETG 从容），杆身按原件取 3.0 mm；`shank_front_extra` 回到 0。

EN: Update (v4): hotspot 2 (claw root) largely retired — the user-proposed 45° `arm_gusset` (1.5) deepens the arm-root section 2.2→3.7, cutting root stress ≈3× and softening the corner to two 135° bends. Together with hook_w=11.9, the design-case margins at 5 kg are now: shank ≈8 MPa, claw root ≈9 MPa — both comfortable for PETG. Remaining watch item: the gusset top must clear the rail's slot opening (unmeasured, est. ≈4).
ZH: 更新（v4）：应力点②（爪根）基本消解 —— 用户提议的 45° `arm_gusset`（1.5）把根部截面深从 2.2 加到 3.7，根部应力降约 3 倍，直角变两个 135°。叠加 hook_w=11.9 后，5 kg 设计工况余量：杆身 ≈8 MPa、爪根 ≈9 MPa —— PETG 均从容。剩余关注点：斜撑顶须让开挂条槽口（未实测，估 ≈4）。

EN: Update (v5): the root-only gusset is superseded by the user's stronger idea — a full-span tangent arc (`arm_gusset_r=5.0`) from the plate back to the bridge edge. Analysis: the finger's F-couple loads the ENTIRE arm at ≈4.2–5.1 W·mm (not just the root), so a root-only gusset left the mid-arm at ≈26 MPa @5 kg worst-case; the full arc brings mid-arm to ≈8–15 and the root region to ≈5–9, cornerless (Kt≈1). Every section of the hook now sits below ≈15 MPa in the worst case and below ≈9 MPa in the design case at 5 kg with PETG.
ZH: 更新（v5）：仅根部的斜撑被用户更强的方案取代 —— 从主板背面到桥边缘的全跨相切圆弧（`arm_gusset_r=5.0`）。分析：爪指的力偶让整根顶桥都承担 ≈4.2–5.1 W·mm 弯矩（不只根部），仅根部加强时中段最坏工况仍 ≈26 MPa @5 kg；全跨圆弧后中段降到 ≈8–15、根部区 ≈5–9，且完全无角（Kt≈1）。至此 5 kg 下钩子所有截面最坏工况都低于 ≈15 MPa、设计工况低于 ≈9 MPa（PETG）。

## 2026-07-10 Contact Correction（接触条件修订）

EN: The lower wallboard sits farther behind the rail datum than the original baseline `pad_back=0.8` contour, so the original classic profile could miss the intended H reaction. The 1.6 mm candidate was superseded by 2.0/2.5 mm half-width probes; the user selected 2.0 mm.
ZH: 轨道下方墙板比原始基准 `pad_back=0.8` 轮廓更靠后，因此原经典轮廓可能无法形成预期的 H 反力。1.6 mm 候选方案随后被 2.0/2.5 mm 半宽探针替代；用户最终选择 2.0 mm。

EN: Production v7 now gives both full-width hooks a 5 mm pressure face at `X=−2.0`, `Y=−16…−21`. This restores the intended contact load path in the model without changing the validated rail clip or J datum. The contact-dependent rating remains conditional until a full-width v7 print confirms complete rail seating, firm panel contact without excessive preload, and real load behavior; use the no-contact bound whenever those conditions are not established.
ZH: 正式 v7 现为两款全宽挂钩提供位于 `X=−2.0`、`Y=−16…−21` 的 5 mm 承压面。它在不改变已验证轨道卡扣与 J 基准的前提下，恢复了模型中预期的接触受力路径。在全宽 v7 实物确认轨道完全就位、墙板接触可靠且不过度预紧，并完成真实承载验证前，依赖接触的承载评级仍是有条件结论；条件未确认时应继续采用不接触上界。

## Method Note（方法说明）

EN: Hand beam/cantilever calculations on the v1 sections (Z = b·t²/6), bounded by the two contact scenarios; stress-concentration factors from standard sharp-corner/notch values (Kt≈3 sharp inside corner, 1.5–2 FDM-rounded V-groove). No FEA — adequate for ranking hotspots and sizing; numbers are ±30% class.
ZH: 基于 v1 截面的手算梁/悬臂计算（Z = b·t²/6），用两种接触情形做上下界；应力集中系数取标准值（尖内角 Kt≈3，FDM 圆化 V 槽 1.5–2）。未做 FEA —— 用于排序弱点和定尺寸足够；数字精度 ±30% 级别。
