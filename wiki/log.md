---
title: "Activity Log"
type: log
status: active
updated: 2026-07-10
---

# Activity Log（活动日志）

EN: Append-only chronological log of all wiki operations. Newest entries at the bottom.
ZH: 所有 wiki 操作的 append-only（只追加）时间顺序 log（日志）。新条目追加到底部。

## [2026-07-09] bootstrap | Initialize LLM Wiki skeleton

- EN: Created `wiki/index.md`, `wiki/log.md`, `wiki/sources.md`, and empty `wiki/topics/`, `wiki/entities/`, `wiki/outputs/` directories.
  ZH: 创建了 `wiki/index.md`、`wiki/log.md`、`wiki/sources.md` 以及空的 `wiki/topics/`、`wiki/entities/`、`wiki/outputs/` 目录。
- EN: Created `AGENTS.md` with the LLM Wiki operating rules as the canonical project schema.
  ZH: 创建了 `AGENTS.md` 记录 LLM Wiki 操作规则，并将其作为项目 canonical schema（权威规范）。
- EN: Existing `raw/assets/` already contains three JPEG source files from a prior session (`hook-full-view.jpg`, `hook-mount-dimensions.jpg`, `hook-installed-on-rail.jpg`). They are NOT registered in `wiki/sources.md` yet — do not register or ingest until the user directs.
  ZH: 现有 `raw/assets/` 已经有 3 个 JPEG 源文件（来自之前的会话）：`hook-full-view.jpg`、`hook-mount-dimensions.jpg`、`hook-installed-on-rail.jpg`。**尚未** 登记到 `wiki/sources.md`；等用户指示再登记 / ingest。

## [2026-07-09] ingest | Rail hook photos: geometry, dimensions, replication constraints

- EN: Registered all three `raw/assets/*.jpg` sources in `wiki/sources.md`; noted that the contents of `hook-installed-on-rail.jpg` and `hook-full-view.jpg` are swapped relative to their filenames (files untouched).
  ZH: 在 `wiki/sources.md` 登记了全部三个 `raw/assets/*.jpg` 来源；注明 `hook-installed-on-rail.jpg` 与 `hook-full-view.jpg` 的内容与文件名互换（文件未动）。
- EN: Created `wiki/entities/rail-hook.md` (extrusion-slice construction claim; full profile; dimension table D1–D14; annotation interpretation: 2.40 finger / 2.75 slot / 7.35 head depth, derived plate ≈2.2 mm), `wiki/entities/mounting-rail.md`, and `wiki/topics/hook-replication-requirements.md` (hard constraints: embedded mounting head exact, no invention; measurement wishlist). Updated `wiki/index.md`.
  ZH: 新建 `wiki/entities/rail-hook.md`（挤出型材切片的构造论断；完整截面；尺寸表 D1–D14；标注解读：爪指 2.40 / 槽 2.75 / 安装头总深 7.35，推导主板 ≈2.2 mm）、`wiki/entities/mounting-rail.md`、`wiki/topics/hook-replication-requirements.md`（硬约束：嵌入安装头精确复刻、不创新；待测清单）。更新了 `wiki/index.md`。
- EN: Review needed: confirm the annotation interpretation (2.75 = slot gap, 7.35 = total depth); measure hook width along the rail and the claw's vertical dimensions before any modeling. Per user instruction, no plan and no OpenSCAD code were produced.
  ZH: 需要 review（审阅）：确认标注解读（2.75 = 槽宽、7.35 = 总深）；建模前实测挂钩宽度与安装爪竖直尺寸。遵用户指示，未做计划、未写 OpenSCAD 代码。

## [2026-07-09] writeback | User confirmed geometry; fixed vs variable scope clarified

- EN: The user reviewed two SVG side-view sketches and confirmed the understanding — annotation mapping (2.40 finger / 2.75 slot / 7.35 head depth) and the claw-over-lip mounting model are settled.
  ZH: 用户审阅两张 SVG 侧视图草图，确认理解无误 —— 标注对应（爪指 2.40 / 槽 2.75 / 总深 7.35）与爪扣上唇的安装方式定案。
- EN: Scope clarified by the user: overall height and the protruding J-hook are variable parts; only the wall-mounting head must be dimensionally exact.
  ZH: 用户明确范围：总高与外伸 J 钩为可变部分；只有挂墙安装头必须尺寸精确。
- EN: Updated `wiki/entities/rail-hook.md` (D2 confidence → high; D9–D12 marked variable / not fit-critical; interpretation confirmed; open questions reprioritized), `wiki/topics/hook-replication-requirements.md` (constraints, status, wishlist split critical vs optional, new Resolved section), and `wiki/index.md`.
  ZH: 更新了 `wiki/entities/rail-hook.md`（D2 置信度提为 high；D9–D12 标为可变/不影响配合；解读已确认；开放问题重排）、`wiki/topics/hook-replication-requirements.md`（约束、状态、待测清单拆分关键/可选、新增 Resolved 小节）、`wiki/index.md`。
- EN: Still open before modeling: measure the mounting-head verticals D5–D7, or accept photo-scale estimates with the finger length erring short.
  ZH: 建模前仍待定：实测安装头竖直尺寸 D5–D7，或接受照片估计值并让爪指长度宁短勿长。

## [2026-07-09] writeback | hook.scad v1 modeled and render-verified

- EN: User green-lit a first OpenSCAD version (body/J rough, parametric for the future). Wrote `hook.scad` (repo root): single-profile polygon + `linear_extrude`, datum at lip-contact plane / slot ceiling; head nominals verbatim (2.40 / 2.75 / 7.35, derived plate 2.2); finger_len defaulted 5.5 (err short); serration and back step included; J from two offset arc centers.
  ZH: 用户放行第一版 OpenSCAD（躯干/J 钩粗略、留参数化）。写了 `hook.scad`（仓库根目录）：单截面 polygon + `linear_extrude`，基准取贴唇面/槽顶；安装头名义尺寸原样（2.40 / 2.75 / 7.35，推导主板 2.2）；爪指长默认 5.5（宁短勿长）；含锯齿与背面台阶；J 钩用双错位圆心构造。
