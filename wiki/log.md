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

## [2026-07-14] refactor | family-based accessory catalog layout

- EN: Replaced the flat `hooks/` directory with only the two families that currently exist: `accessories/hooks/` for the three J-hook variants and `accessories/pegs/` for the keyhole peg. Did not create placeholder `holders/`, `shelves/`, `clips/`, `lib/geometry/`, or `scripts/` directories.
  ZH: 将扁平 `hooks/` 目录替换为当前真实存在的两个 family（家族）：`accessories/hooks/` 保存三款 J 钩，`accessories/pegs/` 保存钥匙孔蘑菇头。未创建占位的 `holders/`、`shelves/`、`clips/`、`lib/geometry/` 或 `scripts/` 目录。
- EN: Added `catalog/accessories.toml`; grouped rail references under `raw/rail/`, the keyhole reference under `raw/accessories/hook-keyhole9/`, and current per-accessory pages under `wiki/accessories/`. Updated includes and all current links while preserving historical paths in the append-only log and version history where context requires them.
  ZH: 新增 `catalog/accessories.toml`；将轨道参考资料归入 `raw/rail/`，钥匙孔参考资料归入 `raw/accessories/hook-keyhole9/`，现行配件页面归入 `wiki/accessories/`。已更新 include（引用）与全部现行链接，同时在只追加日志和版本史需要上下文的位置保留历史路径。
- EN: This is a path-only refactor: `lib/rail-mount.scad` and accessory geometry remain unchanged. Validation therefore checks include resolution and catalog/link integrity rather than rerendering unrelated meshes.
  ZH: 本次为纯路径重构：`lib/rail-mount.scad` 与配件几何均未变化。因此验证 include 解析、catalog 与链接完整性，不重新渲染无关网格。

## [2026-07-14] ingest+writeback | frame-ribba22 recessed-back saddle

- EN: Ingested three user photos unchanged under `raw/accessories/frame-ribba22/`. They identify an old IKEA RIBBA `18288` frame, show its flat recessed hardboard back, and document the original straight hook currently used; the user supplied the governing 22 mm recess measurement. Current official IKEA RIBBA instructions are registered as series context only, not as proof of this 1999 variant's dimensions.
  ZH: 将用户提供的三张照片原样 ingest（摄入）到 `raw/accessories/frame-ribba22/`。照片识别出旧款 IKEA RIBBA `18288` 相框，展示其平直凹入的硬质背板，并记录当前使用的原厂直钩；用户给出的 22 mm 凹深实测为本设计的控制尺寸。现行 IKEA RIBBA 官方说明书仅登记为系列背景，不作为这款 1999 版本尺寸的证据。
- EN: Added `accessories/frames/ribba-22.scad`, intended as a spaced pair. Each bracket is 24 mm wide, reaches 23 mm from the frame rear plane (22 mm recess + 1 mm allowance), uses a 4.5 mm flat arm, a 5 mm rounded retaining lip, and an underside root gusset. The new real model establishes the `frames/` family without creating placeholder families.
  ZH: 新增 `accessories/frames/ribba-22.scad`，设计为两只拉开间距配合使用。每只宽 24 mm，从相框背面基准伸入 23 mm（22 mm 凹深 + 1 mm 余量），采用 4.5 mm 平直托臂、5 mm 短圆防脱唇与根部下加强筋。这个真实模型正式建立 `frames/` family（家族），未创建任何占位 family。
- EN: Impact-scoped Docker validation rendered only the new model. It completed with zero warnings/assertions; a direct STL audit found one connected component, zero boundary/non-manifold edges, and Euler characteristic 2 (`genus 0`). Profile inspection confirmed the flat bearing surface, underside gusset, and lip direction. The model uses `ch=0` after diagnosis found the current shared stepped-chamfer helper can leave a coplanar disconnected top shell; that helper remains unchanged for separate full-regression work. Physical fit and progressive load testing remain open, so the catalog status is `prototype` and no load rating is assigned.
  ZH: 按影响范围仅对新模型执行 Docker 验证。渲染零 warning、零 assertion；直接 STL 检查得到 1 个连通体、0 条边界/非流形边，Euler characteristic（欧拉特征数）为 2（`genus 0`）。轮廓检查确认平直承托面、下加强筋与圆唇方向正确。诊断发现当前共享阶梯倒角 helper（辅助模块）可能留下共面但不连通的顶部壳，因此本模型使用 `ch=0`；该 helper 保持不变，留作需要全量回归的独立工作。实物配合与逐级承载测试仍未完成，因此 catalog 状态为 `prototype`，不赋予承载额定值。

## [2026-07-14] writeback | Replace RIBBA retaining lip with inclined plane

- EN: At the user's direction, removed the 5 mm upturned retaining lip from `accessories/frames/ribba-22.scad`. The replacement bearing surface rises 1.5° toward the room/free end, producing a 0.4347 mm rise across its 16.6 mm run; gravity therefore biases normal seating toward the wall/root. The underside remains horizontal, so the 4.5 mm root section is preserved and the arm becomes slightly thicker toward the end.
  ZH: 按用户决定，从 `accessories/frames/ribba-22.scad` 删除 5 mm 上翻防脱唇。替代托面向房间侧/自由端抬高 1.5°，在 16.6 mm 有效长度上形成 0.4347 mm 高差；因此正常就位时重力会让相框向墙面/根部偏置。底面保持水平，从而保留 4.5 mm 根部截面，并使托臂向末端略微增厚。
- EN: Added an R1.2 tangent nose with no protrusion above the inclined plane. The flat bearing segment still reaches 23 mm from the frame rear plane before rounding begins, preserving the 22 mm recess plus 1 mm fit allowance. This trades positive bump/lift retention for easier insertion and lower interference risk.
  ZH: 新增 R1.2 相切圆头，且不高出倾斜托面。进入圆头前，平直承托段仍从相框背面基准伸入 23 mm，完整保留 22 mm 凹深 + 1 mm 配合余量。该方案以放弃碰撞/抬起时的刚性限位，换取更轻松的插入和更低的干涉风险。
