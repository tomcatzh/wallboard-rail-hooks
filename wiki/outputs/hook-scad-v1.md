---
title: "hook.scad — OpenSCAD model history"
type: output
status: active
sources:
  - raw/rail/hook-mount-dimensions.jpg
  - raw/rail/hook-installed-on-rail.jpg
updated: 2026-07-14
---

# hook.scad（OpenSCAD 模型版本史）

## Summary（摘要）

EN: The first OpenSCAD model of the rail hook lived at the historical repo-root `hook.scad`; v6 split it into `lib/` + `hooks/`, and the 2026-07-14 catalog refactor moved current entry models under `accessories/<family>/`. The mounting head used the user-confirmed nominals verbatim; the body and J-hook were deliberately approximate and fully parametric, per the user's 2026-07-09 direction ("外部的挂钩也许未来可以作为参数项，现在做个大概"). It was rendered and verified headless via the Docker toolchain; artifacts live in `out/`.
ZH: 第一版轨道挂钩 OpenSCAD 模型曾位于仓库根目录 `hook.scad`；v6 将其拆为 `lib/` + `hooks/`，2026-07-14 的 catalog（目录清单）重构又把现行入口模型迁到 `accessories/<family>/`。安装头严格使用用户确认的名义尺寸；躯干与 J 钩按用户 2026-07-09 的指示（"外部的挂钩也许未来可以作为参数项，现在做个大概"）刻意做成近似且完全参数化。它已通过 Docker 工具链 headless（无显示）渲染验证；产物位于 `out/`。

## Datum & Construction（基准与构造）

- EN: Datum: X=0 at the plate back face (rail-lip contact plane), Y=0 at the slot ceiling (bearing face); +X = room side, +Y = up; the 2D profile polygon is `linear_extrude`-d by `hook_w` along +Z (the rail direction). This mirrors the extrusion-slice construction of the original (see [rail-hook](../entities/rail-hook.md)).
  ZH: 基准：X=0 为主板背面（贴挂条上唇的接触面），Y=0 为槽顶（承重面）；+X 朝房间侧，+Y 向上；2D 截面 polygon 沿 +Z（挂条方向）`linear_extrude` 出 `hook_w` 宽。这与原件"挤出型材切片"的构造一致（见 [rail-hook](../entities/rail-hook.md)）。
- EN: Single polygon carries the whole profile, serration teeth included. The J is built from two offset arc centers — outer arc tangent to the stepped back face, inner arc tangent to the front face with an upward `j_lift` — which reproduces the original's gradual thickening toward the tip.
  ZH: 整个截面（含锯齿）是一个 polygon。J 钩用两个错位圆心构成 —— 外弧与台阶后的背面相切，内弧与正面相切并上移 `j_lift` —— 复现原件朝钩尖逐渐加厚的特征。

## Parameters（参数）

| Group（组） | Params | Defaults | Nature（性质） |
|------------|--------|----------|----------------|
| Fit-critical, annotated（配合关键，标注值） | `finger_t` / `slot_gap` / `head_depth` | 2.40 / 2.75 / 7.35 | user-confirmed nominals, verbatim（用户确认，原样使用）; `plate_t` derived = 2.20 |
| Head verticals（安装头竖直，估计值） | `arm_t` / `finger_len` / `plate_above` / `top_slant` / `tip_chamfer` | 2.2 / 5.5 / 7.0 / 1.2 / 0.4 | photo estimates — `finger_len` errs short（照片估计，爪指宁短勿长） |
| Variable body（可变躯干） | `hook_w` / `step_below` / `step_depth` / `shank_drop` | 8 / 7.3 / 0.4 / 22.3 | free（自由） |
| Variable J（可变 J 钩） | `j_r_out` / `j_r_in` / `j_lift` / `j_sweep` | 8.5 / 6.0 / 0.7 / 205 | free — future variants（自由，未来出变体） |
| Serration（锯齿，装饰） | `serr_on` / `serr_len` / `serr_pitch` / `serr_depth` | true / 15 / 0.65 / 0.25 | cosmetic（装饰） |

EN: Overall height with defaults = 40 mm (echo-verified). All params are Customizer-grouped in the file.
ZH: 默认参数下总高 = 40 mm（echo 自检验证）。所有参数在文件里按 Customizer 分组。

## Deviations from the Original（与原件的已知差异）