- EN: No local OpenSCAD install; discovered and reused the user's docker toolchain (`openab-openscad-toolchain-base:openscad-nightly-2026.01.19.2` + `scad-render` from `~/work/openab-deploy`). STL + iso/top/front/right PNGs in `out/`; zero warnings; echo checks pass (7.35 / 2.2 / 40). Top view matches the bare-hook photo.
  ZH: 本机未装 OpenSCAD；发现并复用了用户的 docker 工具链（`openab-openscad-toolchain-base:openscad-nightly-2026.01.19.2` + `~/work/openab-deploy` 的 `scad-render`）。`out/` 产出 STL 与 iso/top/front/right PNG；零 warning；echo 自检通过（7.35 / 2.2 / 40）。top 视图与裸钩照片一致。
- EN: Created `wiki/outputs/hook-scad-v1.md`; updated `wiki/index.md` (Outputs) and the requirements page (summary + status). Next: caliper-measure D5–D7, test-print, then adjust params only.
  ZH: 新建 `wiki/outputs/hook-scad-v1.md`；更新 `wiki/index.md`（Outputs）与需求页（摘要 + 状态）。下一步：卡尺实测 D5–D7、试打印，之后只通过参数调整。

## [2026-07-09] query+writeback | Strength & stress-concentration review of v1

- EN: Hand-calc review of hook.scad v1 under hanging load W. Load model: V≈W at slot ceiling, F/H couple (lip-back on finger / wall on lower shank), shank moment bounded 2.3–7.6 W N·mm depending on lower contact. Governing weakness: the 1.8×8 mm shank below the back step (16–53 MPa @3 kg). Other hotspots: sharp claw internal corners (Kt≈3), serration grooves on the tension face, step reentrant corner, J inner fiber (OK).
  ZH: 对 hook.scad v1 做挂载 W 下的手算审查。受力模型：槽顶 V≈W，F/H 力偶（唇背推爪指/墙面顶下段杆身），杆身弯矩随下部接触在 2.3–7.6 W N·mm 之间。决定性弱点：台阶下 1.8×8 mm 杆身（3 kg 时 16–53 MPa）。其余：爪部尖内角（Kt≈3）、受拉面上的锯齿槽、台阶内角、J 内侧（无碍）。
- EN: Rating: v1 as-is PETG ≈1.5–2 kg sustained (no wall contact assumed), 3–4 kg with reliable lower contact; PLA halve + creep. Key insight: the back-face step is structural (decides the H contact). Recommendations: corner fillets, thicken shank 1.8→3.2 below the rail zone, hook_w 8→10, PETG/ASA ⇒ ~5 kg worst-case.
  ZH: 评级：v1 原样 PETG 持续约 1.5–2 kg（不指望墙面接触），下部接触可靠时 3–4 kg；PLA 减半且有蠕变。关键认识：背面台阶是结构性的（决定 H 接触）。建议：内角圆角、挂条区以下杆身 1.8→3.2 加厚、hook_w 8→10、用 PETG/ASA ⇒ 最坏情况也可 ~5 kg。
- EN: Wrote `wiki/outputs/hook-strength-review.md`; updated `wiki/index.md`. No geometry changed yet — review only, per request.
  ZH: 写入 `wiki/outputs/hook-strength-review.md`；更新 `wiki/index.md`。按要求只做审查，尚未改任何几何。

## [2026-07-09] writeback | hook.scad v2: chamfers, fillets, serration off, reinforced shank

- EN: User approved modifications, explicitly asking for side chamfers on the in-wall claw and questioning the serration. Answer recorded: serration adds no strength — it weakens the tension face — so it is now off by default (`serr_on=false`, kept as a cosmetic option).
  ZH: 用户同意修改，点名墙内爪两侧倒角，并质疑锯齿的必要性。结论已记录：锯齿不增加强度 —— 反而削弱受拉面 —— 现默认关闭（`serr_on=false`，保留为外观选项）。
- EN: v2 changes in `hook.scad`: whole-outline 2-step side chamfer 0.4 both faces; claw corner fillets 0.6/0.3 (lip flat seat 1.85, assert ≥1.6); square step → 45° ramp; shank 1.8→3.2 (`shank_front_extra=1.4`) blended into the J (`r_in_eff = j_r_in − extra/2`). Fit surfaces and D1–D3 untouched; all changes revert by params.
  ZH: `hook.scad` v2 变更：整圈两级侧倒角 0.4×双面；爪角圆角 0.6/0.3（唇平座 1.85，assert ≥1.6）；直角台阶改 45° 斜坡；杆身 1.8→3.2（`shank_front_extra=1.4`）并入 J 钩（`r_in_eff = j_r_in − extra/2`）。配合面与 D1–D3 未动；所有变更可参数还原。
- EN: Re-rendered via docker: zero warnings; echoes 7.35 / 2.2 / 40 / shank 3.2 / seat 1.85 / 0.505 MPa/N. Rating now ≈3 kg sustained without wall contact, ≥5 kg with contact (PETG). Updated `wiki/outputs/hook-scad-v1.md` (v2 section), `wiki/outputs/hook-strength-review.md` (status), `wiki/index.md`.
  ZH: docker 重渲：零 warning；echo 7.35 / 2.2 / 40 / 杆身 3.2 / 唇座 1.85 / 0.505 MPa/N。评级：不靠墙接触持续 ≈3 kg，有接触 ≥5 kg（PETG）。更新 `wiki/outputs/hook-scad-v1.md`（v2 小节）、`wiki/outputs/hook-strength-review.md`（状态）、`wiki/index.md`。

## [2026-07-09] ingest+writeback | Test-print feedback: D7=8.8, top cap, wall pad; hook.scad v3

- EN: User printed the first version and re-measured the original (photos shared in chat, not in `raw/`): D7 plate-above-arm = 8.8 (build as 9.0); a top cap 0.5 tall × 3.0 thick (0.8 wall-ward); a lower wall pad also 3.0 thick that braces the wall. Two prior readings superseded: the "slanted top edge" (actually the cap) and the "room-ward back step" (actually the 0.8 wall-ward pad — v1/v2 had the direction inverted).
  ZH: 用户打印初版并对原件复测（照片在对话中，未入 `raw/`）：D7 板顶到顶桥 = 8.8（按 9.0 建模）；顶部小帽高 0.5×厚 3.0（向墙凸 0.8）；下部抵墙凸台厚度同为 3.0。两处旧解读废弃：“顶边斜切”（实为小帽）与“向房间收薄台阶”（实为向墙凸 0.8 的凸台 —— v1/v2 方向建反）。