- EN: Impact-scoped Docker validation rendered only `frame-ribba22`; it completed with no warnings/assertions. Direct STL topology audit: one connected component, zero boundary/non-manifold edges, Euler characteristic 2 (`genus 0`), 268 triangles. Only the iso and side-profile views were inspected; the shared mount and library were unchanged.
  ZH: 按影响范围仅渲染 `frame-ribba22`；过程零 warning、零 assertion。直接 STL 拓扑检查：1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2（`genus 0`）、268 triangles（三角面）。仅检查等轴图与侧轮廓；共享安装接口和库均未修改。

## [2026-07-14] writeback | Raise and shorten RIBBA platform

- EN: Raised the 1.5° platform until its highest point is `Y=-21.2`, leaving the minimum modeled 0.2 mm clearance below the shared wall-contact face ending at `Y=-21`. Reduced the underside root-gusset drop from 3.0 to 1.5 mm while retaining the 24 mm width, 4.5 mm platform root thickness, 23 mm flat bearing reach, and R1.2 rounded nose.
  ZH: 将 1.5° 平台上移到最高点 `Y=-21.2`，在截止于 `Y=-21` 的共享抵墙承压面下方保留模型设定的最小 0.2 mm 净空。根部下加强筋下探由 3.0 mm 减至 1.5 mm，同时保留 24 mm 宽度、4.5 mm 平台根部厚度、23 mm 平直承托伸入量与 R1.2 圆头。
- EN: Renamed the accessory's body thickness from `arm_t` to `platform_t`. The old global name shadowed the included fixed-library `arm_t=2.2`, inflating the rail-claw envelope to 11.25 mm. The corrected model restores the 8.95 mm claw against its 9.0 mm target and, together with the raised platform, reduces overall height from about 45.0 to 38.8347 mm (−6.17 mm) without changing `lib/rail-mount.scad`.
  ZH: 将配件主体厚度变量由 `arm_t` 改名为 `platform_t`。旧的全局名称遮蔽了 include（包含）进来的固定库 `arm_t=2.2`，曾把导轨卡爪包络增高到 11.25 mm。修正模型把卡爪恢复为 8.95 mm（目标 9.0 mm）；再结合平台上移，总高由约 45.0 mm 降到 38.8347 mm（减少 6.17 mm），且未修改 `lib/rail-mount.scad`。
- EN: Impact-scoped Docker validation rendered only `frame-ribba22` with no warnings/assertions. Iso and side-profile inspection confirmed the compact continuous gusset and raised platform. Direct STL topology audit remains one connected component, zero boundary/non-manifold edges, Euler characteristic 2 (`genus 0`), 268 triangles.
  ZH: 按影响范围仅渲染 `frame-ribba22`，零 warning、零 assertion。等轴图与侧轮廓确认紧凑而连续的加强筋和上移平台。直接 STL 拓扑检查仍为 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2（`genus 0`）、268 triangles（三角面）。

## [2026-07-15] writeback | Align RIBBA platform underside to pressure-face edge

- EN: At the user's direction, aligned the platform underside with the rear wall-contact pressure face's lower edge at `Y=-21`. Removed the separate 1.5 mm lower gusset drop; the fixed interface's ramp/body endpoint at `Y=-22.4` now connects diagonally straight to the 4.5 mm-thick platform root.
  ZH: 按用户决定，将平台底面与后方抵墙承压凸起下缘共同对齐 `Y=-21`。删除独立的 1.5 mm 下方加强筋下探；固定接口位于 `Y=-22.4` 的过渡/主体端点现直接斜接到 4.5 mm 厚的平台根部。
- EN: The unchanged 1.5° surface now reaches a highest point of `Y=-16.0653`; its vertical datum remains 0.0653 mm below the pressure-face upper edge at `Y=-16`, while the features are separated in X. Overall height falls from 38.8347 to 33.6 mm (−5.23 mm), which is the minimum envelope allowed by the unchanged `body_back_y=-22.4` and fixed `y_top=11.2`.
  ZH: 保持不变的 1.5° 托面现达到最高点 `Y=-16.0653`；其竖向基准仍比承压面上缘 `Y=-16` 低 0.0653 mm，且两处特征在 X 方向分离。总高由 38.8347 mm 降到 33.6 mm（减少 5.23 mm），这是 `body_back_y=-22.4` 与固定 `y_top=11.2` 不变时允许的最小包络。
- EN: Impact-scoped Docker validation rendered only `frame-ribba22` with no warnings/assertions. Iso and side-profile inspection found no self-intersection and confirmed the aligned underside. Direct STL audit: one connected component, zero boundary/non-manifold edges, Euler characteristic 2 (`genus 0`), 268 triangles; the shared library remains unchanged.
  ZH: 按影响范围仅渲染 `frame-ribba22`，零 warning、零 assertion。等轴图与侧轮廓未发现自交，并确认底面对齐。直接 STL 检查：1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2（`genus 0`）、268 triangles；共享库保持不变。

## [2026-07-15] writeback | Flatten and fillet RIBBA front; set 22 mm bearing reach

- EN: Removed the former 2.2 mm room-side root projection by setting `root_front_x=x_pf`, leaving a continuous vertical front face for the light picture-frame load. Added a tangent R1.0 root fillet to soften the platform junction without restoring a protruding boss.
  ZH: 通过设置 `root_front_x=x_pf` 删除原有 2.2 mm 房间侧根部凸出，针对轻载相框保留连续垂直正面。增加相切 R1.0 根部圆角，缓和平台交界处的转角，但不恢复外凸加强块。
- EN: Set `depth_clearance=0`, so the flat inclined bearing reach is exactly the measured 22.0 mm. Only the tangent R1.2 nose continues to a 23.2314 mm outer reach; its 1.2314 mm overrun is curved transition geometry rather than additional flat platform.
  ZH: 将 `depth_clearance=0`，使倾斜平直托面精确伸入实测的 22.0 mm。只有相切 R1.2 圆头继续到 23.2314 mm 最外缘；多出的 1.2314 mm 是曲面过渡几何，不是额外平直平台。
