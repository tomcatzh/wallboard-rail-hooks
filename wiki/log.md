---
title: "Activity Log"
type: log
status: active
updated: 2026-07-09
---

# Activity Log（活动日志）

EN: Append-only chronological log of all wiki operations. Newest entries at the bottom.
ZH: 所有 wiki 操作的 append-only（只追加）时间顺序 log（日志）。新条目追加到底部。

## [2026-07-09] bootstrap | Initialize LLM Wiki skeleton

- EN: Created `wiki/index.md`, `wiki/log.md`, `wiki/sources.md`, and empty `wiki/topics/`, `wiki/entities/`, `wiki/outputs/` directories.
  ZH: 创建了 `wiki/index.md`、`wiki/log.md`、`wiki/sources.md` 以及空的 `wiki/topics/`、`wiki/entities/`、`wiki/outputs/` 目录。
- EN: Created `AGENTS.md` with the LLM Wiki operating rules; added `AGENTS.md` as a thin pointer to `AGENTS.md`.
  ZH: 创建了 `AGENTS.md` 记录 LLM Wiki 操作规则；添加 `AGENTS.md` 作为指向 `AGENTS.md` 的 thin pointer（薄指针）。
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
- EN: Created the reusable skill `.agents/skills/wallboard-rail-mount/`: SKILL.md (fixed-vs-flexible contract, dims table with rationale, docker render command, print rules) + `rail-mount.scad` (complete code: FIXED `rail_mount_pts()` outline + `rail_accessory()` extruder with side chamfers + replaceable example J body). Skill's scad render-verified: zero warnings, echoes 7.35 / 2.2 / cap 3.0 / pad 3.0.
  ZH: 创建可复用 skill `.agents/skills/wallboard-rail-mount/`：SKILL.md（固定/灵活约定、带理由的尺寸表、docker 渲染命令、打印规则）+ `rail-mount.scad`（完整代码：固定的 `rail_mount_pts()` 轮廓 + 带侧倒角的 `rail_accessory()` 挤出模块 + 可替换的 J 钩示例躯干）。skill 内代码已渲染验证：零 warning，echo 7.35 / 2.2 / 帽 3.0 / 凸台 3.0。
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

## [2026-07-09] writeback | Git repository initialized; artifact policy

- EN: `git init` (branch main) at the user's request; initial commit contains `hook.scad`, `wiki/`, `raw/`, `AGENTS.md`, `AGENTS.md`. Policy decided: `wiki/` is always committed (it is the documentation and decision record); `out/` is gitignored — every artifact there regenerates from `hook.scad` via the docker `scad-render` command. For public sharing, distribute STLs via releases (or a deliberate snapshot dir), not by tracking `out/`; review `raw/` home photos before publishing.
  ZH: 应用户要求 `git init`（main 分支）；初始提交包含 `hook.scad`、`wiki/`、`raw/`、`AGENTS.md`、`AGENTS.md`。策略定案：`wiki/` 永远入库（它就是文档与决策记录）；`out/` 进 gitignore —— 其中所有产物都可由 `hook.scad` 经 docker `scad-render` 一键重渲。若公开分发，STL 走 release（或刻意的快照目录），不跟踪 `out/`；公开前自查 `raw/` 的家中照片。