- EN: Meta-finding: D7 actual 8.8 vs 6.9 photo estimate ⇒ photo verticals foreshortened ≈25%; D5/D6 likely ≈2.7/≈7 (model keeps 2.2/5.5, err short). Wall panel sits ≈0.8 behind the rail face (from cap+pad).
  ZH: 元发现：D7 实测 8.8 对照片估 6.9 ⇒ 照片竖直方向被压缩约 25%；D5/D6 可能约 2.7/约 7（模型保守用 2.2/5.5）。墙板面比挂条面靠后约 0.8（由帽+凸台反推）。
- EN: hook.scad v3: plate_above 9.0; cap_h/cap_back 0.5/0.8; pad_back 0.8 from pad_top_drop 8.0 into the J (outer arc tangent to pad); shank_front_extra default 0; j_r_in 5.5; top_slant removed. Rendered clean; echoes cap 3.0 / pad 3.0 / 7.35 / 2.2 / height 42 / seat 1.85 / 0.583 MPa/N.
  ZH: hook.scad v3：plate_above 9.0；cap_h/cap_back 0.5/0.8；pad_back 0.8 自 pad_top_drop 8.0 起并入 J（外弧与凸台相切）；shank_front_extra 默认 0；j_r_in 5.5；移除 top_slant。渲染干净；echo 帽 3.0 / 凸台 3.0 / 7.35 / 2.2 / 总高 42 / 唇座 1.85 / 0.583 MPa/N。
- EN: Updated `wiki/entities/rail-hook.md` (D7/D13/D15, profile bullets, Superseded section, open questions), `wiki/entities/mounting-rail.md` (0.8 recess, clearances), `wiki/outputs/hook-scad-v1.md` (v3 section), `wiki/outputs/hook-strength-review.md` (v3 status), requirements page (status + wishlist), `wiki/index.md`.
  ZH: 更新 `wiki/entities/rail-hook.md`（D7/D13/D15、截面描述、Superseded 小节、开放问题）、`wiki/entities/mounting-rail.md`（0.8 凹差、空间关系）、`wiki/outputs/hook-scad-v1.md`（v3 小节）、`wiki/outputs/hook-strength-review.md`（v3 状态）、需求页（状态+待测清单）、`wiki/index.md`。

## [2026-07-09] writeback | Fit success; width 11.9; wallboard-rail-mount skill created

- EN: User photos confirm the v3 print seats correctly on the real rail — the mount interface is physically validated. Width calipered at 11.9 (= print height in the flat orientation); `hook_w` default updated 8 → 11.9 (worst-case shank stress improves to ≈0.392 MPa/N). Project re-rendered clean.
  ZH: 用户照片确认 v3 打印件在真实挂条上正确就位 —— 安装接口实物验证通过。宽度卡尺实测 11.9（平放打印时即打印高度）；`hook_w` 默认 8 → 11.9（杆身最坏应力降至 ≈0.392 MPa/N）。项目重渲干净。
- EN: Created the reusable `wallboard-rail-mount` skill: SKILL.md (fixed-vs-flexible contract, dims table with rationale, docker render command, print rules) + `rail-mount.scad` (complete code: FIXED `rail_mount_pts()` outline + `rail_accessory()` extruder with side chamfers + replaceable example J body). Skill's scad render-verified: zero warnings, echoes 7.35 / 2.2 / cap 3.0 / pad 3.0.
  ZH: 创建可复用的 `wallboard-rail-mount` skill：SKILL.md（固定/灵活约定、带理由的尺寸表、docker 渲染命令、打印规则）+ `rail-mount.scad`（完整代码：固定的 `rail_mount_pts()` 轮廓 + 带侧倒角的 `rail_accessory()` 挤出模块 + 可替换的 J 钩示例躯干）。skill 内代码已渲染验证：零 warning，echo 7.35 / 2.2 / 帽 3.0 / 凸台 3.0。
- EN: Updated `wiki/entities/rail-hook.md` (D10 measured, fit-validation evidence), requirements page (status, wishlist), `wiki/outputs/hook-scad-v1.md` (v3.1 addendum), `wiki/index.md` (skill pointer in Outputs).
  ZH: 更新 `wiki/entities/rail-hook.md`（D10 实测、试装验证证据）、需求页（状态、待测清单）、`wiki/outputs/hook-scad-v1.md`（v3.1 补充）、`wiki/index.md`（Outputs 增加 skill 指针）。

## [2026-07-09] writeback | v4: user-proposed 45° arm-root gusset

- EN: User proposal accepted: the arm's flat top is a metal-extrusion artifact; in plastic, a 45° gusset at the arm-root corner strengthens the most-stressed claw region. Verified by hand calc: root section depth 2.2→3.7, stress ≈3× lower, corner Kt ≈2→1.3. `arm_gusset=1.5` added to both `hook.scad` (v4) and the skill's `rail-mount.scad`; SKILL.md table updated (marked as the one tunable mount param, plastic adaptation, not on the original).
  ZH: 采纳用户提议：顶桥平顶是金属挤出的产物；塑料件在顶桥根部内角加 45° 斜撑可强化受力最大的爪根区域。手算验证：根部截面深 2.2→3.7，应力降约 3 倍，内角 Kt ≈2→1.3。`arm_gusset=1.5` 同步加入 `hook.scad`（v4）与 skill 的 `rail-mount.scad`；SKILL.md 表格更新（标注为唯一可调的 mount 参数、塑料适配、原件没有）。
- EN: Constraint recorded: gusset top (3.7) must clear the rail slot opening (est. ≈4, unmeasured) — new open question on `mounting-rail.md`; echo + assert added to both scad files. Both render clean; all echoes pass.
  ZH: 记录约束：斜撑顶（3.7）须让开挂条槽口上缘（估 ≈4，未实测）—— `mounting-rail.md` 新增开放问题；两个 scad 文件加了 echo 与 assert。双文件渲染干净、自检全过。

## [2026-07-09] ingest+writeback | v5: full-span arc gusset (user), finger length measured