- EN: Impact-scoped validation rerendered only `frame-ribba22` with no warnings/assertions. Visual inspection confirmed the flush face and R1.0 fillet; direct STL audit reports one connected component, zero boundary/non-manifold edges, Euler characteristic 2 (`genus 0`), and 300 triangles. The shared library remains unchanged.
  ZH: 按影响范围仅重新渲染 `frame-ribba22`，零 warning、零 assertion。外观检查确认齐平正面与 R1.0 圆角；直接 STL 检查为 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2（`genus 0`）、300 triangles。共享库保持不变。

## [2026-07-15] source-update | Confirm physical fit of RIBBA saddle

- EN: The user reported that the first `frame-ribba22` print completed successfully and is now carrying the old RIBBA 18288 frame. Marked the design page active and recorded the fit as physically validated for this specific frame, rail, printer, and material setup.
  ZH: 用户反馈首件 `frame-ribba22` 已成功打印，并正在承托旧款 RIBBA 18288 相框。已将设计页标记为 active（活跃），并记录该特定相框、导轨、打印机与材料组合下的实物配合验证。
- EN: The successful initial installation is not treated as a sustained-load rating. Long-term observation for creep, layer separation, rail unseating, edge marking, and outward lean remains open.
  ZH: 首次成功挂装不视为持续承载额定。仍需长期观察螺变、层间开裂、导轨脱位、边缘压痕与外倾。

## [2026-07-15] writeback | Raise RIBBA platform for visual coverage

- EN: Superseded the physically tested low-platform placement with a raised visual-cover revision. The free bearing edge is now exactly 12.0 mm below the unchanged fixed mount top (`Y=-0.8` versus `y_top=11.2`), while the 22 mm flat reach, 1.5° inward slope, 24 mm width, rear claw, 2.0 mm pressure face, `body_back_y=-22.4`, and 33.6 mm overall envelope remain unchanged.
  ZH: 用抬高的视觉遮挡版取代已完成实物试装的低平台位置。自由端承托上缘现精确位于未改动的固定安装头顶部下方 12.0 mm（`Y=-0.8`，`y_top=11.2`）；22 mm 平直伸入量、1.5° 向内斜度、24 mm 宽度、后方卡爪、2.0 mm 承压面、`body_back_y=-22.4` 与 33.6 mm 总包络均保持不变。
- EN: Modeled the high platform as a separate profile with 0.25 mm of positive overlap into the fixed front plate. Retained the upper R1.0 root fillet, added R1.0 radii to both exposed lower corners, and retained the R1.2 lip-free nose.
  ZH: 高位平台改为独立轮廓，并向固定前板内实体重叠 0.25 mm。保留上方 R1.0 根部圆角，底部两处外露转角新增 R1.0 圆角，自由端继续使用无上翻唇的 R1.2 圆头。
- EN: Impact-scoped validation rendered only `frame-ribba22`, with no warnings/assertions and `Manifold` / `NoError` / genus 0. Visual inspection confirmed the raised connected arm and all requested radii; direct STL audit reports one component, zero boundary/non-manifold edges, Euler characteristic 2, 188 vertices, and 372 triangles. The new platform height still requires a physical fit check.
  ZH: 按影响范围仅渲染 `frame-ribba22`，零 warning、零 assertion，并通过 `Manifold` / `NoError` / genus 0 检查。外观检查确认抬高托臂连接完整，且所有要求的圆角已形成；直接 STL 检查为 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2、188 个顶点与 372 个三角面。新平台高度仍需实物试装。

## [2026-07-15] writeback | Use inner fillets on reinforced RIBBA gusset

- EN: Added a full-width diagonal support beneath the raised RIBBA platform: 24 mm wide, 13 mm nominal reach, 10 mm nominal drop, and 0.6 mm positive overlap into both the fixed plate and platform. It is a thick closed solid so slicer infill can reduce internal material without weakening the OpenSCAD connection geometry.
  ZH: 在抬高的 RIBBA 平台下新增全宽斜撑：宽 24 mm、标称伸出 13 mm、标称下探 10 mm，并向固定竖板与平台各实体重叠 0.6 mm。它是厚实闭合体，因此切片器可用填充减少内部用料，而不会削弱 OpenSCAD 中的连接几何。
- EN: Superseded the first generic rounded-triangle experiment because its standalone offset rounding became an outward bulb at the obtuse/re-entrant junction after union. Rebuilt both exposed junctions from the final silhouette as tangent R1.5 concave inner arcs, then recorded this final-outline classification and curvature-direction check in `.agents/skills/wallboard-rail-mount/SKILL.md`.
  ZH: 作废首次使用通用圆角三角形的尝试，因为独立轮廓的 offset（偏移）圆角在并集后会于钝角/内凹接头形成向外鼓包。现改为根据最终轮廓重建两处外露接头，均采用相切 R1.5 内弧，并把“按最终轮廓判定角类型、检查弧向”的规则写入 `.agents/skills/wallboard-rail-mount/SKILL.md`。
- EN: Impact-scoped validation rendered only `frame-ribba22`, with no warnings/assertions and `Manifold` / `NoError` / genus 0. Enlarged side-profile inspection confirmed both concave arc directions. Direct STL audit reports one connected component, zero boundary/non-manifold edges, Euler characteristic 2, 228 vertices, and 452 triangles. The repository skill passed `quick_validate.py`, and its bundled `rail-mount.scad` remains byte-identical to `lib/rail-mount.scad`.
  ZH: 按影响范围仅渲染 `frame-ribba22`，零 warning、零 assertion，并通过 `Manifold` / `NoError` / genus 0。放大侧轮廓确认两处内弧方向正确。直接 STL 检查为 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2、228 个顶点与 452 个三角面。仓库 skill 已通过 `quick_validate.py`，其中随附的 `rail-mount.scad` 继续与 `lib/rail-mount.scad` 字节一致。

## [2026-07-15] ingest+source-update | Confirm raised RIBBA fit and visual concealment

