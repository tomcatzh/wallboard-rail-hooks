---
title: "IKEA RIBBA 22 mm Recessed-Back Frame Saddle"
type: output
status: active
sources:
  - raw/accessories/frame-ribba22/existing-flat-hook.jpg
  - raw/accessories/frame-ribba22/ribba-label.jpg
  - raw/accessories/frame-ribba22/recessed-back.jpg
  - https://www.ikea.com/gb/en/assembly_instructions/ribba-frame-oak-effect__AA-2212942-3-100.pdf
  - https://openstax.org/books/university-physics-volume-1/pages/5-6-common-forces
updated: 2026-07-15
---

# IKEA RIBBA 22 mm Recessed-Back Frame Saddle

## Evidence And Scope（证据与范围）

- EN: The user's [label photo](../../raw/accessories/frame-ribba22/ribba-label.jpg) identifies an old IKEA RIBBA frame with code `18288` and a 1999 copyright line. The [full rear photo](../../raw/accessories/frame-ribba22/recessed-back.jpg) shows a flat hardboard panel recessed inside the surrounding frame; the user measured that recess as 22 mm.
  ZH: 用户的[标签照片](../../raw/accessories/frame-ribba22/ribba-label.jpg)表明这是旧款 IKEA RIBBA 相框，代码为 `18288`，版权行标注 1999 年。[完整背面照片](../../raw/accessories/frame-ribba22/recessed-back.jpg)显示平直硬质背板凹入周围框体内部；用户实测该凹深为 22 mm。
- EN: The [existing-hook photo](../../raw/accessories/frame-ribba22/existing-flat-hook.jpg) confirms that a straight arm with a small upturned end can already carry the frame. Current official IKEA RIBBA instructions provide series context, but they have not been verified as the exact old `18288` construction; the user's photos and measurement therefore govern this prototype.
  ZH: [现有挂钩照片](../../raw/accessories/frame-ribba22/existing-flat-hook.jpg)证明平直托臂加小幅上翘末端已经能够承托相框。现行 IKEA RIBBA 官方说明书只能提供系列背景，尚未确认对应这款旧 `18288` 结构；因此本原型以用户照片和实测尺寸为准。

## Design Decision（设计决定）

- EN: Use two independent saddles spaced apart on the rail, rather than one long crossbar or two narrow generic hooks. Each saddle spreads the reaction over 24 mm of frame-back width, while the separated pair resists yaw and lets the position avoid the frame's retaining tabs.
  ZH: 采用两只彼此独立、在导轨上拉开间距的 saddle（托架），而不是一根长横梁或两只狭窄通用钩。每只托架在相框背面提供 24 mm 宽的承托反力面；两只分开后还能抑制左右偏摆，并可避开相框背面的固定压片。
- EN: The selected revision removes the upturned retaining lip. Its bearing surface rises 1.5° toward the room/free end, so the downhill direction under gravity is back toward the wall/root. This provides a gentle inward bias while avoiding frame interference and making insertion easier; unlike a lip, it is not positive retention against a strong bump or deliberate lift.
  ZH: 定案修订取消上翻防脱唇。承托面向房间侧/自由端抬高 1.5°，因此重力作用下的下坡方向回到墙面/根部，形成温和的向内偏置，同时减少相框干涉并便于插入；与上翻唇不同，它不能对明显碰撞或主动抬起形成 positive retention（刚性限位）。
- EN: Keep the arm underside horizontal and the reinforcement below it. The slope therefore increases arm thickness slightly toward the free end instead of thinning the load path. An R1.2 tangent nose removes the sharp edge without rising above the inclined plane.
  ZH: 托臂底面与下方加强结构保持水平。这样斜面会让托臂厚度向自由端略微增加，而不是削薄传力路径。R1.2 相切圆头用于消除尖角，但不会高出倾斜托面形成上翻。
- EN: The minimal-height revision aligns the platform underside directly with the lower edge of the shared wall-contact face at `Y=-21`. The fixed mount still needs its lower ramp and 0.2 mm body clearance to reach `body_back_y=-22.4`; that short diagonal connection is now the only geometry below the platform and sets the 33.6 mm minimum overall envelope for the unchanged interface.
  ZH: 最短版本将平台底面直接与共享抵墙承压面下缘 `Y=-21` 对齐。固定安装接口仍需保留下过渡和 0.2 mm 主体净空，因此必须延伸到 `body_back_y=-22.4`；这段短斜接成为平台下方唯一的几何，并在接口不变的前提下决定 33.6 mm 的最小总包络。