- EN: User measurement: claw total (arm + finger) ≈ 9.0 on the original → `finger_len` 5.5 → 6.75 (model total 8.95); D6 settled, D5 bounded to ≈2.2–2.25 by the split (≈2.7 suspicion retracted). User proposal accepted: gusset enlarged to the bridge edge as ONE tangent arc (`arm_gusset_r=5.0`, replaces v4's straight 1.5) — analysis showed the finger's F-couple loads the whole arm, so full-span reinforcement is the right shape; arc = cornerless. Worst-case @5 kg: mid-arm ≈26 → 8–15 MPa, root ≈5–9.
  ZH: 用户实测：原件爪部总高（顶桥+爪指）≈9.0 → `finger_len` 5.5 → 6.75（模型总高 8.95）；D6 定案，D5 被拆分约束到 ≈2.2–2.25（≈2.7 猜测撤回）。采纳用户提议：加强件放大到桥边缘、改为一条相切圆弧（`arm_gusset_r=5.0`，取代 v4 直线 1.5）—— 分析表明爪指力偶加载整根顶桥，全跨加强才是正确形状；圆弧无任何棱角。5 kg 最坏工况：顶桥中段 ≈26 → 8–15 MPa、根部 ≈5–9。
- EN: Open check: the arc rises 7.2 above the ceiling inside the rail; the user judges the interior headroom sufficient (my ≈4 opening estimate likely pessimistic) — next test fit settles it, `arm_gusset_r` is the dial. Applied to `hook.scad` (v5) + skill `rail-mount.scad` + SKILL.md table; both render clean (claw total echo 8.95 / target 9.0). Updated `rail-hook.md` (D6 row, open questions), `mounting-rail.md` (headroom note), `hook-scad-v1.md` (v5), `hook-strength-review.md` (v5), requirements wishlist.
  ZH: 待验证：圆弧在挂条内部升到槽顶上方 7.2；用户判断内部净空足够（我 ≈4 的槽口估计偏保守）—— 下次试装定案，旋钮是 `arm_gusset_r`。已应用于 `hook.scad`（v5）+ skill `rail-mount.scad` + SKILL.md 表格；双文件渲染干净（爪总高 echo 8.95 / 目标 9.0）。更新 `rail-hook.md`（D6 行、开放问题）、`mounting-rail.md`（净空备注）、`hook-scad-v1.md`（v5）、`hook-strength-review.md`（v5）、需求页待测清单。

## [2026-07-09] writeback | v5.1: bridge-edge corner rounded (user request)

- EN: Added `arm_edge_r=0.8` — rounds the claw's outer corner at the bridge edge, restoring the original's r≈0.8 round (a v1 deviation) and smoothing the tilt-in leading edge. The gusset arc auto-clamps to arm span − edge radius (effective 4.35; arc top 6.55 above the ceiling). Applied to `hook.scad` + skill `rail-mount.scad` + SKILL.md table; both render clean, all echoes unchanged.
  ZH: 新增 `arm_edge_r=0.8` —— 桥边缘外角修圆，恢复原件 r≈0.8 的外圆角（v1 的一处差异），并顺滑斜插入槽的先导边。圆弧加强自动收缩到 顶桥跨度 − 圆角半径（有效 4.35；弧顶在槽顶上方 6.55）。已应用于 `hook.scad` + skill `rail-mount.scad` + SKILL.md 表格；双文件渲染干净，自检不变。

## [2026-07-09] ingest+writeback | Rail provenance (Youbang Parallel series); slanted finger tip (v5.2)

- EN: Rail identified by the user and confirmed via the official page: Youbang wallboard (友邦墙板) GuaGuaQiang (挂挂墙) Parallel series (平行系列), <https://www.chinayoubang.com/productfamily/detail/195.html>. Official strip spec 3000×48×11 mm, anodized 6-series aluminum (validates the strength review's 6063 assumption); slot dims not published. Added Product Identity to `mounting-rail.md`; URL registered in `sources.md` — cite when publishing.
  ZH: 用户指认并经官网确认轨道来源：友邦墙板「挂挂墙 · 平行系列」，<https://www.chinayoubang.com/productfamily/detail/195.html>。官方规格 功能条 3000×48×11 mm、原生六系铝阳极氧化（印证强度审查的 6063 假设）；槽口尺寸未公布。`mounting-rail.md` 新增产品身份小节；URL 登记入 `sources.md` —— 公开时引用。
- EN: Re-read the raw photos at the user's prompt: the finger tip is a slanted chisel point (lowest at the outer face, bottom rising ≈1.5 toward the lip side) — an insertion ramp. v5.2: `tip_taper=1.5` replaces the symmetric tip chamfers in `hook.scad` + skill `rail-mount.scad` (+SKILL.md); D16 added to `rail-hook.md`; profile bullet refined. Renders clean, echoes unchanged.
  ZH: 应用户提示重读 raw 照片：爪尖是斜凿尖（外侧最低，底面向唇侧斜升约 1.5）—— 入轨导向斜面。v5.2：`tip_taper=1.5` 取代对称倒角，`hook.scad` + skill `rail-mount.scad`（+SKILL.md）同步；`rail-hook.md` 新增 D16、修订截面描述。渲染干净，自检不变。
- EN: v5.3 (user request): tip point rounded — `tip_r=0.4` tangent arc replaces the flat blunt (`tip_chamfer` removed). Both files + SKILL.md synced; renders clean.
  ZH: v5.3（用户要求）：尖点改圆角 —— `tip_r=0.4` 相切圆弧取代平切钝化（移除 `tip_chamfer`）。双文件 + SKILL.md 同步；渲染干净。

## [2026-07-09] refactor | Library + standalone designs (user direction)

- EN: `hook.scad` split into `lib/rail-mount.scad` (mount library: fixed params + `rail_mount_pts()` + `rail_accessory()` + `j_hook_body()` helper, no top-level geometry) and `hooks/hook-classic.scad` (the fit-validated 17 mm design). Future accessories are standalone .scad files that include the lib — the proven mount code is never edited again.
  ZH: `hook.scad` 拆分为 `lib/rail-mount.scad`（安装库：固定参数 + `rail_mount_pts()` + `rail_accessory()` + `j_hook_body()` 助手，无顶层几何）与 `hooks/hook-classic.scad`（已验证试装的 17 mm 设计）。以后的配件都是独立 .scad 引用该库 —— 已验证的安装代码不再被编辑。
- EN: Refactor verified geometry-exact by STL comparison: classic vs pre-refactor baseline — same 5072 triangles, volume diff 0.000000 mm³, identical bbox. Serration option retired (recoverable via git). Skill updated to the same two-file structure (`rail-mount.scad` lib byte-identical + `example-j-hook.scad`); SKILL.md workflow rewritten.
  ZH: 重构经 STL 对比验证几何完全一致：classic 对重构前基线 —— 三角数同 5072、体积差 0.000000 mm³、包围盒相同。锯齿选项退役（git 可找回）。skill 同步为同样的双文件结构（`rail-mount.scad` 库字节一致 + `example-j-hook.scad`）；SKILL.md 用法重写。

## [2026-07-09] writeback | hook-wide25: 25 mm span, plastic-sized sections

- EN: User: the original's J spans 25 mm outer (print of the replica measures 16.7 ≈ the model's 17) and a plastic copy cannot simply be scaled up. Confirmed by the math: at 25 mm span the load line moves to x≈11.7, worst-case shank moment ≈505 N·mm @5 kg — 30 MPa at the original's 3.0 thickness (PETG NG), 13 MPa at 4.4 (`shank_front_extra=1.4`) ✓, ~4–5 MPa with the wall pad engaged.
  ZH: 用户指出：原版 J 外缘跨度 25 mm（复刻打印件量得 16.7 ≈ 模型的 17），塑料不能简单放大。计算证实：25 mm 跨度下载荷线移到 x≈11.7，5 kg 最坏杆身弯矩 ≈505 N·mm —— 按原版 3.0 厚为 30 MPa（PETG 不行），4.4 厚（`shank_front_extra=1.4`）为 13 MPa ✓，凸台贴墙时 ~4–5 MPa。