- EN: Preserved two new user photos byte-for-byte as `raw/accessories/frame-ribba22/raised-reinforced-pair-installed.jpg` and `raw/accessories/frame-ribba22/frame-conceals-raised-saddles.jpg`, then registered both in `wiki/sources.md`. The first records the current reinforced pair installed with practical spacing; the second records the frame covering the mounts after installation.
  ZH: 将用户新增的两张照片逐字节原样保存为 `raw/accessories/frame-ribba22/raised-reinforced-pair-installed.jpg` 与 `raw/accessories/frame-ribba22/frame-conceals-raised-saddles.jpg`，并在 `wiki/sources.md` 登记。第一张记录当前加强版成对安装及实际间距，第二张记录相框挂装后遮住托架的效果。
- EN: The user reports that the result works very well. The installed evidence closes the current raised revision's fit and visual-coverage checks for this specific RIBBA 18288, rail, printer, and material setup: the pair mounts successfully and the frame conceals it at the selected 12 mm datum without apparent interference.
  ZH: 用户反馈效果很好。实装证据关闭了当前抬高版在这套特定 RIBBA 18288、挂条、打印机与材料组合下的配合及视觉遮挡检查：成对托架可正常挂装，相框能在选定的 12 mm 基准处将其遮住，且未见明显干涉。
- EN: This successful installation is not a sustained-load rating. Continue observing for creep, layer separation, rail unseating, hardboard-edge marking, or visible outward lean; no additional geometry render was needed for this documentation-only ingest.
  ZH: 此次成功挂装不构成持续承载额定。仍需继续观察蠕变、层间开裂、导轨脱位、硬质背板边缘压痕或可见外倾；本次仅摄入文档与照片，无需额外几何渲染。

## [2026-07-15] writeback | Add independent minimum-height Round 6 Short

- EN: Added `accessories/hooks/round-6-short.scad` as an independent sibling; the original `round-6.scad` remains unchanged for A/B testing. Short preserves the Ø6 rod, 25 mm outer J envelope, 205° sweep, spherical tip, 11.9 mm width, fixed claw, and 2.0 mm pressure face.
  ZH: 新增独立兄弟版本 `accessories/hooks/round-6-short.scad`；原 `round-6.scad` 保持不变，供 A/B 测试。Short 版保留 Ø6 圆杆、25 mm J 钩外包络、205° 扫掠角、球面圆头、11.9 mm 宽度、固定卡爪与 2.0 mm 承压面。
- EN: Lifted the J center from `Y=-24` to `Y=-9.9`, aligning its 12.5 mm outer radius with the minimum fixed-body bottom at `Y=-22.4`. Replaced the long broad shank with a local full-width 4.4 mm root from `Y=-8.6` to `Y=-9.9`. Total height falls from 47.7 to 33.6 mm (−14.1 mm, −29.6%) without changing the functional J envelope or shared interface.
  ZH: 将 J 钩中心由 `Y=-24` 抬到 `Y=-9.9`，使 12.5 mm 外半径与固定主体最低点 `Y=-22.4` 对齐。长宽杆身改为 `Y=-8.6…-9.9` 的局部全宽 4.4 mm 根部。总高由 47.7 mm 降至 33.6 mm（减少 14.1 mm、29.6%），且不改变 J 钩功能包络或共享接口。
- EN: Impact-scoped Docker validation rendered only `hook-round6-short`. OpenSCAD reported no warnings/assertions, `Manifold`, `NoError`, genus 0, 3785 vertices, and 7566 facets. Exact-coordinate STL audit found one component, zero bad edges, and Euler characteristic 2; Y bounds are exactly `-22.4…11.2`. Localized support remains required at the unchanged 2.95 mm bed gap, and physical A/B fit/load testing is open.
  ZH: 按影响范围仅渲染 `hook-round6-short`。OpenSCAD 零 warning、零 assertion，并报告 `Manifold`、`NoError`、genus 0、3785 个顶点与 7566 个面。使用精确坐标的 STL 检查得到 1 个连通体、0 条坏边、Euler characteristic（欧拉特征数）2；Y 包络精确为 `-22.4…11.2`。2.95 mm 热床空隙不变，仍需局部支撑；实物 A/B 配合与承载测试保持开放。

## [2026-07-15] writeback | Round the Short hook's lower root

- EN: Removed the experimental upper root shelf and replaced the intermediate elliptical boss with a full-width two-lobe convex root. The Ø5.2 mm plate lobe overlaps the fixed plate; the Ø8.4 mm hook lobe is centered on the existing J path at 225°. The resulting profile follows the lower sweep, increases root area, and fills the former re-entrant plate/hook junction without changing the original `round-6.scad`.
  ZH: 删除实验版根部上方横台，并以全宽双圆瓣凸根部替代中间椭圆凸台。Ø5.2 mm 竖板圆瓣与固定竖板重叠；Ø8.4 mm 挂钩圆瓣位于原 J 钩路径的 225° 位置。最终轮廓沿下方弧线展开、增大根部面积，并填平原先竖板/挂钩交界的凹入角；原 `round-6.scad` 未作修改。
- EN: Impact-scoped validation again rendered only `hook-round6-short`. OpenSCAD reported no warnings/assertions, `Manifold`, `NoError`, genus 0, 3092 vertices, and 6180 facets. Exact-coordinate STL audit found one component, zero boundary/non-manifold edges, Euler characteristic 2, and unchanged `Y=-22.4…11.2` bounds. Iso and profile inspection confirmed no upper shelf or lower stress-concentrating inside corner.
  ZH: 按影响范围再次只渲染 `hook-round6-short`。OpenSCAD 零 warning、零 assertion，并报告 `Manifold`、`NoError`、genus 0、3092 个顶点与 6180 个面。精确坐标 STL 检查得到 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2，且 `Y=-22.4…11.2` 包络不变。等轴与轮廓检查确认不存在上方横台或下方应力集中内角。

## [2026-07-15] writeback | Replace Round 6 Short boss with a curved loft

- EN: Superseded the blocky two-lobe root with a dependency-free native `polyhedron()` section-ring loft. The final root starts as an 8 × 11.5 mm ellipse, uses a 0.8 mm tangent bell mouth plus hidden positive-overlap core at the fixed plate, follows a 5.335 mm-radius / 36° curved horn, and contracts both section axes to the Ø6 rod before joining the original circular J path tangentially at 234°. The original `round-6.scad` and shared library remain unchanged.
  ZH: 用无外部依赖的原生 `polyhedron()` 截面环 loft 取代块状双圆瓣根部。最终根部以 8 × 11.5 mm 椭圆起步，在固定竖板处采用 0.8 mm 相切喇叭口及隐藏正体积重叠芯，随后沿半径 5.335 mm、转角 36° 的弯曲渐缩段同时收细两个截面轴，并在 234° 处与原圆形 J 路径相切连接成 Ø6 圆杆。原 `round-6.scad` 与共享库均保持不变。
