---
title: "Wiki Index"
type: index
status: active
updated: 2026-07-09
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

- EN: [hook-scad-v1](outputs/hook-scad-v1.md) — the model's full version history v1→v6; current layout: `lib/rail-mount.scad` (mount library) + `hooks/hook-classic.scad` (fit-validated 17 mm design).
  ZH: [hook-scad-v1](outputs/hook-scad-v1.md) —— 模型完整版本史 v1→v6；现行布局：`lib/rail-mount.scad`（安装库）+ `hooks/hook-classic.scad`（已验证试装的 17 mm 设计）。
- EN: [hook-wide25](outputs/hook-wide25.md) — 25 mm-span J hook (`hooks/hook-wide25.scad`), plastic-sized sections (shank 4.4, J wall 4.6/3.2) with the moment math.
  ZH: [hook-wide25](outputs/hook-wide25.md) —— 25 mm 大跨 J 钩（`hooks/hook-wide25.scad`），按塑料重配截面（杆身 4.4、J 壁 4.6/3.2），附弯矩计算。
- EN: [hook-strength-review](outputs/hook-strength-review.md) — load model, 5 stress hotspots (governing: 1.8 mm shank below the step), sustained-load rating (~1.5–2 kg PETG as-is), fillet/thickening recommendations.
  ZH: [hook-strength-review](outputs/hook-strength-review.md) —— 受力模型、5 个应力集中点（决定性弱点：台阶下 1.8 mm 杆身）、持续承载评级（原样 PETG 约 1.5–2 kg）、圆角/加厚建议。
- EN: `wallboard-rail-mount` skill — the fit-validated mount interface + complete scad code, extracted for reuse at `.agents/skills/wallboard-rail-mount/` (outside this repo; body/front flexible by contract).
  ZH: `wallboard-rail-mount` skill —— 实物验证的安装接口 + 完整 scad 代码，沉淀在 `.agents/skills/wallboard-rail-mount/` 复用（在本仓库之外；按约定前部/躯干灵活）。

## Open Questions（开放问题）

- EN: D5 (arm) and D6 (finger) still unmeasured — likely ≈2.7 / ≈7 after the ≈25% foreshortening correction (D7 measured 8.8 confirms the bias). See [hook-replication-requirements](topics/hook-replication-requirements.md).
  ZH: D5（顶桥）与 D6（爪指）仍未实测 —— 按 ≈25% 透视压缩修正估计约 2.7 / 7（D7 实测 8.8 证实了该偏差）。见 [hook-replication-requirements](topics/hook-replication-requirements.md)。
- EN: Interpretation confirmed 2026-07-09; overall height, J-hook, and width are variable by design — no longer blocking. See [rail-hook](entities/rail-hook.md).
  ZH: 标注解读已于 2026-07-09 确认；总高、J 钩、宽度为设计可变 —— 不再是阻塞项。见 [rail-hook](entities/rail-hook.md)。
