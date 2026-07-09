---
title: "Mounting Rail (wall panel insert strip)"
type: entity
status: active
sources:
  - raw/assets/hook-full-view.jpg
updated: 2026-07-09
---

# Mounting Rail（墙板挂条）

## Summary（摘要）

EN: A champagne-gold aluminum strip inset horizontally into a seam of the white leather-textured wall paneling. Its front face carries fine horizontal ribs; along its top edge runs a continuous slot behind a front lip, into which claw-type hooks drop. It is existing infrastructure — the hook must adapt to it, not vice versa.
ZH: 一条水平嵌在白色皮纹墙板接缝中的香槟金色铝条。正面有细密水平棱纹；顶缘沿全长有一条位于前唇后方的连续槽，爪式挂钩由此扣入。它是既有设施 —— 是挂钩去适配它，而不是反过来。

## Observed Features（观察到的特征）

- EN: Ribbed front face; rib pitch well under 1 mm, visually matching the hook's serrated patch.
  ZH: 正面棱纹面；棱距远小于 1 mm，与挂钩的锯齿区在视觉上匹配。
- EN: A continuous dark slot line along the top edge where the hook's claw enters.
  ZH: 顶缘有一条连续深色缝线，挂钩的爪由此进入。
- EN: A smooth gold band above the ribbed strip (upper flange of the same profile, or a separate trim — undetermined).
  ZH: 棱纹条上方有一条光滑金色带（同一型材的上翻边，或独立饰条 —— 未确定）。
- EN: The strip's front face sits ≈0.8 mm proud of the wall panel — inferred 2026-07-09 from the hook's top cap and wall pad both protruding exactly 0.8 mm wall-ward.
  ZH: 挂条正面比墙板面凸出约 0.8 mm —— 2026-07-09 由挂钩顶帽与抵墙凸台均恰好向墙凸 0.8 mm 反推。
- EN: Implied clearances: the strip's bottom edge lies above the hook's wall pad (pad top ≈7–8.5 below the slot ceiling), and the panel above the strip is exposed at cap height (≈10.7–11.2 above the ceiling).
  ZH: 反推的空间关系：挂条下缘在挂钩抵墙凸台之上（凸台上缘约在槽顶下方 7–8.5）；挂条上方在顶帽高度（槽顶上方约 10.7–11.2）处露出墙板面。

## Interface Constraints Implied by the Hook（由挂钩尺寸反推的接口约束）

EN: The rail was not measured directly; these bounds follow from the hook's annotated dimensions (see [rail-hook](rail-hook.md)):
ZH: 挂条本身没有直接测量；以下边界由挂钩的标注尺寸反推（见 [rail-hook](rail-hook.md)）：

- EN: Top lip thickness < 2.75 mm (it must fit inside the claw slot).
  ZH: 上唇厚度 < 2.75 mm（要放进爪槽）。
- EN: Cavity behind the lip: ≥ ~2.4 mm front-to-back and ≥ ~6 mm deep (it must accept the claw finger).
  ZH: 上唇后方腔体：前后向 ≥ 约 2.4 mm、深度 ≥ 约 6 mm（要容纳爪指）。

## Open Questions（开放问题）

- EN: Exact rail profile (extrusion cross-section) and strip height are unknown — not required for replicating the hook, since the fit is already encoded in the hook's own dimensions.
  ZH: 挂条的精确型材截面与条高未知 —— 复刻挂钩并不需要它们，因为配合关系已经编码在挂钩自身尺寸里。
- EN: Whether the rail also has a bottom lip. (Face protrusion resolved: ≈0.8 — see Observed Features.)
  ZH: 挂条是否还有下唇。（正面凸出量已解决：≈0.8 —— 见观察特征。）
- EN: Interior headroom above the slot opening: my photo estimate put the opening at ≈4 mm, but the user (who has the rail in hand) judged a much larger reinforcement feasible — the hook's arc gusset now rises 7.2 above the ceiling inside the rail. Next test fit settles it: if the arc fouls the rail's interior or blocks tilt-in insertion, reduce `arm_gusset_r`.
  ZH: 槽口上方的内部净空：照片估计开口约 4 mm，但（手上有实物的）用户判断可以放大得多 —— 挂钩的圆弧加强现已在挂条内部升到槽顶上方 7.2。下一次试装可定案：若圆弧顶到挂条内部或妨碍斜插入，就调小 `arm_gusset_r`。