- EN: New standalone design `hooks/hook-wide25.scad` (j_r_out 12.5, j_r_in 9.3, drop 24; J wall 4.6 bottom / 3.2 tip; mouth ≈17; height 47.7; ~4.4 g). Rendered clean; echoes span 25 / shank 4.4; bbox 29.35 checks out exactly. Sizing documented in `wiki/outputs/hook-wide25.md`; `wiki/index.md` updated.
  ZH: 新独立设计 `hooks/hook-wide25.scad`（j_r_out 12.5、j_r_in 9.3、drop 24；J 壁底 4.6/尖 3.2；钩口 ≈17；总高 47.7；约 4.4 g）。渲染零 warning；echo 跨度 25 / 杆身 4.4；包围盒 29.35 精确对上。计算写入 `wiki/outputs/hook-wide25.md`；`wiki/index.md` 已更新。

## [2026-07-09] writeback | J free-end domed (user request, CF/GF-friendly)

- EN: `j_hook_body()` gains `tip_round=true` (default): the J's free end is now a semicircular dome tangent-capping the outer/inner arcs, replacing the flat cut with two corners. Motivation from the user: fiber-filled filaments (CF/GF) leave prickly fiber ends at sharp corners; a dome is also kinder to fabrics. Span/height unchanged (the cap bulges along the tip direction, not outward). Both designs + skill example inherit automatically; SKILL.md usage section rewritten for the lib+designs layout at the same time. All three render clean.
  ZH: `j_hook_body()` 新增 `tip_round=true`（默认）：J 钩自由端改为与内外弧相切的半圆头，取代带两个尖角的平切口。动机来自用户：碳纤/玻纤（CF/GF）料在尖角处有扎手的纤维茬，圆头也不勾织物。跨度/总高不变（圆头沿钩尖方向鼓出，不向外扩）。两个设计与 skill 示例自动继承；同时把 SKILL.md 用法一节改写为「库+设计」新布局。三个文件渲染全部干净。

## [2026-07-09] writeback | Git repository initialized; artifact policy

- EN: `git init` (branch main) at the user's request; initial commit contains the OpenSCAD model, `wiki/`, `raw/`, and `AGENTS.md`. Policy decided: `wiki/` is always committed (it is the documentation and decision record); `out/` is gitignored — every artifact there regenerates from the model via the docker `scad-render` command. For public sharing, distribute STLs via releases (or a deliberate snapshot dir), not by tracking `out/`; review `raw/` home photos before publishing.
  ZH: 应用户要求 `git init`（main 分支）；初始提交包含 OpenSCAD 模型、`wiki/`、`raw/` 与 `AGENTS.md`。策略定案：`wiki/` 永远入库（它就是文档与决策记录）；`out/` 进 gitignore —— 其中所有产物都可由模型经 docker `scad-render` 一键重渲。若公开分发，STL 走 release（或刻意的快照目录），不跟踪 `out/`；公开前自查 `raw/` 的家中照片。

## [2026-07-10] writeback | Route LLM Wiki operations through the skill

- EN: Updated `AGENTS.md` to require loading and following the `llm-wiki-bilingual` skill before every LLM Wiki bootstrap, ingest, query, writeback, or lint operation. Clarified that `AGENTS.md` remains the canonical project-specific schema while the skill supplies the reusable workflow.
  ZH: 更新 `AGENTS.md`，要求每次执行 LLM Wiki 的 bootstrap（初始化）、ingest（摄入）、query（查询）、writeback（回写）或 lint（检查）前，先加载并遵循 `llm-wiki-bilingual` skill。明确 `AGENTS.md` 仍是项目专属 schema（规范）的权威来源，skill 负责提供可复用工作流。
- EN: No raw sources, wiki knowledge pages, or OpenSCAD geometry changed; no review is needed.
  ZH: 未修改 raw source（原始来源）、wiki 知识页或 OpenSCAD 几何；无需 review（审阅）。

## [2026-07-10] ingest+writeback | Classic hook wall-pressure pad print test

- EN: User supplied a WeChat installation image and estimated the lower wallboard ≈1.6 mm behind the rail contact plane (image remains in chat, not under `raw/`). This revises the earlier uniform ≈0.8 mm inference: the classic `pad_back=0.8` may leave ≈0.8 mm clearance, so contact-dependent strength claims are now explicitly conditional.
  ZH: 用户提供 WeChat 安装图片，并估计轨道接触基准面到下方墙板约后退 1.6 mm（图片仍在聊天中，未存入 `raw/`）。这修订了此前统一约 0.8 mm 的推论：经典版 `pad_back=0.8` 可能仍留约 0.8 mm 空隙，因此依赖墙面接触的强度结论现明确标为有条件成立。