- EN: Integrated the rounded free end as hemisphere rings and an apex in the same polyhedron. A separate equal-radius sphere tangent to the final Ø6 ring produced a high-genus Boolean result despite a closed loft; the integrated cap removes that degeneracy. Corrected all polyhedron face winding to OpenSCAD's convention so the loft participates in the mount union as a solid rather than an independent shell.
  ZH: 将圆润自由端以半球截面环和顶点直接并入同一 polyhedron（多面体）。独立同半径球体与末端 Ø6 圆环相切时，即使 loft 本身闭合，Boolean 结果仍会出现高 genus；集成端盖消除了该退化。同时按 OpenSCAD 约定修正全部 polyhedron 面绕序，使 loft 作为实体参与安装头并集，而不是独立壳体。
- EN: Impact-scoped validation rendered only `hook-round6-short`. OpenSCAD reported no warnings/assertions, `Manifold`, `NoError`, genus 0, 5771 vertices, and 11538 facets. Exact-coordinate STL audit found one component, zero boundary/non-manifold edges, Euler characteristic 2, and unchanged `Y=-22.4…11.2` bounds. Profile/iso/end inspection confirmed the continuous taper and absence of the former rear boss or exposed inside corner; physical fit and load testing remain open.
  ZH: 按影响范围仅渲染 `hook-round6-short`。OpenSCAD 零 warning、零 assertion，并报告 `Manifold`、`NoError`、genus 0、5771 个顶点与 11538 个面。精确坐标 STL 检查得到 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2，且 `Y=-22.4…11.2` 包络不变。轮廓/等轴/端视检查确认渐缩连续，且不存在先前的后凸台或外露内角；实物配合与承载测试仍待完成。

## [2026-07-15] writeback | Enlarge and lengthen the Round 6 Short root

- EN: Enlarged the plate root from 8 × 11.5 mm to 12.8 × 11.8 mm. It now spans `Y=-21.7…-8.9` and leaves only 0.05 mm per side of the 11.9 mm mount width, using almost the complete available plate face while staying below the fixed `Y=-8` rail-zone datum.
  ZH: 将贴板根部由 8 × 11.5 mm 扩大为 12.8 × 11.8 mm。它现在竖向覆盖 `Y=-21.7…-8.9`，并在 11.9 mm 安装宽度两侧各仅留 0.05 mm，在保持低于固定 `Y=-8` 轨道区基准的同时，几乎用尽可用竖板面。
- EN: Replaced the former 0.8 mm bell mouth and approximately 3.35 mm constant-radius horn with a 1.2 mm tangent bell mouth and an approximately 8.0 mm cubic-Bezier transition. The larger section contracts smoothly in both axes and joins the original circular J path tangentially at 260°. This geometry is intended to spread plate load and reduce local section-change stress, but it does not establish a higher load rating without physical testing or FEA.
  ZH: 用 1.2 mm 相切喇叭口及约 8.0 mm cubic-Bezier（三次贝塞尔）过渡，取代先前 0.8 mm 喇叭口与约 3.35 mm 等半径弯段。大截面沿两轴平滑收细，并在 260° 处与原圆形 J 路径相切连接。这一几何意图是扩散贴板载荷并降低局部截面变化应力，但在实物测试或 FEA（有限元分析）前不构成更高承载额定。
- EN: Impact-scoped validation rendered only `hook-round6-short`; the original `round-6.scad` and shared library remain unchanged. OpenSCAD reported no warnings/assertions, `Manifold`, `NoError`, genus 0, 5723 vertices, and 11442 facets. Exact-coordinate STL audit found one component, zero boundary/non-manifold edges, Euler characteristic 2, `Y=-22.4…11.2`, and `Z=0…11.9`. Iso, side-profile, and front inspection confirmed the wider, taller, gradual taper; physical fit and load testing remain open.
  ZH: 按影响范围仅渲染 `hook-round6-short`；原 `round-6.scad` 与共享库保持不变。OpenSCAD 零 warning、零 assertion，并报告 `Manifold`、`NoError`、genus 0、5723 个顶点与 11442 个面。精确坐标 STL 检查得到 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2、`Y=-22.4…11.2`、`Z=0…11.9`。等轴、侧轮廓与正面检查确认渐缩更宽、更高且过渡平缓；实物配合与承载测试仍待完成。

## [2026-07-15] writeback | Move Round 6 Short reinforcement below the upper contour

- EN: Superseded the symmetric 12.8 × 11.8 mm root because it created an unnecessary upper belly. The replacement eccentric plate section keeps its upper extent exactly at the Ø6 rod's 3.0 mm radius, extends 6.4 mm below the reference centerline, and remains 11.8 mm wide. Added material is therefore confined to the lower and rail-width directions; the root now spans `Y=-21.7…-12.3`.
  ZH: 作废对称 12.8 × 11.8 mm 根部，因为它会产生无需的上方大肚鼓包。替代后的偏心贴板截面将上侧伸出精确保持为 Ø6 圆杆的 3.0 mm 半径，在参考中心线下方延伸 6.4 mm，并继续保持 11.8 mm 宽度。因此新增材料只位于下侧和轨道宽度方向；根部现覆盖 `Y=-21.7…-12.3`。
- EN: Removed the separate bell-mouth and main-contraction radius laws. One global parameter now drives an eccentric section-ring loft; its cubic-Bezier centerline joins the original J circle at 250° with matched tangent and curvature, and its `(1-t)^3` scale law reaches Ø6 with zero first/second derivatives. This removes the visible two-stage shoulder while preserving a plate-tangent root.
  ZH: 删除独立的喇叭口与主收缩半径律。现在由一个全局参数驱动偏心截面环 loft；cubic-Bezier（三次贝塞尔）中心线在 250° 处以匹配的切线与曲率接入原 J 圆，`(1-t)^3` 缩放律以零一阶/二阶导数到达 Ø6。这消除了可见的两段肩部，同时保留贴板相切根部。