- EN: Sharp corners where the original has small rounds; a 0.4 mm chamfer approximates the original's rounded finger tip and aids insertion. v5.1 restores the arm outer-corner round (`arm_edge_r=0.8`).
  ZH: 原件的小圆角在 v1 中为直角；爪指末端用 0.4 mm 倒角近似原件圆角，兼作插入导向。v5.1 已恢复顶桥外角圆角（`arm_edge_r=0.8`）。
- EN: No V-notch at the J tip; J thickening approximated by the two-center trick; tip end face is flat.
  ZH: J 钩尖无 V 缺口；加厚用双圆心近似；钩尖端面为平面。
- EN: Serration modeled as triangular grooves (0.65 pitch × 0.25 deep); FDM printing may blur them.
  ZH: 锯齿建为三角槽（间距 0.65、深 0.25）；FDM 打印可能会糊掉。

## Verification（验证）

- EN: Rendered with docker image `openab-openscad-toolchain-base:openscad-nightly-2026.01.19.2` via `scad-render` (the helper from `~/work/openab-deploy`, mounted; no local OpenSCAD install needed). STL + 4 orthographic PNGs produced, zero warnings/errors; echo checks: head depth 7.35 ✓, derived plate 2.2 ✓, height 40 ✓.
  ZH: 用 docker 镜像 `openab-openscad-toolchain-base:openscad-nightly-2026.01.19.2` 通过 `scad-render`（挂载自 `~/work/openab-deploy` 的助手脚本；本机无需安装 OpenSCAD）渲染。产出 STL + 4 张正交 PNG，零 warning/error；echo 自检：总深 7.35 ✓、推导主板 2.2 ✓、总高 40 ✓。
- EN: `out/hook-top.png` (the profile view) visually matches the bare-hook photo `raw/rail/hook-installed-on-rail.jpg`.
  ZH: `out/hook-top.png`（截面视图）与裸钩照片 `raw/rail/hook-installed-on-rail.jpg` 目视一致。
- EN: Artifacts: `out/hook.stl`, `out/hook-{iso,top,front,right}.png` (generated, re-renderable — not sources).
  ZH: 产物：`out/hook.stl`、`out/hook-{iso,top,front,right}.png`（生成物，可重渲 —— 不是 source）。

## Print Notes（打印备注）

- EN: As modeled the part already lies side-face-down (profile in XY, width along Z): every layer is the full profile, so no supports are needed and the claw's bending stress stays within layer planes — the strongest orientation.
  ZH: 模型默认姿态就是侧面朝下（截面在 XY，宽度沿 Z）：每层都是完整截面，无需支撑，且安装爪的弯曲应力落在层平面内 —— 最强的打印取向。
- EN: Nominals are used verbatim (user decision). If a printed slot comes out tight/loose, adjust via params (`slot_gap`, `finger_len`), never by hand-editing geometry.
  ZH: 名义尺寸原样使用（用户决定）。若打印后槽偏紧/偏松，通过参数（`slot_gap`、`finger_len`）调整，不要手改几何。

## v2 Changes（v2 变更，2026-07-09）

EN: User-approved strength pass after the review in [hook-strength-review](hook-strength-review.md). Fit surfaces and the three annotated dims unchanged. Set `side_chamfer=0`, `fillet_*=0`, `shank_front_extra=0`, `serr_on=true` to recover the exact v1 silhouette.
ZH: 依据 [hook-strength-review](hook-strength-review.md) 的审查、经用户同意做的强度修订。配合面与三个标注尺寸不变。把 `side_chamfer=0`、`fillet_*=0`、`shank_front_extra=0`、`serr_on=true` 即可精确回到 v1 轮廓。

- EN: `side_chamfer=0.4` — 45° chamfer on BOTH side faces around the whole outline (2-step stepped, prints identically to a true chamfer at 0.2 layers). Requested by the user for the in-wall claw; applied to the full outline: eases claw insertion, removes scratchy edges, absorbs elephant-foot.
  ZH: `side_chamfer=0.4` —— 两个侧面沿整圈轮廓做 45° 倒角（两级台阶式，0.2 层高下打印效果与真斜面相同）。用户点名要墙内爪两侧倒角；实际做了整圈：便于爪入槽、去除刮手棱边、顺带吃掉打印 elephant-foot（首层挤宽）。
