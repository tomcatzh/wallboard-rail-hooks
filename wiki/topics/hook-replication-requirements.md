---
title: "Hook Replication Requirements"
type: topic
status: active
sources:
  - raw/rail/hook-mount-dimensions.jpg
  - raw/rail/hook-installed-on-rail.jpg
  - raw/rail/hook-full-view.jpg
updated: 2026-07-10
---

# Hook Replication Requirements（挂钩复刻需求）

## Summary（摘要）

EN: Goal: replicate the rail hook (see [rail-hook](../entities/rail-hook.md)) so it clips onto the existing wall rail. The user's binding constraints (chat, 2026-07-09): the wall-embedded mounting interface must follow the measured dimensions exactly — no creative deviation; the overall height and the protruding J-hook are variable parts and may be adapted. A v1 OpenSCAD model exists — see [hook-scad-v1](../outputs/hook-scad-v1.md).
ZH: 目标：复刻这个轨道挂钩（见 [rail-hook](../entities/rail-hook.md)），使其能扣到既有墙板挂条上。用户的硬性约束（2026-07-09 对话）：嵌入墙板的安装接口必须完全按测量尺寸复刻 —— 不允许自行创新；总高与外伸的 J 钩是可变部分，可以调整。第一版 OpenSCAD 模型已完成 —— 见 [hook-scad-v1](../outputs/hook-scad-v1.md)。

## Hard Constraints（硬性约束）

- EN: The "embedded part" = the mounting head: rear finger + slot + bridge arm + the plate section that overlaps the rail. Its cross-section must honor D1 = 2.40 mm (finger), D2 = 2.75 mm (slot gap), D3 = 7.35 mm (total depth) exactly, plus the vertical claw dimensions once measured.
  ZH: “嵌入部分” = 安装头：后爪指 + 槽 + 顶桥 + 与挂条重叠的主板段。其截面必须严格满足 D1 = 2.40 mm（爪指）、D2 = 2.75 mm（槽宽）、D3 = 7.35 mm（总深），外加待实测的竖直尺寸。
- EN: No invented geometry in the embedded part; where a needed number is missing, measure — do not guess.
  ZH: 嵌入部分不允许发明几何；缺必要数字时要实测 —— 不要猜。
- EN: Variable parts (user, 2026-07-09): the overall height and the protruding J-hook may be changed freely (e.g. for strength or printability) while keeping the general look; only the wall-mounting head is dimension-critical.
  ZH: 可变部分（用户 2026-07-09 明确）：总高与外伸的 J 钩可以自由调整（例如为了强度或可打印性），保持大致观感即可；只有挂墙的安装头是尺寸关键。

## Status（状态）

- EN: 2026-07-09 — three photos ingested; geometry understood and documented; annotated dims D1–D3 recorded and plate thickness D4 ≈ 2.2 mm derived; vertical dims estimated only. No plan and no OpenSCAD code yet (per user instruction).
  ZH: 2026-07-09 —— 三张照片已 ingest（摄入）；几何已理解并写入文档；标注尺寸 D1–D3 已记录，主板厚 D4 ≈ 2.2 mm 已推导；竖直尺寸仅有估计。尚无计划、尚无 OpenSCAD 代码（遵用户指示）。
- EN: 2026-07-09 (later) — the user reviewed two SVG side-view sketches and confirmed the understanding, including the annotation mapping (2.40 finger / 2.75 slot / 7.35 head depth) and the claw-over-lip mounting model. Scope clarified: height and J-hook variable, mounting head exact.
  ZH: 2026-07-09（稍后）—— 用户审阅了两张 SVG 侧视图草图，确认理解无误，包括标注对应（爪指 2.40 / 槽 2.75 / 安装头总深 7.35）与爪扣上唇的安装模型。范围明确：总高与 J 钩可变，安装头精确。
- EN: 2026-07-09 (later) — user green-lit modeling ("body/J rough is fine, parametric later"). `hook.scad` v1 written, rendered headless via the docker toolchain, zero warnings, dimension echoes pass. See [hook-scad-v1](../outputs/hook-scad-v1.md).
  ZH: 2026-07-09（再稍后）—— 用户放行建模（"外部挂钩做个大概，未来参数化"）。`hook.scad` v1 已完成，经 docker 工具链 headless 渲染验证，零 warning，尺寸 echo 自检通过。见 [hook-scad-v1](../outputs/hook-scad-v1.md)。
- EN: 2026-07-09 (test print) — user printed the first version and calipered the original: D7 = 8.8 (build 9.0); top cap 0.5×3.0 and wall pad 3.0 identified, both 0.8 wall-ward. hook.scad v3 models them; the earlier step-direction misreading is corrected, and a ≈25% photo-vertical foreshortening is now accounted for in remaining estimates.
  ZH: 2026-07-09（试打印后）—— 用户打印初版并对原件卡尺复测：D7 = 8.8（按 9.0 建模）；确认顶部小帽 0.5×3.0 与抵墙凸台 3.0，均向墙凸 0.8。hook.scad v3 已建模；纠正了此前台阶方向误读，其余照片估计按 ≈25% 竖直透视压缩重新理解。
