---
title: "hook-round6-short — minimum-height Ø6 mm round-rod J hook"
type: output
status: active
sources:
  - raw/rail/hook-installed-on-rail.jpg
updated: 2026-07-17
---

# hook-round6-short（最短板 Ø6 mm 圆杆 J 钩）

## Summary（摘要）

EN: [`accessories/hooks/round-6-short.scad`](../../accessories/hooks/round-6-short.scad) is an independent compact sibling of [hook-round6](hook-round6.md), not a replacement. The original `round-6.scad` remains unchanged for A/B comparison. Short preserves the fixed rail claw, 2.0 mm lower wall-contact face, centered plain Ø6 load-bearing section, 25 mm circular J envelope, original bottom/front path, and rounded endpoint, while lifting the J bottom to the fixed interface's minimum body datum.
ZH: [`accessories/hooks/round-6-short.scad`](../../accessories/hooks/round-6-short.scad) 是 [hook-round6](hook-round6.md) 的独立紧凑兄弟版本，不是替代品。原 `round-6.scad` 保持不变，供 A/B comparison（对照比较）。Short 版保留固定轨道卡爪、2.0 mm 下方抵墙承压面、居中的普通 Ø6 承载截面、25 mm 圆形 J 钩包络、原有底部/前部路径与圆头，同时把 J 钩最低点抬到固定接口允许的最低主体基准。

EN: The separate [hook-round6-ultra-short](hook-round6-ultra-short.md) experiment raises the same J envelope another 5 mm by disabling the lower wall-contact face. It does not supersede this physically printed wall-contact version.
ZH: 独立的 [hook-round6-ultra-short](hook-round6-ultra-short.md) 实验版通过关闭下方抵墙面，把相同 J 钩包络再抬高 5 mm。它不替代这个已经完成实物打印的抵墙版本。

## Compactness Decision（紧凑化决定）

- EN: The fixed pressure-pad contract requires the body to reach `body_back_y=-22.4`, preserving the complete 1.2 mm lower ramp and its 0.2 mm clearance. That is the minimum legal lower datum without changing the shared interface.
  ZH: 固定承压面约定要求主体到达 `body_back_y=-22.4`，以保留完整的 1.2 mm 下过渡及其 0.2 mm 净空。在不修改共享接口的前提下，这就是允许的最低基准。
- EN: Set the J center to `Y=-9.9`, so its 12.5 mm outer radius ends exactly at `Y=-22.4`. The round hook and fixed plate therefore share one lowest datum; neither extends unnecessarily below the other.
  ZH: 将 J 钩中心设为 `Y=-9.9`，使其 12.5 mm 外半径精确终止于 `Y=-22.4`。圆钩与固定竖板因此共用同一个最低基准，两者都不会无意义地向另一方下方延伸。
- EN: Use one native OpenSCAD `polyhedron()` built from matched section rings. Its plate root is a D profile with 3.0 / 7.1 / 11.9 mm upper/lower/width extents: the curved upper half never rises beyond the Ø6 rod radius, while the full-width sides and flat bottom remain exactly within the plate's `Z=0…11.9` print faces. The same polyhedron embeds 0.6 mm into the plate and holds that D section for 0.4 mm beyond the front face, so no separate overlap core is needed.
  ZH: 使用一个由对应截面环生成的原生 OpenSCAD `polyhedron()`。其贴板根部采用 D 形截面，上侧/下侧/宽度伸出为 3.0 / 7.1 / 11.9 mm：弯曲上半部不高于 Ø6 圆杆半径，满宽直边和平底则严格保持在底板 `Z=0…11.9` 打印平面之内。同一个 polyhedron 向底板内嵌入 0.6 mm，并在底板正面之外保持该 D 形截面 0.4 mm，因此不再需要独立重叠芯。
- EN: A single global parameter controls centerline progress and section morphing; there is no intermediate seam. Each transition ring solves its lower extent so the world-space lowest path remains exactly at `Y=-22.4`. The cubic-Bezier centerline reaches the original circular J path only at its true 270° bottom, with matched tangent and curvature; fifth-order smoothstep morphing has zero first and second derivatives at both the D root and Ø6 join. The former rear hook underside is therefore fully absorbed into the plate-root body.
  ZH: 由单一全局参数控制中心线前进与截面变形，不存在中间接缝。每个过渡截面环都反算下侧伸出，使世界坐标最低路径精确保持在 `Y=-22.4`。cubic-Bezier（三次贝塞尔）中心线直到原圆形 J 路径的 270° 真正最低点才以匹配的切线与曲率接入；五阶 smoothstep（平滑阶跃）变形在 D 形根部与 Ø6 接入端均具有零一阶、零二阶导数。因此原本靠墙侧可见的挂钩底弧已完全被贴板根部主体吸收。