- EN: Added `hooks/hook-classic-wallpad16.scad`, a separate copy-derived 17 mm classic test variant; the validated library and `hook-classic.scad` remain untouched. Local pad geometry: total X=−1.6; 5 mm flat face at Y=−16…−21; top starts 8 mm below the estimated rail lower edge; 0.8 mm 1:1 ramps.
  ZH: 新增 `hooks/hook-classic-wallpad16.scad`，作为独立派生的 17 mm 经典小钩测试版；已验证的库与 `hook-classic.scad` 均未修改。局部承压块几何：总凸高 X=−1.6；Y=−16…−21 为 5 mm 平直面；顶端在估计轨道下缘下方 8 mm；上下为 0.8 mm 的 1:1 斜坡。
- EN: Docker render passed with no warnings/assertions; STL is one manifold (`NoError`, genus 0, 2674 vertices / 5344 facets). Added `wiki/outputs/hook-classic-wallpad16.md`; updated `wiki/index.md`, `wiki/entities/mounting-rail.md`, and `wiki/outputs/hook-strength-review.md`. Real print/fit validation is pending; no commit was made.
  ZH: Docker 渲染零 warning/零 assert；STL 为单一 manifold（`NoError`、genus 0、2674 vertices / 5344 facets）。新增 `wiki/outputs/hook-classic-wallpad16.md`；更新 `wiki/index.md`、`wiki/entities/mounting-rail.md` 与 `wiki/outputs/hook-strength-review.md`。等待实物打印/试装验证；未 commit。

## [2026-07-10] writeback | 2.5 mm half-width fast fit probe

- EN: Before printing the 1.6 mm candidate, the user reported that a caliper probe showed 1.6 mm was conservative and requested a 2.5 mm trial with width halved for speed. Added `hooks/hook-classic-wallpad25-fast.scad`: `contact_back=2.5`, contact face y=−16…−21 (5 mm), `part_w=5.95`.
  ZH: 在打印 1.6 mm 候选版之前，用户反馈游标卡尺探测表明 1.6 mm 偏保守，并要求试做 2.5 mm、宽度减半以加快打印。新增 `hooks/hook-classic-wallpad25-fast.scad`：`contact_back=2.5`、接触面 y=−16…−21（5 mm）、`part_w=5.95`。
- EN: A 1:1 lower ramp would enter the J arc at the larger reach, so the top/bottom transitions are 1.7/1.1 mm; the bottom retains 0.2 mm to the J datum. Docker render passed with zero warnings/assertions; STL is one manifold (`NoError`, genus 0, 2674 vertices / 5344 facets).
  ZH: 凸高增大后，若底部继续使用 1:1 斜坡会进入 J 弧，因此上下过渡分别为 1.7/1.1 mm；底部保留 0.2 mm 到 J 基准。Docker 渲染零 warning/零 assert；STL 为单一 manifold（`NoError`、genus 0、2674 vertices / 5344 facets）。
- EN: Added `wiki/outputs/hook-classic-wallpad25-fast.md`; marked the unprinted wallpad16 page superseded; updated the index, rail observation, and contact-dependent strength note. Fit test only, not load test; no commit was made.
  ZH: 新增 `wiki/outputs/hook-classic-wallpad25-fast.md`；把尚未打印的 wallpad16 页面标为 superseded（已替代）；更新索引、轨道观察与依赖接触的强度说明。仅用于试装，不用于承载测试；未 commit。

## [2026-07-10] writeback | Add matching 2.0 mm A/B specimen

- EN: At the user's request, added `hooks/hook-classic-wallpad20-fast.scad` so 2.0 and 2.5 mm reaches can print together. It matches the 2.5 specimen in mounting interface, 17 mm J profile, y=−16…−21 contact face, 5 mm face height, and half width 5.95; only reach (and derived top ramp) differs.
  ZH: 应用户要求新增 `hooks/hook-classic-wallpad20-fast.scad`，让 2.0 与 2.5 mm 两种凸高可同批打印。它与 2.5 样件的安装接口、17 mm J 轮廓、y=−16…−21 接触面、5 mm 接触高度及 5.95 半宽完全一致；只有凸高（及其派生的顶部斜坡）不同。
- EN: 2.0 render passed with zero warnings/assertions; echo X=−2 / Y=−16…−21 / ramps 1.2/1.1 / width 5.95; STL is one manifold (`NoError`, genus 0, 2674 vertices / 5344 facets). Added `wiki/outputs/hook-classic-wallpad-fit-pair.md` and updated index/strength notes. Fit tests only; no commit was made.
  ZH: 2.0 版渲染零 warning、零 assert；echo 为 X=−2 / Y=−16…−21 / 斜坡 1.2/1.1 / 宽度 5.95；STL 为单一 manifold（`NoError`、genus 0、2674 vertices / 5344 facets）。新增 `wiki/outputs/hook-classic-wallpad-fit-pair.md`，并更新索引/强度说明。仅用于试装；未 commit。

## [2026-07-10] refactor | Promote 2.0 mm wall contact into production

- EN: The user selected the 2.0 mm specimen from the 2.0/2.5 A/B pair. Integrated its `X=−2.0`, `Y=−16…−21`, 5 mm pressure face directly into `lib/rail-mount.scad`; retained `pad_back=0.8` as the J/body datum and added an adaptive lower ramp plus body-clearance assertions.
  ZH: 用户从 2.0/2.5 A/B 对照组中选择了 2.0 mm 样件。已把其 `X=−2.0`、`Y=−16…−21`、高 5 mm 的承压面直接并入 `lib/rail-mount.scad`；保留 `pad_back=0.8` 作为 J/躯干基准，并新增自适应下过渡与躯干净空 assert（断言）。
- EN: Added the repository-canonical `.agents/skills/wallboard-rail-mount/` workflow, byte-identical library copy, and runnable example; updated `AGENTS.md` and validated the skill with Codex `quick_validate.py`. Removed all three temporary wall-pad test `.scad` files while retaining their superseded wiki decision records.
  ZH: 新增仓库内权威的 `.agents/skills/wallboard-rail-mount/` 工作流、字节一致的库副本与可运行示例；更新 `AGENTS.md`，并通过 Codex `quick_validate.py` 验证 skill。三份临时抵墙块测试 `.scad` 文件均已删除，其已废弃的 wiki 决策记录予以保留。