- EN: Claw internal-corner fillets — `fillet_finger_root=0.6`, `fillet_plate_root=0.3` (hotspot 2, Kt 3→≈1.8). Flat seat left for the lip = 2.75−0.6−0.3 = 1.85 mm; assert guards ≥1.6. If the lip measures ≥1.85, shrink the fillets; if the hook rides high at test fit, set `fillet_plate_root=0`.
  ZH: 爪内两角圆角 —— `fillet_finger_root=0.6`、`fillet_plate_root=0.3`（应力点②，Kt 3→≈1.8）。给唇顶留的平座宽 = 2.75−0.6−0.3 = 1.85 mm；assert 保底 ≥1.6。若实测唇厚 ≥1.85 需缩小圆角；试装若坐高，把 `fillet_plate_root=0`。
- EN: Back step rendered as a 45° ramp instead of a square notch (hotspot 4 removed); seating function unchanged.
  ZH: 背面台阶由直角改为 45° 斜坡（消除应力点④）；贴墙功能不变。
- EN: `serr_on=false` by default — serration adds no strength, it *weakens* the tension face (hotspot 3); user judged it unnecessary. Parameter kept for cosmetic restore.
  ZH: `serr_on=false` 默认关闭 —— 锯齿不增加强度，反而*削弱*受拉面（应力点③）；用户判断没有必要。参数保留，想要外观可再开。
- EN: `shank_front_extra=1.4` — shank thickened forward 1.8→3.2 mm below the rail zone (gentle ramp from y=−7.3), blended into the J via `r_in_eff = j_r_in − extra/2` so the J mouth (~10 mm) and tip (~3 mm) stay sensible.
  ZH: `shank_front_extra=1.4` —— 挂条区以下杆身向前加厚 1.8→3.2 mm（自 y=−7.3 缓坡过渡），并通过 `r_in_eff = j_r_in − extra/2` 并入 J 钩，钩口（~10 mm）与钩尖（~3 mm）保持正常。
- EN: Verified same as v1 (docker scad-render): zero warnings; echoes — head depth 7.35 ✓, plate 2.2 ✓, height 40 ✓, shank 3.2, lip seat 1.85, worst-case shank stress ≈0.505 MPa/N.
  ZH: 验证同 v1（docker scad-render）：零 warning；echo —— 总深 7.35 ✓、主板 2.2 ✓、总高 40 ✓、杆身 3.2、唇座 1.85、杆身最坏应力 ≈0.505 MPa/N。
- EN: Updated rating (PETG, ≥4 perimeters): ≈3 kg sustained with NO wall contact assumed (15 MPa @3 kg), ≥5 kg with reliable lower-shank contact (8 MPa @5 kg); short-term peaks ≈2×. Widening `hook_w` to 10 would lift the no-contact rating to ≈5 kg.
  ZH: 更新评级（PETG、≥4 圈壁）：完全不指望墙面接触时持续 ≈3 kg（3 kg 时 15 MPa）；下段可靠贴墙时 ≥5 kg（5 kg 时 8 MPa）；短时峰值约 2 倍。`hook_w` 加到 10 可把无接触评级提到 ≈5 kg。

## v3 Changes（v3 变更，2026-07-09，试打印反馈后）

EN: After the user's first test print and caliper pass on the original. Two features added from measurements, one misreading corrected.
ZH: 用户首次试打印并对原件卡尺复测之后。按实测新增两个特征，纠正一处误读。

- EN: `plate_above` 7.0 → 9.0 (caliper: 8.8 on the original; user chose 9.0). Overall height now ≈42.
  ZH: `plate_above` 7.0 → 9.0（原件实测 8.8；用户定 9.0）。总高变为 ≈42。
- EN: New top cap: `cap_h=0.5`, `cap_back=0.8` → 3.0 total thickness, protruding wall-ward; bears on the panel above the rail.
  ZH: 新增顶部小帽：`cap_h=0.5`、`cap_back=0.8` → 总厚 3.0，向墙凸出；抵在挂条上方墙板上。
- EN: CORRECTED back feature: v1/v2's room-ward step replaced by the wall pad `pad_back=0.8` (3.0 total) from `pad_top_drop=8.0` below the ceiling down into the J (outer arc now tangent to the pad face). This is the designed H contact.
  ZH: 纠正背面特征：v1/v2 的向房间台阶改为抵墙凸台 `pad_back=0.8`（总厚 3.0），自槽顶下方 `pad_top_drop=8.0` 起向下并入 J 钩（外弧改与凸台面相切）。这就是设计好的 H 接触。
