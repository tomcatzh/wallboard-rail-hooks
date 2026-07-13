---
title: "Wiki Index"
type: index
status: active
updated: 2026-07-10
---

# Wiki Index（维基索引）

## Summary（摘要）

EN: Top-level content map for the `work-hook` LLM Wiki. Read this first at the start of a session.
ZH: `work-hook` LLM Wiki 的顶层内容地图。每次会话开始时先读这个。

## Structure（结构）

- EN: `raw/` — immutable raw sources.
  ZH: `raw/` — 不可变的 raw source（原始来源）。
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

## Entities（实体）

- EN: [rail-hook](entities/rail-hook.md) — the hook being replicated: construction (extrusion slice), full profile, dimension table D1–D14, annotation interpretation, mounting interaction.
  ZH: [rail-hook](entities/rail-hook.md) —— 被复刻的挂钩：构造（挤出型材切片）、完整截面、尺寸表 D1–D14、标注解读、安装配合。
- EN: [mounting-rail](entities/mounting-rail.md) — the wall rail the hook clips onto: observed features, interface constraints implied by the hook.
  ZH: [mounting-rail](entities/mounting-rail.md) —— 挂钩所扣的墙面挂条：观察到的特征、由挂钩反推的接口约束。

## Outputs（产物）

- EN: [hook-scad-v1](outputs/hook-scad-v1.md) — the model's full version history v1→v7; current shared library includes the selected full-width 2.0 mm lower wall-contact face used by both production hooks.
  ZH: [hook-scad-v1](outputs/hook-scad-v1.md) —— 模型完整版本史 v1→v7；现行共享库已包含定案的全宽 2.0 mm 下方抵墙承压面，供两款正式挂钩共用。
- EN: [hook-wide25](outputs/hook-wide25.md) — 25 mm-span J hook (`hooks/hook-wide25.scad`), plastic-sized sections (shank 4.4, J wall 4.6/3.2) with the moment math.
  ZH: [hook-wide25](outputs/hook-wide25.md) —— 25 mm 大跨 J 钩（`hooks/hook-wide25.scad`），按塑料重配截面（杆身 4.4、J 壁 4.6/3.2），附弯矩计算。
- EN: [hook-classic-wallpad-fit-pair](outputs/hook-classic-wallpad-fit-pair.md) — superseded A/B decision record: the otherwise-identical 2.0/2.5 mm half-width probes established 2.0 mm as the production reach.
  ZH: [hook-classic-wallpad-fit-pair](outputs/hook-classic-wallpad-fit-pair.md) —— 已完成的 A/B 决策记录：其余几何相同的 2.0/2.5 mm 半宽探针最终定案 2.0 mm 为正式凸高。
- EN: [hook-strength-review](outputs/hook-strength-review.md) — load model, 5 stress hotspots (governing: 1.8 mm shank below the step), sustained-load rating (~1.5–2 kg PETG as-is), fillet/thickening recommendations.
  ZH: [hook-strength-review](outputs/hook-strength-review.md) —— 受力模型、5 个应力集中点（决定性弱点：台阶下 1.8 mm 杆身）、持续承载评级（原样 PETG 约 1.5–2 kg）、圆角/加厚建议。
- EN: `wallboard-rail-mount` skill — repository-canonical reusable workflow at `.agents/skills/wallboard-rail-mount/`, including the byte-identical library, 2.0 mm contact contract, Docker verification, and a runnable example; mirrored to the legacy `.agents/skills/` location.
  ZH: `wallboard-rail-mount` skill —— 仓库内权威可复用工作流，位于 `.agents/skills/wallboard-rail-mount/`，包含字节一致的库、2.0 mm 接触约定、Docker 验证流程及可运行示例；同时镜像到旧的 `.agents/skills/` 位置。

## Open Questions（开放问题）

- EN: D6 (`finger_len`) and D7 (`plate_above`) are settled from caliper measurements. D5 (`arm_t`) remains an inferred 2.2 mm value; a direct rail-profile measurement would improve future variants but does not block the validated rail fit. See [hook-replication-requirements](topics/hook-replication-requirements.md).
  ZH: D6（`finger_len`）与 D7（`plate_above`）已由卡尺实测定案。D5（`arm_t`）仍为推定的 2.2 mm；直接测得轨道截面可改进未来变体，但不阻塞当前已验证的轨道配合。见 [hook-replication-requirements](topics/hook-replication-requirements.md)。
- EN: The version 7 full-width wall-contact update still needs physical seating and load verification before contact-dependent load ratings are treated as validated.
  ZH: v7 全宽抵墙承压面仍需完成实物就位和承载验证，之后才能把依赖接触的承载评级视为已验证。
- EN: Interpretation confirmed 2026-07-09; overall height, J-hook, and width are variable by design — no longer blocking. See [rail-hook](entities/rail-hook.md).
  ZH: 标注解读已于 2026-07-09 确认；总高、J 钩、宽度为设计可变 —— 不再是阻塞项。见 [rail-hook](entities/rail-hook.md)。