- EN: Docker renders passed for `hook-classic`, `hook-wide25`, and the skill example: all are manifold `NoError`, genus 0. Classic contact ramps are 1.2/1.1; wide ramps are 1.2/1.2. A full-width physical print/load check remains open before treating contact-dependent load ratings as validated.
  ZH: `hook-classic`、`hook-wide25` 与 skill 示例的 Docker 渲染均通过：全部为 manifold（流形）`NoError`、genus 0。经典勾接触过渡为 1.2/1.1，宽勾为 1.2/1.2。在把依赖接触的承载评级视为已验证前，仍需完成全宽实物打印/承载检查。

## [2026-07-13] writeback | Prepare public project documentation

- EN: Added `README.md`, `README.zh_CN.md`, and `LICENSE` to prepare the project for public MIT distribution. The two READMEs describe the fixed rail interface, current classic/wide hook variants, rendering, print safety, extension contract, and the remaining full-width v7 physical validation.
  ZH: 新增 `README.md`、`README.zh_CN.md` 与 `LICENSE`，为项目按 MIT 公开发布做准备。两份 README 说明固定轨道接口、当前经典/宽勾变体、渲染方式、打印安全、扩展约定，以及 v7 全宽实物验证仍未完成的状态。
- EN: Reviewed the tracked reference images for public-readiness; they show the rail and hook only, with no visible personal identifiers. Corrected the stale index note so D6/D7 are recorded as measured and only D5 remains inferred.
  ZH: 已审阅受版本控制的参考图是否适合公开；图片只展示轨道与挂钩，没有可见个人身份信息。修正索引中的过时说明：D6/D7 已标记为实测，只有 D5 仍为推定值。
- EN: Proposed public repository name: `wallboard-rail-hooks`; the local `gh` session for `tomcatzh` is authenticated and the initial remote publication is ready to proceed.
  ZH: 拟定公开仓库名为 `wallboard-rail-hooks`；本地 `gh` 会话已认证 `tomcatzh`，可继续进行首次远端发布。

## [2026-07-13] source-update | Publish GitHub repository