- EN: Remove the former 2.2 mm room-side root thickening by setting `root_front_x=x_pf`, leaving one continuous vertical front face for this light picture-frame load. Add a tangent R1.0 fillet where that face meets the inclined platform; it softens the re-entrant corner without restoring a protruding boss.
  ZH: 通过设置 `root_front_x=x_pf` 删除原有 2.2 mm 房间侧根部加厚，使正面对于这项轻载相框用途保持连续垂直。在垂面与倾斜平台交界处增加相切 R1.0 圆角，缓和 re-entrant corner（内凹转角），但不恢复外凸加强块。

## Prototype Dimensions（原型尺寸）

| Parameter | Value | Rationale |
|---|---:|---|
| `part_w` | 24.0 mm | Bearing width per saddle; use two |
| `recess_depth` | 22.0 mm | User's physical measurement |
| `depth_clearance` | 0.0 mm | User-selected compact reach |
| Flat bearing reach from frame rear plane | 22.0 mm | Ends at the measured recess before rounding begins |
| Rounded outer reach from frame rear plane | 23.231 mm | R1.2 tangent nose only; not additional flat bearing length |
| `platform_t` | 4.5 mm | Root platform thickness; intentionally distinct from fixed mount `arm_t` |
| `surface_angle` | 1.5° | Free end higher; gravity bias points inward |
| `surface_rise` | 0.466 mm | Rise across the 17.8 mm bearing run |
| `nose_r` | 1.2 mm | Tangent rounded end, no upturn |
| `root_fillet_r` | 1.0 mm | Tangent root stress-relief fillet |
| Front extra beyond fixed plate | 0.0 mm | Continuous vertical front face |
| Platform underside `Y` | −21.0 mm | Aligned with the rear pressure-face lower edge |
| Highest platform `Y` | −16.034 mm | 0.034 mm below the pressure-face upper-edge datum |
| Fixed lower connection | −22.4 mm | Required ramp/body datum; 1.4 mm below the platform |
| Overall vertical envelope | 33.6 mm | From fixed `body_back_y` to fixed `y_top` |

EN: The inclined flat now ends exactly 22.0 mm from the frame rear plane. Only the tangent R1.2 nose continues to 23.231 mm, so the extra 1.231 mm is a curved edge transition rather than usable flat platform length. Physical fit decides whether that rounded overrun needs reduction.
ZH: 倾斜平直托面现在精确终止于距相框背面基准 22.0 mm 的位置。只有相切 R1.2 圆头继续到 23.231 mm，因此多出的 1.231 mm 是曲面边缘过渡，不是可用平直平台长度。该圆头越界是否还需缩小，以实物试装为准。

## First-Order Strength Check（一级强度检查）

- EN: Treating the root platform as a 24 × 4.5 mm rectangular section gives `Z = b h² / 6 = 81 mm³`. For illustration only, a 5 kg total load shared equally by two saddles with a conservative 20 mm lever gives about `6.1 MPa` nominal bending stress before print defects, creep, impact, stress concentration, rail seating, or safety factors. The horizontal underside and rising top increase thickness toward the nose, so raising the platform does not reduce the governing root section.
  ZH: 将根部平台按 24 × 4.5 mm 矩形截面估算，得到 `Z = b h² / 6 = 81 mm³`。仅作量级示例：若 5 kg 总载荷由两只托架平均承担，并保守取 20 mm 力臂，名义弯曲应力约为 `6.1 MPa`；该数值尚未计入打印缺陷、蠕变、冲击、应力集中、导轨就位状态或安全系数。水平底面与上升顶面会让厚度向圆头方向增加，因此上移平台不会削弱起控制作用的根部截面。
- EN: This calculation is not a load rating. The front thickening was deliberately removed for the light frame load; the short lower diagonal connection remains, and the R1.0 tangent fillet reduces the abruptness of the platform-root corner. The printed pair still requires progressive physical testing with the actual frame.
  ZH: 该计算不是承载额定值。正面加厚按轻载相框用途有意删除；下方短斜接仍然保留，R1.0 相切圆角则降低平台根部转角的突变程度。打印出的成对托架仍须搭配实际相框进行逐级实测。

## Print And Use（打印与使用）

- EN: Print side-face-down as modeled. The full profile touches the bed, so supports are not required; use PETG or ASA and at least four perimeters for the fit prototype.
  ZH: 按模型姿态侧面朝下打印。完整截面均接触热床，因此无需支撑；配合原型建议使用 PETG 或 ASA，并至少设置 4 圈壁。