- EN: `shank_front_extra` default 1.4 → 0 (the pad IS the original's reinforcement; parameter kept), `j_r_in` 6.0 → 5.5 to keep the J tip ≈3 with the shifted outer arc, `top_slant` removed (superseded by the cap).
  ZH: `shank_front_extra` 默认 1.4 → 0（凸台就是原件自带的加固；参数保留）、`j_r_in` 6.0 → 5.5（外弧后移后保持钩尖 ≈3）、`top_slant` 移除（被小帽取代）。
- EN: Verified (docker scad-render): zero warnings; echoes — cap 3.0 ✓, pad 3.0 ✓, head depth 7.35 ✓, plate 2.2 ✓, height 42, lip seat 1.85, worst-case shank stress ≈0.583 MPa/N (design case with pad contact ≈9 MPa @5 kg, PETG comfortable).
  ZH: 验证（docker scad-render）：零 warning；echo —— 帽厚 3.0 ✓、凸台厚 3.0 ✓、总深 7.35 ✓、主板 2.2 ✓、总高 42、唇座 1.85、杆身最坏应力 ≈0.583 MPa/N（凸台接触的设计工况 5 kg 约 9 MPa，PETG 从容）。
- EN: v3.1 addendum: fit success on the real rail confirmed by user photos; `hook_w` default 8 → 11.9 (user caliper; worst-case shank stress drops to ≈0.392 MPa/N). The mount interface was extracted into the reusable `wallboard-rail-mount` skill; v7 made the repository `.agents/skills/` copy canonical.
  ZH: v3.1 补充：用户照片确认真实挂条试装成功；`hook_w` 默认 8 → 11.9（用户卡尺实测；杆身最坏应力降至 ≈0.392 MPa/N）。安装接口已提炼为可复用的 `wallboard-rail-mount` skill；v7 后由仓库 `.agents/skills/` 副本作为权威版本。

## v4 Changes（v4 变更，2026-07-09，用户提议）

- EN: `arm_gusset=1.5` — a 45° gusset filling the arm-root corner (arm top ↔ plate back), proposed by the user: metal didn't need it, plastic does. Claw-root bending stress drops ≈3× (root section depth 2.2→3.7, Z 9.6→27 mm³ at w=11.9; worst-case root σ @5 kg ≈26→9 MPa) and the 90° corner becomes two 135° corners (Kt ≈2→1.3). Applied to both `hook.scad` and the skill's `rail-mount.scad`.
  ZH: `arm_gusset=1.5` —— 顶桥根部内角（顶桥顶面↔主板背面）填充 45° 斜撑，用户提议：金属不需要、塑料需要。爪根弯曲应力降约 3 倍（根部截面深 2.2→3.7，Z 9.6→27 mm³ @宽 11.9；最坏工况 5 kg 根部 σ ≈26→9 MPa），直角内角变成两个 135° 钝角（Kt ≈2→1.3）。`hook.scad` 与 skill 的 `rail-mount.scad` 同步应用。
- EN: Constraint: the gusset lives inside the rail's slot opening — its top (3.7 above the ceiling) must clear the opening's upper edge (photo-estimated ≈4, unmeasured). Default is conservative; measure the opening to enlarge; `arm_gusset=0` restores the original shape. Echo + assert added.
  ZH: 约束：斜撑位于挂条开槽口内 —— 其顶（槽顶上方 3.7）必须让开槽口上缘（照片估约 4，未实测）。默认值保守；量得槽口更高可调大；`arm_gusset=0` 回到原件形状。已加 echo 与 assert。

## v5 Changes（v5 变更，2026-07-09，用户实测+提议）

- EN: `finger_len` 5.5 → 6.75 — the user calipered the original's claw total (arm + finger) at ≈9.0; with arm_t 2.2 the model's total is 8.95. D6 is now settled.
  ZH: `finger_len` 5.5 → 6.75 —— 用户卡尺实测原件爪部总高（顶桥+爪指）≈9.0；顶桥 2.2 时模型总高 8.95。D6 就此定案。
- EN: `arm_gusset` (v4 straight 1.5) replaced by `arm_gusset_r=5.0` — ONE tangent arc from the plate back face sweeping to the bridge edge, per the user's proposal. Rationale: the finger's F-couple loads the whole arm, not just the root, so full-span reinforcement is the right shape; the arc has zero corners (no Kt at all). Worst-case arm stress @5 kg: mid-arm ≈26 → 8–15 MPa, root region ≈5–9 MPa. `arm_gusset_r=0` restores the original flat arm.
  ZH: `arm_gusset`（v4 直线 1.5）替换为 `arm_gusset_r=5.0` —— 按用户提议，用一条从主板背面扫到桥边缘的相切圆弧。理由：爪指传回的力偶加载整根顶桥而不只是根部，全跨度加强才是正确形状；圆弧完全无角（无应力集中）。5 kg 最坏工况顶桥应力：中段 ≈26 → 8–15 MPa，根部区 ≈5–9 MPa。`arm_gusset_r=0` 回到原件平顶。
- EN: Open check for the next print: the arc rises into the rail interior above the slot opening — the user judges the interior can take it (my earlier ≈4 opening estimate was likely pessimistic); if it fouls or blocks tilt-in, reduce `arm_gusset_r`. Both `hook.scad` and the skill's `rail-mount.scad` updated; renders clean, echoes pass (claw total 8.95 / target 9.0).
  ZH: 下次打印要验证：圆弧伸入槽口上方的挂条内部 —— 用户判断内部放得下（我此前 ≈4 的槽口估计偏保守）；若顶到或妨碍斜插，调小 `arm_gusset_r`。`hook.scad` 与 skill 的 `rail-mount.scad` 已同步；渲染干净、自检通过（爪总高 8.95 / 目标 9.0）。
- EN: v5.1: bridge-edge corner rounded, `arm_edge_r=0.8` — restores the original's outer round (a v1 deviation) and smooths the tilt-in leading edge; the gusset arc auto-clamps to arm span − edge radius (effective 4.35, arc top 6.55 above the ceiling). Both files synced; renders clean.
  ZH: v5.1：桥边缘外角修圆，`arm_edge_r=0.8` —— 恢复原件的外圆角（v1 的一处差异），也顺滑了斜插入槽的先导边；圆弧加强自动收缩到 顶桥跨度 − 圆角半径（有效 4.35，弧顶在槽顶上方 6.55）。双文件同步；渲染干净。

## v5.2 Changes（v5.2 变更，2026-07-09）

- EN: Slanted finger tip: `tip_taper=1.5` replaces the symmetric bottom chamfers — the tip's bottom now rises from the outer point toward the inner face, reproducing the original's chisel point (re-read from the raw photos at the user's prompt; direction: point at the wall side, ramp facing the lip). `tip_chamfer=0.4` retained as a printability blunt at the point. Insertion over the lip gets noticeably easier.
  ZH: 爪尖斜尖：`tip_taper=1.5` 取代原先对称的底部倒角 —— 爪尖底面从外侧尖点向内侧面斜升，复刻原件的凿形尖（应用户提示重读 raw 照片；方向：尖在墙侧、斜面朝唇侧）。保留 `tip_chamfer=0.4` 作为尖点处的打印钝化。翻入上唇会明显更顺。
- EN: Rail provenance documented for publication: Youbang GuaGuaQiang Parallel series — see [mounting-rail](../entities/mounting-rail.md) Product Identity; URL registered in `wiki/sources.md`. Official strip spec 3000×48×11, anodized 6-series aluminum (consistent with the strength review's 6063 assumption).
  ZH: 轨道来源已为公开做好记录：友邦「挂挂墙 · 平行系列」—— 见 [mounting-rail](../entities/mounting-rail.md) 产品身份一节；URL 已登记入 `wiki/sources.md`。官方规格 3000×48×11、六系铝阳极氧化（与强度审查的 6063 假设一致）。
- EN: Both `hook.scad` and the skill's `rail-mount.scad` updated; renders clean, all echoes unchanged.
  ZH: `hook.scad` 与 skill 的 `rail-mount.scad` 已同步；渲染干净，自检不变。
- EN: v5.3 (user request): the tip point itself is now rounded — `tip_r=0.4` tangent arc (outer face ↔ slanted bottom) replaces the flat 45° blunt `tip_chamfer`, completing the all-round edge language.
  ZH: v5.3（用户要求）：尖点本身也改为圆角 —— `tip_r=0.4` 相切圆弧（外侧面 ↔ 斜底面）取代原 45° 平切钝化，全件圆角语言就此统一。

## v6 — Layout Refactor（v6 目录重构，2026-07-09）

EN: At the user's direction the single `hook.scad` became a library + standalone designs, so future accessories never touch the proven code:
ZH: 按用户指示，单文件 `hook.scad` 拆分为「库 + 独立设计文件」，此后新配件不再触碰已验证的代码：

- EN: `lib/rail-mount.scad` — the mount library: fixed params, `rail_mount_pts()`, `rail_accessory()` (extrude + side chamfers, width as an argument), and the `j_hook_body()` helper. No top-level geometry. Byte-identical copy lives in the `wallboard-rail-mount` skill.
  ZH: `lib/rail-mount.scad` —— 安装接口库：固定参数、`rail_mount_pts()`、`rail_accessory()`（挤出+侧倒角，宽度作参数）、`j_hook_body()` 助手。无顶层几何。skill 里有字节一致的副本。
- EN: Historical `hooks/hook-classic.scad` — the fit-validated 17 mm-span hook (former `hook.scad` v5.3; now `accessories/hooks/classic.scad`). The v6 refactor verified geometry-exact: same 5072 triangles, STL volume diff 0.000000 mm³, identical bbox vs the pre-refactor render.
  ZH: 历史路径 `hooks/hook-classic.scad` —— 已验证试装的 17 mm 跨度钩（原 `hook.scad` v5.3；现为 `accessories/hooks/classic.scad`）。v6 重构经验证几何完全一致：三角数同为 5072，STL 体积差 0.000000 mm³，包围盒相同。
- EN: The long-dormant serration option (off since v2) was retired in the refactor; it remains recoverable from git history.
  ZH: 长期停用的锯齿选项（v2 起默认关）在重构中移除；可从 git 历史找回。
- EN: File references above in this page (`hook.scad` and `hooks/`) are historical; the current layout is `lib/` + `accessories/<family>/`.
  ZH: 本页前文提到的 `hook.scad` 与 `hooks/` 为历史名称；现行布局为 `lib/` + `accessories/<family>/`。

## v7 — 2.0 mm Wall-Contact Production Integration（v7 — 2.0 mm 抵墙承压面正式并入，2026-07-10）

EN: The user selected the 2.0 mm reach after the half-width 2.0/2.5 mm [A/B fit pair](hook-classic-wallpad-fit-pair.md). The selected geometry is now part of the shared `rail_mount_pts()` outline rather than a unioned test solid, so every production accessory using the fixed library receives the same full-width pressure face.
ZH: 用户在半宽 2.0/2.5 mm [A/B 试装对照](hook-classic-wallpad-fit-pair.md)后选择了 2.0 mm 凸高。定案几何现已直接并入共享 `rail_mount_pts()` 轮廓，不再作为测试实体做 union（并集）；所有使用固定库的正式配件都会得到同一个全宽承压面。

- EN: `wall_contact_back=2.0`; the flat face is `Y=−16…−21`, 5 mm tall, starting 8 mm below the rail-bottom datum. It adds 1.2 mm beyond the baseline `pad_back=0.8` contour.
  ZH: `wall_contact_back=2.0`；平直接触面位于 `Y=−16…−21`、高 5 mm，从轨道下缘基准下方 8 mm 开始；它在基准 `pad_back=0.8` 轮廓外再增加 1.2 mm。
- EN: `pad_back=0.8` remains the baseline back contour and J-body datum, so J position, span, and the validated rail clip are unchanged. The classic hook's lower ramp auto-clamps to 1.1 mm, preserving 0.2 mm before the J arc; the longer `hook-wide25` uses the full 1.2 mm ramp.
  ZH: `pad_back=0.8` 仍是基准背面轮廓与 J 躯干基准，因此 J 的位置、跨度及已验证的轨道卡扣均不变。经典勾的下过渡自动收为 1.1 mm，在 J 弧前保留 0.2 mm；更长的 `hook-wide25` 使用完整 1.2 mm 过渡。
- EN: `rail_accessory()` now asserts that a custom body starts low enough for the pressure-pad transition and echoes the effective contact dimensions/ramp lengths.
  ZH: `rail_accessory()` 现会 assert（断言）自定义躯干是否为承压块过渡留出足够高度，并 echo（输出）实际接触尺寸与过渡长度。
- EN: Temporary sources `hook-classic-wallpad16.scad`, `hook-classic-wallpad20-fast.scad`, and `hook-classic-wallpad25-fast.scad` were removed after the decision; their wiki pages retain the design history.
  ZH: 定案后已删除临时源码 `hook-classic-wallpad16.scad`、`hook-classic-wallpad20-fast.scad` 与 `hook-classic-wallpad25-fast.scad`；对应 wiki 页面保留设计历史。
- EN: The repository-canonical skill now lives at `.agents/skills/wallboard-rail-mount/`; its library copy is byte-identical to `lib/rail-mount.scad`, and Codex `quick_validate.py` reports `Skill is valid!`.
  ZH: 仓库内权威 skill 现位于 `.agents/skills/wallboard-rail-mount/`；其中的库副本与 `lib/rail-mount.scad` 字节完全一致，Codex `quick_validate.py` 返回 `Skill is valid!`。

### Verification（验证）

- EN: `hook-classic.scad`: `Manifold`, `NoError`, genus 0, 2652 vertices / 5300 facets; contact echo `2.0`, `Y=−16…−21`, ramps `1.2/1.1`, width 11.9.
  ZH: `hook-classic.scad`：`Manifold`、`NoError`、genus 0、2652 vertices / 5300 facets；接触 echo 为 `2.0`、`Y=−16…−21`、过渡 `1.2/1.1`、宽 11.9。
- EN: `hook-wide25.scad`: `Manifold`, `NoError`, genus 0, 2672 vertices / 5340 facets; same contact face, ramps `1.2/1.2`, width 11.9.
  ZH: `hook-wide25.scad`：`Manifold`、`NoError`、genus 0、2672 vertices / 5340 facets；接触面相同、过渡 `1.2/1.2`、宽 11.9。
- EN: The skill example independently renders to the same classic mesh result. Top and isometric views show one continuous profile with no self-intersection.
  ZH: skill 示例可独立渲染，并得到与经典勾相同的网格结果。top 与 isometric（等轴测）视图显示轮廓连续、无自交。

## 2026-07-14 — Accessory Catalog Layout（配件目录重构）

EN: Current entry models are grouped only by families that exist: `accessories/hooks/` contains the three J-hook variants and `accessories/pegs/` contains the keyhole peg. No placeholder families are created. `catalog/accessories.toml` records stable IDs, source paths, output stems, wiki pages, status, and support requirements.
ZH: 现行入口模型只按已经存在的 family（家族）分组：`accessories/hooks/` 保存三款 J 钩，`accessories/pegs/` 保存钥匙孔蘑菇头；不创建占位 family。`catalog/accessories.toml` 记录稳定 ID、源码路径、输出名、wiki 页面、状态与支撑要求。

EN: Rail reference images now live in `raw/rail/`; the keyhole-specific photo lives in `raw/accessories/hook-keyhole9/`; current accessory design pages live in `wiki/accessories/`. The shared interface remains at `lib/rail-mount.scad` and its geometry is unchanged by this path-only refactor.
ZH: 轨道参考图现位于 `raw/rail/`；钥匙孔专属照片位于 `raw/accessories/hook-keyhole9/`；现行配件设计页位于 `wiki/accessories/`。共享接口仍位于 `lib/rail-mount.scad`，本次纯路径重构未改变其几何。

## Open Items（待办）

- EN: D6 (`finger_len`) and D7 (`plate_above`) are settled from caliper measurements; D5 (`arm_t`) remains inferred. A future rail-profile measurement can replace the inference but does not block the validated fit.
  ZH: D6（`finger_len`）与 D7（`plate_above`）已由卡尺实测定案；D5（`arm_t`）仍为推定值。未来若测得轨道截面可替代该推定，但不阻塞当前已验证配合。
- EN: Print and load-test a full-width v7 hook to confirm that the 2.0 mm face preserves complete rail seating and reliably carries the intended lower-wall reaction without excessive preload.
  ZH: 打印并承载测试一只全宽 v7 挂钩，确认 2.0 mm 承压面既不妨碍轨道完全就位，又能在不过度预紧的情况下可靠承担下方墙面反力。
- EN: Future params: J-tip V-notch, corner rounds/fillets, alternative hook-end styles.
  ZH: 未来参数项：钩尖 V 缺口、圆角/内圆角、不同钩端造型。