- EN: Created the public GitHub repository [tomcatzh/wallboard-rail-hooks](https://github.com/tomcatzh/wallboard-rail-hooks) and pushed the complete local `main` history. The branch now tracks `origin/main` over HTTPS.
  ZH: 创建公开 GitHub 仓库 [tomcatzh/wallboard-rail-hooks](https://github.com/tomcatzh/wallboard-rail-hooks)，并推送完整本地 `main` 历史。该分支现通过 HTTPS 跟踪 `origin/main`。
- EN: The public repository includes the English/Chinese READMEs, MIT License, OpenSCAD models, reusable project skill, bilingual wiki, and reviewed reference photos. Generated `out/` artifacts remain excluded and can be reproduced locally.
  ZH: 公开仓库包含英文/中文 README、MIT License、OpenSCAD 模型、可复用项目 skill、双语 wiki 与已审阅的参考照片。生成的 `out/` 产物仍被排除在版本控制外，可在本地重新生成。

## [2026-07-13] refactor | Clean public repository identity

- EN: Removed the obsolete root compatibility pointer, the agent-specific local-ignore entry, and legacy skill-path references. `AGENTS.md` is now the sole canonical project entry point, and `.agents/skills/wallboard-rail-mount/` is the sole repository skill location.
  ZH: 删除已废弃的根目录 compatibility pointer（兼容指针）、agent-specific local-ignore entry（智能体专用本地忽略项）与旧 skill 路径引用。`AGENTS.md` 现为唯一 canonical project entry point（项目权威入口），`.agents/skills/wallboard-rail-mount/` 是仓库内唯一 skill 位置。
- EN: Rewrote all ten commits reachable from public `main` and force-pushed the cleaned branch at the user's request. Commit structure and `Tomcat <i@zxf.io>` author/committer identity were preserved; reachable paths, blobs, and commit messages were scanned before publication.
  ZH: 应用户要求重写 public `main` 可达的全部十个 commit（提交），并 force-push（强制推送）清理后的分支。提交结构与 `Tomcat <i@zxf.io>` author/committer（作者/提交者）身份保持不变；发布前已扫描全部可达路径、blob（对象内容）与 commit message（提交信息）。

## [2026-07-13] source-update | Recreate public repository after stale contributor cache

- EN: After the complete history rewrite, GitHub's repository landing page continued to serve a stale contributor fragment even though the REST contributor API and a fresh mirror clone were clean. Deleted repository ID `1298828857` and recreated the same public URL as repository ID `1299164315`.
  ZH: 完整重写历史后，尽管 REST contributor API（贡献者接口）与全新 mirror clone（镜像克隆）均已干净，GitHub 仓库首页仍继续返回 stale contributor fragment（过期贡献者片段）。因此删除 repository ID `1298828857`，并以 repository ID `1299164315` 重建相同 public URL（公开地址）。
- EN: Restored the repository description and settings, then pushed the clean `main` history. The public contributor fragment and an independent Chromium page load both show `Contributors 1` with only `tomcatzh`; reachable paths, blobs, and commit messages remain clean.
  ZH: 已恢复仓库 description（描述）与设置，并推送干净的 `main` 历史。公开 contributor fragment 与独立 Chromium 页面加载均显示 `Contributors 1`，且只有 `tomcatzh`；全部可达路径、blob 与 commit message 仍保持干净。

## [2026-07-14] writeback | hook-round6: centered Ø6 mm round-rod J hook

- EN: Added `hooks/hook-round6.scad`, a user-requested 25 mm-span experiment that preserves the validated mount and 2.0 mm pressure face, then blends the 11.9 mm-wide body into a centered unthreaded Ø6 mm round J with a spherical free end. The broad root remains as an intentional load-spreading transition.
  ZH: 新增 `hooks/hook-round6.scad`：按用户要求尝试 25 mm 跨度版本，保留已验证安装接口与 2.0 mm 承压面，再把 11.9 mm 宽主体过渡为居中的无螺纹 Ø6 mm 圆杆 J 钩，并用球体形成自由端圆头。宽根部作为有意保留的传力过渡。
- EN: Docker render passed with no warnings/assertions; the mesh is one manifold `NoError`, genus 0, 4424 vertices / 8844 facets. Echoes confirm rod 6, span 25, height 47.7, support gap 2.95, and unchanged fixed-interface values. Regression renders for both existing hooks and the skill example passed; the two library copies remain byte-identical.
  ZH: Docker 渲染零 warning、零 assertion；网格为单一 manifold `NoError`、genus 0、4424 vertices / 8844 facets。echo 确认圆杆 6、跨度 25、总高 47.7、支撑空隙 2.95，固定接口数值不变。两款现有挂钩与 skill 示例回归通过；两份库继续字节一致。
- EN: A first-order section check gives `Z≈21.2 mm³`, about 55% of `hook-wide25`'s reinforced shank and about 24 MPa at the prior 5 kg no-contact moment. The 5 kg assumption is explicitly not transferred; physical print, support removal, seating, and progressive light-load tests remain open. Updated both READMEs, `wiki/outputs/hook-round6.md`, and `wiki/index.md`.
  ZH: 一级截面检查得到 `Z≈21.2 mm³`，约为 `hook-wide25` 加强杆身的 55%；套用此前 5 kg 无接触弯矩时约为 24 MPa。明确不沿用 5 kg 假设；仍待实物打印、拆支撑、就位与逐级轻载测试。已更新两份 README、`wiki/outputs/hook-round6.md` 与 `wiki/index.md`。

## [2026-07-14] ingest+writeback | hook-keyhole9 short mushroom peg

- EN: Ingested the user-provided keyhole-plate photo unchanged as `raw/assets/keyhole-hanger-reference.jpg`; the supplied opening measurements are approximately 9.5/4.0 mm. Added `hooks/hook-keyhole9.scad` with the selected Ø9.0 head, Ø3.8 capture neck, and exact 8.0 mm projection while preserving the validated rail interface and 2.0 mm pressure face.
  ZH: 将用户提供的钥匙孔挂片照片原样 ingest（摄入）为 `raw/assets/keyhole-hanger-reference.jpg`；用户给出的开口尺寸约为 9.5/4.0 mm。新增 `hooks/hook-keyhole9.scad`，采用选定的 Ø9.0 头、Ø3.8 捕获颈与严格 8.0 mm 凸出，同时保留已验证 rail interface（轨道接口）和 2.0 mm 承压面。
- EN: Limited the Ø3.8 section to a 3.0 mm capture length, then tapered it into a Ø7 × 1.4 mm root. The 2.4 mm head keeps a flat rear shoulder and a 0.8 mm rounded front. First-order neck math is `Z≈5.39 mm³` and ≈27.3 MPa at 5 kg before margins, so no load rating is assigned.
  ZH: 将 Ø3.8 细段限制为 3.0 mm 捕获长度，再通过锥段并入 Ø7 × 1.4 mm 根部。2.4 mm 厚头部保留平直后肩与 0.8 mm 圆前端。细颈一级计算为 `Z≈5.39 mm³`，5 kg 时未计余量约 27.3 MPa，因此不赋予承载评级。
- EN: Docker render passed with no warnings/assertions; the mesh is one manifold `NoError`, genus 0, 2348 vertices / 4692 facets. All existing accessory and skill-example regressions passed; library copies remain byte-identical. Updated `wiki/sources.md`, `wiki/outputs/hook-keyhole9.md`, `wiki/index.md`, and both READMEs. Physical fit and progressive light-load testing remain open.
  ZH: Docker 渲染零 warning、零 assertion；网格为单一 manifold `NoError`、genus 0、2348 vertices / 4692 facets。全部现有配件与 skill 示例回归通过；库副本保持字节一致。已更新 `wiki/sources.md`、`wiki/outputs/hook-keyhole9.md`、`wiki/index.md` 与两份 README。仍待实物配合与逐级轻载测试。

## [2026-07-14] writeback | compact hook-keyhole9 vertical envelope

- EN: Moved the mushroom-peg axis upward from `Y=-23` to `Y=-19` and shortened the lower body to end at `Y=-23.5`, exactly aligned with the Ø9 head envelope. The overall vertical envelope is now 34.7 mm, 4.0 mm shorter than the initial version, while the Ø9 head, Ø3.8 capture neck, 8.0 mm projection, Ø7 root, rail claw, and 2.0 mm pressure face remain unchanged.
  ZH: 将蘑菇头轴线由 `Y=-23` 上移至 `Y=-19`，并将下部主体缩短到 `Y=-23.5`，与 Ø9 圆头包络精确对齐。整体竖向包络现为 34.7 mm，比初版缩短 4.0 mm；Ø9 头、Ø3.8 捕获颈、8.0 mm 凸出、Ø7 根部、导轨卡爪与 2.0 mm 承压面均保持不变。
- EN: The revised STL passed with no warnings/assertions and is one manifold `NoError`, genus 0 mesh with 2344 vertices / 4684 facets. Regression renders for the classic, wide25, round6, and skill-example models also passed. Physical clearance between the mounted keyhole plate and the rail remains to be checked on the first print.
  ZH: 修订后的 STL 零 warning、零 assertion，并为单一 manifold（流形）`NoError`、genus 0 网格，含 2344 vertices / 4684 facets。经典款、wide25、round6 与 skill 示例的回归渲染也全部通过。首次打印仍需实测挂片装入后与导轨之间的间隙。

## [2026-07-14] writeback | impact-scoped render validation

- EN: Revised `.agents/skills/wallboard-rail-mount/SKILL.md` so validation follows the changed dependency surface: documentation-only work does not render, an accessory-body change renders only that accessory, and only shared interface/helper changes trigger the full production and skill-example regression.
  ZH: 修订 `.agents/skills/wallboard-rail-mount/SKILL.md`，使验证范围跟随 changed dependency surface（变更依赖面）：仅文档工作不渲染，配件主体变化只渲染该配件，只有共享接口/helper（辅助模块）变化才触发全部正式模型与 skill 示例回归。
- EN: Added `wiki/topics/render-validation-strategy.md` and required successful render output to remain concise, with detailed echo/render logs shown only for failures or unexpected differences. This replaces the prior unqualified minimum-render wording.
  ZH: 新增 `wiki/topics/render-validation-strategy.md`，并要求成功渲染只保留简洁结果；仅在失败或出现意外差异时展开 echo/render 详细日志。该规则取代此前未限定适用范围的最小渲染措辞。
