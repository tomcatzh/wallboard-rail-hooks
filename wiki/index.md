---
title: "Wiki Index"
type: index
status: active
updated: 2026-07-17
---

# Wiki Index（维基索引）

## Summary（摘要）

EN: Top-level content map for the `work-hook` LLM Wiki. Read this first at the start of a session.
ZH: `work-hook` LLM Wiki 的顶层内容地图。每次会话开始时先读这个。

## Structure（结构）

- EN: `raw/` — immutable raw sources.
  ZH: `raw/` — 不可变的 raw source（原始来源）。
- EN: `raw/rail/` and `raw/accessories/<id>/` — rail-wide references and accessory-specific references.
  ZH: `raw/rail/` 与 `raw/accessories/<id>/` —— 分别保存轨道通用参考资料与配件专属参考资料。
- EN: `wiki/accessories/` — current per-accessory design and verification pages.
  ZH: `wiki/accessories/` —— 现行各配件的设计与验证页面。
- EN: `wiki/topics/` — topic pages (concepts, workflows, comparisons).
  ZH: `wiki/topics/` — topic page（主题页）。
- EN: `wiki/entities/` — entity pages (people, projects, products, systems).
  ZH: `wiki/entities/` — entity page（实体页）。
- EN: `wiki/outputs/` — synthesized answers or deliverables written back from queries.
  ZH: `wiki/outputs/` — 从 query（查询）中 writeback（回写）的综合答案或交付物。
- EN: `wiki/sources.md` — registry of all raw sources.
  ZH: `wiki/sources.md` — 所有 raw source 的登记表。
- EN: `wiki/log.md` — append-only chronological activity log.
  ZH: `wiki/log.md` — 只追加的时间顺序 log（日志）。

## Topics（主题）

- EN: [hook-replication-requirements](topics/hook-replication-requirements.md) — project brief: hard constraints (embedded mounting head must be dimensionally exact), status, measurement wishlist.
  ZH: [hook-replication-requirements](topics/hook-replication-requirements.md) —— 项目简报：硬性约束（嵌入安装头必须尺寸精确）、状态、待测量清单。
- EN: [render-validation-strategy](topics/render-validation-strategy.md) — impact-scoped render matrix: body-only changes validate only the target accessory; shared-interface changes trigger full regression.
  ZH: [render-validation-strategy](topics/render-validation-strategy.md) —— 按影响面选择渲染目标：仅主体变化只验证目标配件，共享接口变化才执行全量回归。

## Entities（实体）

- EN: [rail-hook](entities/rail-hook.md) — the hook being replicated: construction (extrusion slice), full profile, dimension table D1–D14, annotation interpretation, mounting interaction.
  ZH: [rail-hook](entities/rail-hook.md) —— 被复刻的挂钩：构造（挤出型材切片）、完整截面、尺寸表 D1–D14、标注解读、安装配合。
- EN: [mounting-rail](entities/mounting-rail.md) — the wall rail the hook clips onto: observed features, interface constraints implied by the hook.
  ZH: [mounting-rail](entities/mounting-rail.md) —— 挂钩所扣的墙面挂条：观察到的特征、由挂钩反推的接口约束。

## Outputs（产物）

- EN: [hook-scad-v1](outputs/hook-scad-v1.md) — the model's full version history v1→v7; current shared library includes the selected full-width 2.0 mm lower wall-contact face used by all production accessories.
  ZH: [hook-scad-v1](outputs/hook-scad-v1.md) —— 模型完整版本史 v1→v7；现行共享库已包含定案的全宽 2.0 mm 下方抵墙承压面，供全部正式配件共用。
- EN: [hook-wide25](accessories/hook-wide25.md) — 25 mm-span J hook (`accessories/hooks/wide-25.scad`), plastic-sized sections (shank 4.4, J wall 4.6/3.2) with the moment math.
  ZH: [hook-wide25](accessories/hook-wide25.md) —— 25 mm 大跨 J 钩（`accessories/hooks/wide-25.scad`），按塑料重配截面（杆身 4.4、J 壁 4.6/3.2），附弯矩计算。
- EN: [hook-round6](accessories/hook-round6.md) — experimental 25 mm-span J hook (`accessories/hooks/round-6.scad`) with a centered, unthreaded Ø6 mm round rod, spherical tip, broad load-spreading root, and support-aware print notes.
  ZH: [hook-round6](accessories/hook-round6.md) —— 实验性 25 mm 大跨 J 钩（`accessories/hooks/round-6.scad`），采用居中的无螺纹 Ø6 mm 圆杆、球面圆头、宽根部传力过渡，并记录支撑打印要求。
- EN: [hook-round6-short](accessories/hook-round6-short.md) — independent minimum-height sibling (`accessories/hooks/round-6-short.scad`) with one native section-ring polyhedron from an exact 11.9 mm D-shaped root to the Ø6 / 25 mm circular J envelope. The root shares the mount's `Z=0…11.9` print faces, uses a full-width flat bottom, and keeps its upper extent at the 3 mm rod radius; the lower path remains on `Y=-22.4` until the true J bottom at 270°, without replacing `hook-round6`.
  ZH: [hook-round6-short](accessories/hook-round6-short.md) —— 独立最短板兄弟版本（`accessories/hooks/round-6-short.scad`），用一个原生截面环 polyhedron 从精确 11.9 mm 宽 D 形根部连续收细到 Ø6 / 25 mm 圆形 J 钩包络。根部与安装头共用 `Z=0…11.9` 打印平面，采用满宽平底，同时把上侧伸出保持为圆杆 3 mm 半径；下侧路径一直保持 `Y=-22.4`，直到 270° 的 J 钩真正最低点，且不替代 `hook-round6`。