- EN: 2026-07-09 (fit success) — the v3 print seats correctly on the real rail ("效果不错"). Width measured 11.9, now the `hook_w` default. The validated mount interface was extracted into the reusable `wallboard-rail-mount` skill.
  ZH: 2026-07-09（试装成功）—— v3 打印件在真实挂条上正确就位（“效果不错”）。宽度实测 11.9，已设为 `hook_w` 默认值。验证过的安装接口已沉淀为可复用的 `wallboard-rail-mount` skill。
- EN: 2026-07-10 — the 2.0 mm lower wall-contact reach was selected from a 2.0/2.5 mm fit pair and integrated into the shared production library. The repository-canonical skill lives at `.agents/skills/wallboard-rail-mount/` and is synchronized with the production library.
  ZH: 2026-07-10 —— 从 2.0/2.5 mm 试装对照中定案 2.0 mm 下方抵墙凸高，并将其并入共享正式库。仓库内权威 skill 位于 `.agents/skills/wallboard-rail-mount/`，并与正式库保持同步。

## Measurement Wishlist（待测量清单）

EN: Caliper measurements needed before modeling (dimension IDs refer to the table in [rail-hook](../entities/rail-hook.md)). After the 2026-07-09 scope clarification, only the mounting head is fit-critical; everything else is optional.
ZH: 建模前需要的卡尺实测（尺寸编号对应 [rail-hook](../entities/rail-hook.md) 的表格）。2026-07-09 范围明确后，只有安装头是配合关键；其余为可选。

EN: Critical (mounting head):
ZH: 关键（安装头）：

1. EN: ~~Finger length (D6)~~ — DONE 2026-07-09: claw total (arm+finger) measured ≈9.0 → finger 6.75, built.
   ZH: ~~爪指长度（D6）~~ —— 已完成（2026-07-09）：爪部总高（顶桥+爪指）实测 ≈9.0 → 爪指 6.75，已建模。
2. EN: Bridge-arm thickness (D5) — still an estimate but tightly bounded: the measured 9.0 total with the user's 6.75 split implies ≈2.2–2.25 (model keeps 2.2).
   ZH: 顶桥厚度（D5）—— 仍是估计但已被强约束：实测总高 9.0 与用户拆分 6.75 意味着 ≈2.2–2.25（模型保持 2.2）。
3. EN: Plate thickness (confirm derived D4 ≈ 2.2 mm).
   ZH: 主板厚度（验证推导的 D4 ≈ 2.2 mm）。
4. EN: ~~Plate extension above the bridge arm (D7)~~ — DONE 2026-07-09: measured 8.8, built as 9.0.
   ZH: ~~主板高出顶桥的高度（D7）~~ —— 已完成（2026-07-09）：实测 8.8，按 9.0 建模。
5. EN: Wall-pad top edge below the ceiling (D13 position; model default 8.0) and the rail strip's bottom-edge height — confirms the pad clears the strip.
   ZH: 抵墙凸台上缘到槽顶的距离（D13 位置；模型默认 8.0）及挂条下缘高度 —— 确认凸台让开挂条。

EN: Optional (variable body — measure only to match the original look):
ZH: 可选（可变部分 —— 只在想还原原件观感时才测）：

6. EN: ~~Hook width (D10)~~ — DONE 2026-07-09: measured 11.9. Remaining optional: overall height (D9); J radius/wall (D11, D12); serration (D8, D14).
   ZH: ~~挂钩宽度（D10）~~ —— 已完成（2026-07-09）：实测 11.9。其余可选：总高（D9）；J 钩半径/壁厚（D11、D12）；锯齿（D8、D14）。

## Resolved（已解决）

- EN: 2026-07-09 — annotation interpretation confirmed by the user via sketch review (2.40 = finger, 2.75 = slot gap, 7.35 = total head depth; claw-over-lip mounting).
  ZH: 2026-07-09 —— 标注解读经用户看图确认（2.40 = 爪指、2.75 = 槽宽、7.35 = 安装头总深；爪扣上唇的安装方式）。

## Open Questions（开放问题）
- EN: Fabrication material/process for the replica (3D print assumed): a printed claw with ~2.2–2.4 mm walls needs a strength check later — recorded as a consideration, not a plan.
  ZH: 复刻件的材料/工艺（假定 3D 打印）：约 2.2–2.4 mm 壁厚的打印爪后续需要强度确认 —— 仅记录为注意事项，不是计划。
- EN: Should print tolerance/shrinkage compensation apply to D1–D3, or are the nominals used verbatim? The user said replicate exactly; treat nominals as authoritative until the user says otherwise.
  ZH: D1–D3 是否要做打印公差/收缩补偿，还是严格用名义值？用户要求精确复刻；在用户另行说明前，以名义值为准。