- EN: Impact-scoped validation rendered only `hook-round6-short`; the original `round-6.scad` and shared library remain unchanged. OpenSCAD reported no warnings/assertions, `Manifold`, `NoError`, genus 0, 5655 vertices, and 11306 facets. Exact-coordinate STL audit found one component, zero boundary/non-manifold edges, Euler characteristic 2, `Y=-22.4…11.2`, and `Z=0…11.9`. Analytic sampling confirmed the entire upper transition silhouette decreases monotonically from `Y=-12.3` to `Y=-16.008`, so no intermediate upper bulge remains; physical fit and load testing are still open.
  ZH: 按影响范围仅渲染 `hook-round6-short`；原 `round-6.scad` 与共享库保持不变。OpenSCAD 零 warning、零 assertion，并报告 `Manifold`、`NoError`、genus 0、5655 个顶点与 11306 个面。精确坐标 STL 检查得到 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2、`Y=-22.4…11.2`、`Z=0…11.9`。解析采样确认整段上侧过渡轮廓由 `Y=-12.3` 单调下降至 `Y=-16.008`，不再存在中间上方鼓包；实物配合与承载测试仍待完成。

## [2026-07-15] writeback | Fuse the Round 6 Short root through the true hook bottom

- EN: Extended the eccentric plate root from 6.4 to 7.1 mm below its reference centerline so it begins exactly at the fixed `Y=-22.4` bottom datum. Moved the circular-path join from 250° to the true J bottom at 270°; the former rear round-rod underside is now completely replaced by the reinforced root body.
  ZH: 将偏心贴板根部在参考中心线下方的伸出由 6.4 mm 扩大至 7.1 mm，使其精确从固定 `Y=-22.4` 最低基准开始。将圆形路径接入点由 250° 移到 270° 的 J 钩真正最低点；原本靠墙侧的圆杆底弧现已完全被加强根部主体取代。
- EN: Solved each transition ring's lower extent from its centerline position and local normal, holding the complete world-space underside exactly at `Y=-22.4`. The upper extent remains fixed at the 3.0 mm rod radius and descends monotonically, while the 11.8 mm plate width still contracts continuously to Ø6 with matched tangent and centerline curvature at the 270° join.
  ZH: 根据每个过渡截面环的中心线位置与局部法线反算下侧伸出，使完整世界坐标下缘精确保持在 `Y=-22.4`。上侧伸出继续固定为圆杆 3.0 mm 半径并单调下降；11.8 mm 贴板宽度仍连续收细至 Ø6，并在 270° 接入点匹配切线与中心线曲率。
- EN: Impact-scoped validation rendered only `hook-round6-short`; the original `round-6.scad` and shared library remain unchanged. OpenSCAD reported no warnings/assertions, `Manifold`, `NoError`, genus 0, 4979 vertices, and 9954 facets. Exact-coordinate STL audit found one component, zero boundary/non-manifold edges, Euler characteristic 2, `Y=-22.4…11.2`, and `Z=0…11.9`. Analytic sampling measured zero lower-datum error and an upper silhouette monotonically descending from `Y=-12.3` to `Y=-16.4`; physical fit and load testing remain open.
  ZH: 按影响范围仅渲染 `hook-round6-short`；原 `round-6.scad` 与共享库保持不变。OpenSCAD 零 warning、零 assertion，并报告 `Manifold`、`NoError`、genus 0、4979 个顶点与 9954 个面。精确坐标 STL 检查得到 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2、`Y=-22.4…11.2`、`Z=0…11.9`。解析采样得到下缘基准误差为零，上侧轮廓由 `Y=-12.3` 单调下降至 `Y=-16.4`；实物配合与承载测试仍待完成。

## [2026-07-15] writeback | Use the complete Round 6 Short plate width

- EN: Removed the former 0.05 mm inset on each side of the eccentric root. Its width radius is now exactly `part_w/2=5.95`, so the root spans the complete `Z=0…11.9` plate width while the Ø6 rod, upper contour, and bottom-fused side profile remain unchanged.
  ZH: 删除偏心根部左右两侧原有的各 0.05 mm 缩进。宽度半径现精确为 `part_w/2=5.95`，因此根部覆盖完整 `Z=0…11.9` 底板宽度，而 Ø6 圆杆、上侧轮廓与全底融合侧轮廓均保持不变。
- EN: Added a source assertion that root width must equal the complete mount width. Impact-scoped validation again rendered only `hook-round6-short`; OpenSCAD reported no warnings/assertions, `Manifold`, `NoError`, genus 0, 4979 vertices, and 9954 facets. Exact-coordinate STL audit found one component, zero boundary/non-manifold edges, Euler characteristic 2, and `Z=0…11.9`; front/iso inspection found no inset band, outward step, or seam. Physical fit and load testing remain open.
  ZH: 在源码中新增根部宽度必须等于完整安装宽度的断言。按影响范围再次仅渲染 `hook-round6-short`；OpenSCAD 零 warning、零 assertion，并报告 `Manifold`、`NoError`、genus 0、4979 个顶点与 9954 个面。精确坐标 STL 检查得到 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2 以及 `Z=0…11.9`；正面/等轴检查未见缩进边带、向外台阶或接缝。实物配合与承载测试仍待完成。

## [2026-07-15] writeback | Wrap the Round 6 Short root around the plate sides

- EN: Superseded the exact-width elliptical root after final-union inspection showed that an ellipse reaches full width only at its middle and still exposes the plate's lower side corners. Replaced it with a D-shaped root whose full-width sides and flat bottom span 13.5 mm, wrapping 0.8 mm around each side of the 11.9 mm plate. A 0.6 mm embedded anchor and 0.4 mm visible full-section start are part of the same polyhedron; the former separate overlap core was removed.
  ZH: 最终并集轮廓检查表明，等宽椭圆只在中部达到最大宽度，仍会露出底板左右下角，因此作废该方案。新根部改为 D 形，满宽直边和平底总宽 13.5 mm，在 11.9 mm 底板左右各包过 0.8 mm。0.6 mm 内嵌锚定段与 0.4 mm 可见满截面起步均属于同一个 polyhedron；原独立重叠芯已删除。