- EN: [hook-round6-ultra-short](accessories/hook-round6-ultra-short.md) — successfully printed, excellent-seating, rail-only 28.6 mm-tall experiment (`accessories/hooks/round-6-ultra-short.scad`) that passes `wall_contact=false`, raises the unchanged Ø6 / 25 mm J envelope by exactly 5 mm, and aligns its 3.0 / 6.4 / 11.9 mm D root and J bottom to a new flat `Y=-17.4` datum. It is the preferred compact candidate; its shorter unsupported plate/root path is expected to outperform a longer rail-only plate, while a numeric load advantage remains unquantified.
  ZH: [hook-round6-ultra-short](accessories/hook-round6-ultra-short.md) —— 已成功打印、轨道卡入优秀、仅由轨道承载的 28.6 mm 高实验版（`accessories/hooks/round-6-ultra-short.scad`）；它传入 `wall_contact=false`，把不变的 Ø6 / 25 mm J 钩包络精确抬高 5 mm，并将 3.0 / 6.4 / 11.9 mm D 形根部与 J 钩最低点对齐到新的 `Y=-17.4` 平底基准。它是当前优先的紧凑候选；更短的无支撑板身/根部路径预计优于长板的轨道单独承载方案，但具体承重优势尚未量化。
- EN: [hook-keyhole9](accessories/hook-keyhole9.md) — compact keyhole-plate accessory (`accessories/pegs/keyhole-9.scad`) with a 34.7 mm vertical envelope, 8 mm projection, Ø9 head, Ø3.8 capture neck, and Ø7 reinforced root.
  ZH: [hook-keyhole9](accessories/hook-keyhole9.md) —— 紧凑 keyhole plate（钥匙孔挂片）配件（`accessories/pegs/keyhole-9.scad`），竖向包络 34.7 mm、凸出 8 mm，采用 Ø9 头、Ø3.8 捕获颈与 Ø7 加强根部。
- EN: [frame-ribba22](accessories/frame-ribba22.md) — physically installed pair-use 24 mm-wide saddle (`accessories/frames/ribba-22.scad`) for the measured 22 mm recessed back of an old IKEA RIBBA 18288 frame; the raised free bearing edge is 12 mm below the fixed mount top, the frame conceals the installed mounts, and a full-width 13 × 10 mm gusset uses tangent R1.5 concave inner fillets.
  ZH: [frame-ribba22](accessories/frame-ribba22.md) —— 已完成成对实装的 24 mm 宽托架（`accessories/frames/ribba-22.scad`），用于旧款 IKEA RIBBA 18288 相框实测 22 mm 凹背；抬高后的自由端上缘距固定安装头顶部 12 mm，挂装后托架可被相框遮住，并采用带相切 R1.5 内弧的全宽 13 × 10 mm 斜撑。
- EN: [hook-classic-wallpad-fit-pair](outputs/hook-classic-wallpad-fit-pair.md) — superseded A/B decision record: the otherwise-identical 2.0/2.5 mm half-width probes established 2.0 mm as the production reach.
  ZH: [hook-classic-wallpad-fit-pair](outputs/hook-classic-wallpad-fit-pair.md) —— 已完成的 A/B 决策记录：其余几何相同的 2.0/2.5 mm 半宽探针最终定案 2.0 mm 为正式凸高。
- EN: [hook-strength-review](outputs/hook-strength-review.md) — load model, 5 stress hotspots (governing: 1.8 mm shank below the step), sustained-load rating (~1.5–2 kg PETG as-is), fillet/thickening recommendations.
  ZH: [hook-strength-review](outputs/hook-strength-review.md) —— 受力模型、5 个应力集中点（决定性弱点：台阶下 1.8 mm 杆身）、持续承载评级（原样 PETG 约 1.5–2 kg）、圆角/加厚建议。
- EN: `wallboard-rail-mount` skill — repository-canonical reusable workflow at `.agents/skills/wallboard-rail-mount/`, including the byte-identical library, 2.0 mm contact contract, Docker verification, and a runnable example.
  ZH: `wallboard-rail-mount` skill —— 仓库内权威可复用工作流，位于 `.agents/skills/wallboard-rail-mount/`，包含字节一致的库、2.0 mm 接触约定、Docker 验证流程及可运行示例。
- EN: `catalog/accessories.toml` — machine-readable registry for current accessory IDs, family paths, output stems, status, and support requirements.
  ZH: `catalog/accessories.toml` —— 当前配件 ID、family 路径、输出名、状态与支撑要求的机器可读登记表。

## Open Questions（开放问题）

- EN: D6 (`finger_len`) and D7 (`plate_above`) are settled from caliper measurements. D5 (`arm_t`) remains an inferred 2.2 mm value; a direct rail-profile measurement would improve future variants but does not block the validated rail fit. See [hook-replication-requirements](topics/hook-replication-requirements.md).
  ZH: D6（`finger_len`）与 D7（`plate_above`）已由卡尺实测定案。D5（`arm_t`）仍为推定的 2.2 mm；直接测得轨道截面可改进未来变体，但不阻塞当前已验证的轨道配合。见 [hook-replication-requirements](topics/hook-replication-requirements.md)。
- EN: The version 7 full-width wall-contact update still needs physical seating and load verification before contact-dependent load ratings are treated as validated.
  ZH: v7 全宽抵墙承压面仍需完成实物就位和承载验证，之后才能把依赖接触的承载评级视为已验证。
- EN: Interpretation confirmed 2026-07-09; overall height, J-hook, and width are variable by design — no longer blocking. See [rail-hook](entities/rail-hook.md).
  ZH: 标注解读已于 2026-07-09 确认；总高、J 钩、宽度为设计可变 —— 不再是阻塞项。见 [rail-hook](entities/rail-hook.md)。