- EN: The hemispherical free end is integrated into the same section-ring mesh instead of unioning a separate equal-radius sphere at the final ring. This avoids the tangent Boolean degeneracy that produced a manifold-looking but high-genus intermediate mesh.
  ZH: 自由端半球直接并入同一截面环网格，而不是在末端圆环上并入一个同半径独立球体。这样避免了相切 Boolean（布尔运算）退化；该退化曾生成外观看似流形、实际 genus 很高的中间网格。

| Metric | Original Round 6 | Round 6 Short | Change |
|---|---:|---:|---:|
| Overall height | 47.7 mm | 33.6 mm | −14.1 mm / −29.6% |
| J center `Y` | −24.0 mm | −9.9 mm | +14.1 mm |
| Lowest `Y` | −36.5 mm | −22.4 mm | aligned to fixed body |
| Rod / outer span | Ø6 / 25 mm | Ø6 / 25 mm | unchanged |
| Plate-root upper / lower / width | — | 3.0 / 7.1 / 11.9 mm | flat bottom; coplanar print sides |
| Side-print support gap | 2.95 mm | 2.95 mm | unchanged |

EN: The 33.6 mm result equals the unchanged fixed mount envelope from `body_back_y=-22.4` to `y_top=11.2`. Further vertical reduction would require changing the validated pressure-pad/interface contract or reducing the functional J envelope, neither of which is in scope for this variant.
ZH: 33.6 mm 的结果等于未改动固定安装接口从 `body_back_y=-22.4` 到 `y_top=11.2` 的包络。若要继续缩短，就必须修改已验证的承压面/接口约定，或缩小 J 钩功能包络；这两项均不属于本变体范围。

## Strength And Clearance（强度与净空）

- EN: The Ø6 circular load-bearing section and 25 mm outer envelope are unchanged, so the Short variant does not receive a higher load rating. The full-width D root and completely filled bottom path are intended to distribute plate load without adding unused upper volume or leaving an exposed rear underside transition. No FEA or physical load test has quantified the benefit; begin with light static loads.
  ZH: Ø6 圆形承载截面与 25 mm 外包络均未改变，因此 Short 版不会因此直接获得更高承载额定。满宽 D 形根部与完全填满的底部路径旨在扩散贴板载荷，同时不在上方增加无用体积，也不保留外露的后侧底部过渡。尚无 FEA（有限元分析）或实物承载测试量化收益；应从轻载静置开始。
- EN: The raised spherical tip remains on the room side and its highest point is `Y=-2.885`, leaving about 2.885 mm below the slot-ceiling datum `Y=0`. The root's clean upper edge begins at `Y=-12.3`, well below the rail-zone lower datum `Y=-8`.
  ZH: 抬高后的球面圆头仍位于房间侧，其最高点为 `Y=-2.885`，距槽口顶部基准 `Y=0` 仍约有 2.885 mm。根部清爽的上缘起点为 `Y=-12.3`，明显低于轨道区域下基准 `Y=-8`。

## Printing（打印）

- EN: Use the same mount side-face-down orientation as the original Round 6. The D root and fixed mount share the exact `Z=0…11.9` bounds, so the mount remains directly on the bed; only the centered round body and spherical tip need localized support for their 2.95 mm gap.
  ZH: 使用与原 Round 6 相同的安装头侧面朝下姿态。D 形根部与固定安装头共用精确 `Z=0…11.9` 包络，因此安装头仍可直接落在热床上；只有高出 2.95 mm 的居中圆杆与球面圆头需要局部支撑。
- EN: Prefer PETG or ASA and at least four perimeters. Treat the first print as a fit and light-load specimen, with special attention to support removal and the compact root/plate junction.
  ZH: 优先使用 PETG 或 ASA，并至少设置四圈壁。首件应视为配合与轻载样件，重点检查支撑拆除以及紧凑根部与竖板的连接处。