- EN: Fifth-order smoothstep morphing now transitions the D section into the unchanged Ø6 rod with zero first/second derivatives at both ends. Impact-scoped final F6 validation rendered only `hook-round6-short` and reported no warnings/assertions, `Manifold`, `NoError`, genus 0, 5255 vertices, and 10506 facets. Exact STL audit found one component, zero boundary/non-manifold edges, Euler characteristic 2, and bounds `Y=-22.4…11.2`, `Z=-0.8…12.7`. Physical printing, support removal, fit, and load testing remain open.
  ZH: 现在用五阶 smoothstep（平滑阶跃）把 D 形截面过渡到未改动的 Ø6 圆杆，并在两端保持零一阶/二阶导数。按影响范围最终仅对 `hook-round6-short` 执行 F6 验证；结果为零 warning、零 assertion、`Manifold`、`NoError`、genus 0、5255 个顶点与 10506 个面。精确 STL 检查得到 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2，以及 `Y=-22.4…11.2`、`Z=-0.8…12.7` 包络。实物打印、支撑拆除、配合及承载测试仍待完成。

## [2026-07-15] writeback | Restore coplanar print sides on Round 6 Short

- EN: Superseded the 0.8 mm side-wrap experiment because it made the 13.5 mm root the bed-contact extremum and lifted the fixed mount during side printing. Retained the D-shaped full-width sides, flat bottom, 0.6 mm embedded anchor, and 0.4 mm full-section start, but reduced the root to the exact 11.9 mm mount width. The complete model again fits `Z=0…11.9`, so either mount side can lie directly on the bed.
  ZH: 作废左右各包出 0.8 mm 的实验，因为 13.5 mm 根部会成为热床接触最外点，并在侧放打印时抬高固定安装头。保留 D 形满宽直边、平底、0.6 mm 内嵌锚定段与 0.4 mm 满截面起步，但把根部裁回精确 11.9 mm 安装宽度。完整模型重新落入 `Z=0…11.9`，安装头任一侧均可直接贴床。
- EN: Impact-scoped final F6 validation rendered only `hook-round6-short` and reported no warnings/assertions, `Manifold`, `NoError`, genus 0, 5170 vertices, and 10336 facets. Exact STL audit found one component, zero boundary/non-manifold edges, Euler characteristic 2, and bounds `Y=-22.4…11.2`, `Z=0…11.9`. The Ø6 rod still needs localized support for its 2.95 mm side-print gap; physical printing and load testing remain open.
  ZH: 按影响范围最终仅对 `hook-round6-short` 执行 F6 验证；结果为零 warning、零 assertion、`Manifold`、`NoError`、genus 0、5170 个顶点与 10336 个面。精确 STL 检查得到 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2，以及 `Y=-22.4…11.2`、`Z=0…11.9` 包络。Ø6 圆杆因侧放时仍有 2.95 mm 间隙而需要局部支撑；实物打印与承载测试仍待完成。

## [2026-07-15] writeback | Record Round 6 Short design lessons

- EN: The user reported that the final exact-width D-root revision printed perfectly. This closes physical printing and support removal for the current printer, material, and slicer setup; rail seating, real-item clearance, and progressive load tests remain open.
  ZH: 用户反馈最终等宽 D 形根部版本打印完美。这完成了当前打印机、材料与切片配置下的实物打印和支撑拆除验证；轨道就位、真实挂物净空及逐级承载测试仍保持开放。
- EN: Recorded reusable rules in `.agents/skills/wallboard-rail-mount/SKILL.md` and `wiki/accessories/hook-round6-short.md`: judge coverage from the final union silhouette rather than nominal section width; prefer a flat-sided D root when plate edges must stay covered; keep positive-volume embed in one loft instead of a hidden overlap core; audit bed-normal bounds before widening; and combine F6 silhouette, exact topology/bounds, and physical-print checks.
  ZH: 已在 `.agents/skills/wallboard-rail-mount/SKILL.md` 与 `wiki/accessories/hook-round6-short.md` 记录可复用规则：按最终并集轮廓而非标称截面宽度判断覆盖；需要覆盖底板边缘时优先采用平直边 D 形根部；将正体积内嵌放入单一 loft 而非隐藏重叠芯；加宽前审计热床法向包络；并结合 F6 轮廓、精确拓扑/包络和实物打印三层检查。

## [2026-07-17] writeback | Add rail-only Round 6 Ultra Short

- EN: Added a backward-compatible `wall_contact=true` parameter to `rail_mount_pts()` and `rail_accessory()`. The `false` branch removes only the 5 mm `X=-2.0`, `Y=-16…-21` pressure face and its ramps while preserving the 0.8 mm baseline back contour and the complete validated claw. Existing callers remain unchanged; the production and skill library copies remain byte-identical.
  ZH: 为 `rail_mount_pts()` 与 `rail_accessory()` 新增向后兼容的 `wall_contact=true` 参数。`false` 分支只删除 5 mm 高的 `X=-2.0`、`Y=-16…-21` 承压面及其 ramp，同时保留 0.8 mm 基线背面轮廓和完整的已验证卡爪。现有调用方无需修改；正式库与 skill 库副本继续逐字节一致。
- EN: Added independent `accessories/hooks/round-6-ultra-short.scad`. It alone passes `wall_contact=false`, raises the unchanged Ø6 / 25 mm J envelope by exactly 5 mm, and uses a 3.0 / 6.4 / 11.9 mm D root from `Y=-8` to the shared flat `Y=-17.4` bottom. Overall height is 28.6 mm, 5.0 mm below Short and 19.1 mm below the original Round 6; physical printing and rail-only load testing remain open.
  ZH: 新增独立的 `accessories/hooks/round-6-ultra-short.scad`。只有它传入 `wall_contact=false`，把不变的 Ø6 / 25 mm J 钩包络精确抬高 5 mm，并采用从 `Y=-8` 延伸到共同 `Y=-17.4` 平底的 3.0 / 6.4 / 11.9 mm D 形根部。总高为 28.6 mm，比 Short 减少 5.0 mm，比原 Round 6 减少 19.1 mm；实物打印与轨道单独承载测试仍保持开放。
