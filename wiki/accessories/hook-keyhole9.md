---
title: "hook-keyhole9 — short Ø9/Ø3.8 mushroom peg"
type: output
status: active
sources:
  - raw/accessories/hook-keyhole9/reference.jpg
  - https://www.hangmanproducts.com/shop/p/keyhole-hangers
updated: 2026-07-14
---

# hook-keyhole9（Ø9/Ø3.8 短蘑菇头）

## Summary（摘要）

EN: [`accessories/pegs/keyhole-9.scad`](../../accessories/pegs/keyhole-9.scad) is a short mushroom peg for the keyhole hanger plate in [`raw/accessories/hook-keyhole9/reference.jpg`](../../raw/accessories/hook-keyhole9/reference.jpg). A keyhole plate first passes its large opening over a screw-like head, then slides so the narrow slot captures the smaller neck. The user measured the openings as approximately 9.5 and 4.0 mm and selected a Ø9.0 mm head, Ø3.8 mm neck, and 8.0 mm total projection.
ZH: [`accessories/pegs/keyhole-9.scad`](../../accessories/pegs/keyhole-9.scad) 是为 [`raw/accessories/hook-keyhole9/reference.jpg`](../../raw/accessories/hook-keyhole9/reference.jpg) 中 keyhole hanger plate（钥匙孔挂片）设计的短蘑菇头。挂片先让大孔越过类似螺丝的头部，再下移，使窄槽捕获较细的颈部。用户实测两段开口约为 9.5 与 4.0 mm，并选定 Ø9.0 mm 头、Ø3.8 mm 颈及 8.0 mm 总凸出。

## Fit And Geometry（配合与几何）

- EN: The nominal large-opening clearance is 0.5 mm total (`9.5-9.0`); narrow-slot clearance is 0.2 mm total (`4.0-3.8`). These are user-selected body dimensions, not changes to the fixed rail interface.
  ZH: 大孔名义总间隙为 0.5 mm（`9.5-9.0`）；窄槽名义总间隙为 0.2 mm（`4.0-3.8`）。这些是用户选定的主体尺寸，不是对固定 rail interface（轨道接口）的修改。
- EN: Total projection from the reinforced body front to the head tip is exactly 8.0 mm. The head is 2.4 mm thick: a 1.6 mm cylindrical land provides the flat rear retaining shoulder, followed by a shallow 0.8 mm ellipsoidal front dome.
  ZH: 从加强主体正面到头部最前端的总凸出严格为 8.0 mm。头部厚 2.4 mm：其中 1.6 mm 圆柱段形成平直的后侧锁止肩，前端再接 0.8 mm 浅椭球圆顶。
- EN: Only the 3.0 mm segment beside the head remains Ø3.8. Toward the mount it expands through a 1.2 mm taper into a Ø7.0 × 1.4 mm root, which also fits through the 9.5 mm large opening during insertion.
  ZH: 只有靠近头部的 3.0 mm 段保持 Ø3.8。向安装头方向，它通过 1.2 mm 锥段扩展到 Ø7.0 × 1.4 mm 的根部；插入时该加强根部同样能穿过 9.5 mm 大孔。
- EN: The peg axis is centered across the 11.9 mm mount width at `Y=-19`. The compact body ends at `Y=-23.5`, aligned with the bottom of the Ø9 head, so there is no unnecessary lower tail. The overall vertical envelope is 34.7 mm, 4.0 mm shorter than the initial 38.7 mm version.
  ZH: 蘑菇头轴线位于 11.9 mm 安装宽度中心、`Y=-19`。紧凑主体在 `Y=-23.5` 结束，与 Ø9 头底部对齐，因此没有多余下尾。整体竖向包络为 34.7 mm，比初版 38.7 mm 缩短 4.0 mm。

## First-Order Strength Note（一级强度说明）