## Verification（验证）

- EN: Impact-scoped Docker validation rendered only `hook-round6-short`; the original Round 6 and shared library were unchanged. Final F6 rendering completed with no warnings or assertions and reported `Manifold`, `NoError`, genus 0, 5170 vertices, and 10336 facets.
  ZH: 按影响范围仅渲染 `hook-round6-short`；原 Round 6 与共享库均未修改。最终 F6 渲染零 warning、零 assertion 完成，并报告 `Manifold`、`NoError`、genus 0、5170 个顶点与 10336 个面。
- EN: An exact-coordinate STL audit found one connected component, zero boundary/non-manifold edges, and Euler characteristic 2. Mesh bounds are `X=-5.15…24.198854`, `Y=-22.4…11.2`, and `Z=0…11.9`, confirming the unchanged 33.6 mm height and restored coplanar print faces.
  ZH: 使用 STL 原始精确坐标检查得到 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）2。网格包络为 `X=-5.15…24.198854`、`Y=-22.4…11.2`、`Z=0…11.9`，确认总高仍为 33.6 mm，并恢复两侧共面的打印平面。
- EN: Final F6 iso and front inspection confirmed that the D root stays within both plate sides and contracts continuously to Ø6. The former separate overlap core remains absent, and the upper root remains free of a shelf or belly.
  ZH: 最终 F6 等轴与正面检查确认 D 形根部保持在底板两侧以内，并连续收细到 Ø6。先前的独立重叠芯仍已删除，根部上方也仍不存在横台或大肚鼓包。

## Lessons Learned（经验教训）

- EN: Nominal section width is not the same as final-boundary coverage. An ellipse reaches its maximum width only at its middle; when the root must cover the plate's side and bottom edges, a D profile with full-width straight sides and a flat bottom expresses the requirement directly.
  ZH: 截面标称宽度不等于最终边界覆盖。椭圆只有中部达到最大宽度；当根部必须覆盖底板左右边缘和下缘时，采用满宽直边与平底的 D 形截面，才能直接表达这一要求。
- EN: One embedded `polyhedron()` is more predictable than a visible transition plus a separate hidden overlap core. Positive-volume embed belongs inside the main loft; otherwise the helper core can show through the final union or obscure the actual exterior defect during preview.
  ZH: 单一内嵌 `polyhedron()` 比“可见过渡体 + 独立隐藏重叠芯”更可控。正体积内嵌应属于主 loft（放样体）本身；否则辅助芯可能穿出最终并集，或在预览中遮蔽真实外轮廓缺陷。
- EN: Reinforcement width must be checked against the print-bed normal, not judged only as a strength improvement. The 13.5 mm side-wrap revision looked more substantial but extended beyond the 11.9 mm mount and lifted it off the bed; restoring exact `Z=0…11.9` bounds preserved both full plate coverage and the validated side-print plane.
  ZH: 加强宽度必须沿打印热床法向检查，不能只按“看起来更强”判断。13.5 mm 侧包版本虽然更厚实，却超出 11.9 mm 安装头并把它抬离热床；恢复精确 `Z=0…11.9` 包络后，既保留完整底板覆盖，也保住了已验证的侧放打印平面。
- EN: Validation needs three layers: inspect the F6 final-union silhouette, audit exact STL topology and bounds, then confirm the result by physical printing. A manifold mesh alone cannot prove correct stress-flow shape, exterior continuity, or bed contact. The user's successful print validates the final exact-width D-root revision for the current printer, material, and slicer setup.
  ZH: 验证需要三层：检查 F6 最终并集轮廓、审计 STL 精确拓扑与包络，再用实物打印确认结果。仅有流形网格不能证明受力形态、外轮廓连续性或热床接触正确。用户打印成功，验证了最终等宽 D 形根部在当前打印机、材料与切片配置下的可打印性。

## Open Questions（开放问题）

- EN: Physical printing and support removal succeeded on the user's printer. Rail seating, clearance around real hanging items, and progressive light-load testing remain pending. Keep the original and Short models until those A/B results establish which hanging height is more useful.
  ZH: 用户的打印机已成功完成实物打印与支撑拆除。轨道就位、真实挂物净空及逐级轻载测试仍待完成。在 A/B 实测确定哪种挂物高度更实用之前，同时保留原版与 Short 版。