- EN: Target F6 validation reported no warnings/assertions, `Manifold`, `NoError`, genus 0, 5235 vertices, and 10466 facets. Exact STL audit found one component, zero bad edges, Euler characteristic 2, and bounds `Y=-17.4…11.2`, `Z=0…11.9`. Shared-interface regression rendered all six older production accessories plus the skill example; every target passed, and all seven legacy STL SHA-256 hashes remained byte-identical.
  ZH: 目标 F6 验证报告零 warning/assertion、`Manifold`、`NoError`、genus 0、5235 个顶点与 10466 个面。精确 STL 审计得到 1 个连通体、0 条坏边、Euler characteristic（欧拉特征数）2，以及 `Y=-17.4…11.2`、`Z=0…11.9` 包络。共享接口回归渲染了全部 6 个旧正式配件及 skill 示例；所有目标均通过，且 7 个旧 STL 的 SHA-256 保持逐字节一致。

## [2026-07-17] writeback | Prefer Ultra Short after successful print

- EN: The user reported that the Round 6 Ultra Short physical print completed successfully with very good observed print quality. Updated `wiki/accessories/hook-round6-ultra-short.md` and `wiki/index.md`; no geometry or render output changed.
  ZH: 用户反馈 Round 6 Ultra Short 实物打印成功，观察到的打印质量很好。已更新 `wiki/accessories/hook-round6-ultra-short.md` 与 `wiki/index.md`；未修改任何几何或渲染产物。
- EN: Recorded a conditional selection rule: prefer Ultra Short first for compact applications that are suitable for rail-only loading; prefer Short when wall stabilization is wanted or rail-only rotation/load behavior remains uncertain. The successful print validates manufacturability for the current setup but does not establish rail seating, real-item clearance, or a load rating.
  ZH: 记录条件性选型规则：适合由轨道单独承载的紧凑应用优先考虑 Ultra Short；需要墙面稳定作用，或轨道单独承载后的转动/承载表现仍不确定时，优先选择 Short。本次打印成功验证了当前配置下的可制造性，但不构成轨道就位、真实挂物净空或承载额定结论。

## [2026-07-17] writeback | Confirm Ultra Short rail seating

- EN: The user confirmed that Round 6 Ultra Short seats in the rail very well and judges its capacity superior to the long-plate rail-only path. Updated the accessory page and index to close unloaded rail seating and make Ultra Short the current preferred compact candidate.
  ZH: 用户确认 Round 6 Ultra Short 卡入轨道的效果非常好，并判断其承重优于长板的轨道单独承载路径。已更新配件页面与索引，关闭无载轨道就位问题，并将 Ultra Short 定为当前优先的紧凑候选。
- EN: Recorded the mechanics boundary explicitly: a shorter perpendicular lever arm reduces torque (`τ=r⊥F`), supporting the shorter local plate/root path; however, the unchanged 25 mm horizontal reach and removed wall contact mean the numeric capacity advantage still requires progressive load testing. No geometry or render output changed.
  ZH: 已明确记录力学边界：更短的垂直有效力臂会降低力矩（`τ=r⊥F`），支持更短的局部板身/根部路径；但 25 mm 水平悬出保持不变，且抵墙支点已删除，因此具体承重优势仍需逐级承载测试量化。未修改任何几何或渲染产物。

## [2026-07-17] refactor | Separate the J-hook helper from the rail interface

- EN: Moved unchanged `j_hook_body()` code from `lib/rail-mount.scad` into new `lib/j-hook.scad`; updated Classic, Wide 25, and the repository skill example to include the J helper. Non-J accessories still include the fixed rail interface directly. Added the byte-identical skill copy and documented both canonical pairs in `SKILL.md`, the READMEs, `wiki/topics/library-architecture.md`, `wiki/topics/render-validation-strategy.md`, `wiki/outputs/hook-scad-v1.md`, and `wiki/index.md`.
  ZH: 将未改变的 `j_hook_body()` 代码从 `lib/rail-mount.scad` 迁入新建的 `lib/j-hook.scad`；Classic、Wide 25 与仓库 skill 示例改为 include J 辅助库。非 J 配件仍直接 include 固定轨道接口。新增逐字节一致的 skill 副本，并在 `SKILL.md`、双语 README、`wiki/topics/library-architecture.md`、`wiki/topics/render-validation-strategy.md`、`wiki/outputs/hook-scad-v1.md` 与 `wiki/index.md` 中记录两组 canonical pair（权威文件对）。
- EN: At the user's request, rendered all seven production accessories and the skill example. Every target completed with no warning/assertion and reported `Manifold`, `NoError`, genus 0. All eight STL SHA-256 hashes matched their pre-refactor baselines exactly; both production/skill library pairs also pass `cmp -s`.
  ZH: 按用户要求渲染全部 7 个正式配件及 skill 示例。每个目标均在零 warning/assertion 下完成，并报告 `Manifold`、`NoError`、genus 0。8 个 STL 的 SHA-256 全部与重构前基线完全一致；两组 production/skill 库文件也均通过 `cmp -s`。

## [2026-07-21] query | Session start: full wiki read before new design

- EN: Read `wiki/index.md`, `AGENTS.md`, both topic pages (`hook-replication-requirements`, `render-validation-strategy`, `library-architecture`), both entity pages (`rail-hook`, `mounting-rail`), `catalog/accessories.toml`, both production libraries, and the `wallboard-rail-mount` SKILL.md to re-establish project context. No pages changed; the user is preparing a new design.
  ZH: 阅读了 `wiki/index.md`、`AGENTS.md`、三个 topic page（`hook-replication-requirements`、`render-validation-strategy`、`library-architecture`）、两个 entity page（`rail-hook`、`mounting-rail`）、`catalog/accessories.toml`、两个正式库以及 `wallboard-rail-mount` 的 SKILL.md，重新建立项目上下文。未修改任何页面；用户正准备开始新设计。