- EN: Use two saddles, place them symmetrically and as far apart as practical while avoiding rear retaining tabs, then confirm both rail claws are fully seated before loading the frame.
  ZH: 使用两只托架，尽量对称并拉开间距，同时避开背面固定压片；挂上相框前先确认两只导轨卡爪都已完全坐入。
- EN: First test empty fit, then the frame under close observation, then a longer static hold. Check that the rounded nose clears the frame, the 1.5° surface biases the frame inward without visible lean, and there is no hardboard edge damage, rail unseating, layer separation, or creep.
  ZH: 先进行空载配合，再在近距离观察下挂入相框，最后延长静置时间。确认圆头避开框体、1.5° 托面能让相框向内贴靠且不会产生可见倾斜，并检查硬板边缘损伤、导轨脱位、层间开裂与蠕变。

## Verification（验证）

- EN: Impact-scoped validation rendered only `accessories/frames/ribba-22.scad`. Docker `scad-render` completed without warnings or assertions. Visual inspection confirmed the flush vertical front, R1.0 root fillet, inclined platform, and rounded lip-free nose. A direct STL topology audit found one connected component, zero boundary/non-manifold edges, Euler characteristic 2 (`genus 0`), and 300 triangles. Echoes confirm width 24, measured recess 22, exact flat bearing reach 22, rounded outer reach 23.2314, surface angle 1.5°, rise 0.466109, highest platform `Y=-16.0339`, platform-top datum clearance 0.0338906, root platform thickness 4.5, front extra 0, overall height 33.6, and the unchanged 2.0 mm shared wall-contact face.
  ZH: 按影响范围仅渲染 `accessories/frames/ribba-22.scad`。Docker `scad-render` 零 warning、零 assertion 完成。外观检查确认齐平垂直正面、R1.0 根部圆角、倾斜平台与无上翻唇的圆头。直接 STL 拓扑检查得到 1 个连通体、0 条边界/非流形边、Euler characteristic（欧拉特征数）为 2（`genus 0`），共 300 个三角面。echo 确认宽 24、实测凹深 22、平直托面精确伸入 22、圆头最外缘伸入 23.2314、托面角 1.5°、高差 0.466109、平台最高点 `Y=-16.0339`、平台顶部基准净空 0.0338906、根部平台厚 4.5、正面额外凸出 0、总高 33.6，以及共享的 2.0 mm 抵墙承压面保持不变。
- EN: On 2026-07-15, the user reported that the first physical print completed successfully and the old RIBBA 18288 frame was mounted with it. This validates physical fit for this specific frame, rail, printer, and material setup, including the compact vertical envelope and selected reach. It does not establish a long-term load rating.
  ZH: 2026-07-15，用户反馈首件实物已成功打印，并已用它挂上旧款 RIBBA 18288 相框。这验证了该特定相框、导轨、打印机与材料组合下的实物配合，包括紧凑竖向包络与选定伸入量；但这不构成长期承载额定值。
- EN: The body thickness variable was renamed from `arm_t` to `platform_t`. With OpenSCAD `include`, the old name shadowed the fixed library's `arm_t=2.2` and inflated the rail claw to 11.25 mm. The corrected render reports claw total 8.95 mm against the 9.0 mm target, restoring the fixed interface without changing the shared library.
  ZH: 主体厚度变量由 `arm_t` 改名为 `platform_t`。在 OpenSCAD `include`（包含）作用域中，旧名称会遮蔽固定库的 `arm_t=2.2`，曾把导轨卡爪意外增高到 11.25 mm。修正后渲染回显卡爪总高 8.95 mm，对应 9.0 mm 目标；无需修改共享库即可恢复固定接口。
- EN: This model explicitly uses `ch=0`. During diagnosis, the current shared stepped-chamfer helper produced a top chamfer shell that only touched the center extrusion at a coplanar face, so it was not used here. Repairing that shared helper is separate interface-library work and would require full accessory regression.
  ZH: 本模型显式使用 `ch=0`。诊断时发现当前共享阶梯倒角 helper（辅助模块）会生成一层仅与中心挤出体共面接触的顶部倒角壳，因此本模型不使用该倒角。修复共享 helper 属于独立的接口库工作，并会要求执行全部配件回归。
- EN: Open item: observe the installed pair over time for creep, layer separation, rail unseating, hardboard-edge marking, or visible outward lean. No sustained-load rating is assigned from the initial successful installation alone.
  ZH: 开放项：持续观察已安装的成对托架，检查螺变、层间开裂、导轨脱位、硬质背板边缘压痕或可见外倾。不仅凭首次成功挂装赋予持续承载额定值。