EN: The Ø3.8 circular capture neck has `Z=πd³/32≈5.39 mm³`. Using only its 3.0 mm narrow length as the load arm gives approximately 27.3 MPa at 5 kg before stress concentration, layer effects, defects, impact, or creep margins. This is not a rating: the small neck remains the governing section despite the short projection and reinforced root.
ZH: Ø3.8 圆形捕获颈的 `Z=πd³/32≈5.39 mm³`。仅以 3.0 mm 细颈长度作为力臂，5 kg 时名义应力约为 27.3 MPa，且尚未计入应力集中、层向影响、缺陷、冲击或 creep（蠕变）余量。这不是承载评级：即使凸出很短并加强根部，细颈仍是决定性截面。

EN: Begin with light static loads. Inspect the taper-to-neck junction, head shoulder, and any support-scarred surface after each load step. If Ø3.8 prints tight in the actual 4.0 mm slot, adjust the body parameter only; do not change the validated rail-claw dimensions.
ZH: 应从轻载静置开始。每级加载后检查锥段到细颈的交界、头部承力肩，以及任何带支撑痕迹的表面。若 Ø3.8 实物在 4.0 mm 窄槽中偏紧，只调整主体参数；不要修改已验证的 rail claw（轨道卡爪）尺寸。

## Printing（打印）

- EN: Keep the rail mount side-face-down. The Ø9 head is centered at `Z=5.95`, so its lowest point is `Z=1.45`; a small localized support is required under the root/neck/head assembly.
  ZH: 保持 rail mount（轨道安装头）侧面朝下。Ø9 头中心位于 `Z=5.95`，最低点为 `Z=1.45`；根部/细颈/头部组件下方需要一小块局部支撑。
- EN: Prefer PETG or ASA and at least four perimeters. Preserve the flat back shoulder during support cleanup because it is the retaining surface against the keyhole plate.
  ZH: 优先使用 PETG 或 ASA，并至少四圈壁。清理支撑时要保护头部平直后肩，因为它是抵住钥匙孔挂片的锁止承力面。

## Verification（验证）

- EN: Docker `scad-render` completed without warnings or assertions. Echoes confirm head/neck 9/3.8, projection 8, head thickness 2.4, capture neck 3.0, root 7.0, and head support gap 1.45 mm.
  ZH: Docker `scad-render` 无 warning、无 assertion 完成。echo 确认头/颈 9/3.8、凸出 8、头厚 2.4、捕获颈 3.0、根部 7.0，以及头部支撑空隙 1.45 mm。
- EN: The compact final STL is one manifold solid: `NoError`, genus 0, 2344 vertices / 4684 facets. Iso, profile, front, and right views show a complete claw, pressure pad, flat retaining shoulder, centered round head, continuous reinforced root, and no lower body extending below the head envelope.
  ZH: 紧凑版最终 STL 为单一 manifold（流形）实体：`NoError`、genus 0、2344 vertices / 4684 facets。等轴、截面、正面与右视图显示卡爪、承压面、平直锁止肩、居中圆头与连续加强根均完整，且主体没有超出圆头包络的多余下伸。
- EN: Regression renders for `hook-classic`, `hook-wide25`, `hook-round6`, and the skill example remain manifold `NoError`, genus 0. The production and skill library copies remain byte-identical.
  ZH: `hook-classic`、`hook-wide25`、`hook-round6` 与 skill 示例的回归渲染均继续保持 manifold `NoError`、genus 0。正式库与 skill 库副本保持字节一致。

## Open Questions（开放问题）

- EN: Physical passage through the 9.5 mm opening, sliding fit in the 4.0 mm slot, required plate standoff, clearance between the upward-shifted plate and the rail, support removal, rail seating, and progressive load testing remain pending.
  ZH: 仍待实物验证：穿过 9.5 mm 大孔、在 4.0 mm 窄槽中的滑动配合、挂片所需离墙距离、上移后的挂片与导轨之间的间隙、拆支撑、轨道就位，以及逐级承载测试。
