---
title: "hook-round6-ultra-short — 28.6 mm rail-only Ø6 J hook"
type: output
status: active
sources:
  - raw/rail/hook-installed-on-rail.jpg
  - https://openstax.org/books/university-physics-volume-1/pages/10-6-torque
updated: 2026-07-17
---

# hook-round6-ultra-short（28.6 mm 轨道承载 Ø6 J 钩）

## Summary（摘要）

EN: [`accessories/hooks/round-6-ultra-short.scad`](../../accessories/hooks/round-6-ultra-short.scad) is an independent extreme-height sibling of [hook-round6-short](hook-round6-short.md). It preserves the fit-validated claw, 11.9 mm mount width, centered plain Ø6 rod, 25 mm circular J envelope, rounded endpoint, coplanar side-print faces, and single-polyhedron D-root transition. It deliberately disables the 5 mm lower wall-contact face, so its complete load path terminates at the rail rather than the wall panel.
ZH: [`accessories/hooks/round-6-ultra-short.scad`](../../accessories/hooks/round-6-ultra-short.scad) 是 [hook-round6-short](hook-round6-short.md) 的独立极限高度兄弟版本。它保留已验证配合的卡爪、11.9 mm 安装宽度、居中的普通 Ø6 圆杆、25 mm 圆形 J 钩包络、圆头、共面侧放打印面，以及单一 polyhedron D 形根部过渡。它明确关闭 5 mm 下方抵墙面，因此完整载荷路径终止在轨道，而不是墙板。

EN: The user reported that the physical print completed successfully with very good observed print quality and seats in the rail very well. Ultra Short is therefore the preferred first candidate for future compact Round 6 applications when rail-only loading is appropriate. The user also judges its capacity superior to the long-plate rail-only path because the loaded body is shorter; record this as a physically informed design expectation, not a quantified load rating.
ZH: 用户反馈实物打印成功、观察到的打印质量很好，并且卡入轨道的效果非常好。因此，在适合由轨道单独承载的前提下，后续紧凑 Round 6 应优先把 Ultra Short 作为第一候选。用户还判断，由于受力主体更短，其承重应优于长板的轨道单独承载路径；该结论记录为有实物依据的设计预期，而不是已经量化的承载额定。

## Interface Switch（接口开关）

- EN: `rail_accessory()` now accepts `wall_contact=true` as a backward-compatible default. Existing accessories omit the argument and retain their previous wall-contact geometry exactly.
  ZH: `rail_accessory()` 现在接受向后兼容的默认参数 `wall_contact=true`。现有配件省略该参数，并精确保留原有抵墙几何。
- EN: This model alone passes `wall_contact=false`. The conditional branch removes the `X=-2.0`, `Y=-16…-21` pressure face and both 1.2 mm ramps, while preserving the 0.8 mm baseline back contour and every rail-claw dimension.
  ZH: 只有本型号传入 `wall_contact=false`。条件分支删除 `X=-2.0`、`Y=-16…-21` 承压面及上下 1.2 mm ramp（斜坡），同时保留 0.8 mm 基线背面轮廓和全部轨道卡爪尺寸。
- EN: Disabling contact is a load-path decision, not a new general default. It shortens the moment arm and part height but also removes wall-panel stabilization; this variant therefore needs its own seating, rotation, creep, and progressive-load tests.
  ZH: 关闭抵墙面是一项 load path（载荷路径）决定，不是新的通用默认。它缩短力臂与零件高度，同时也失去墙板稳定作用；因此本变体需要单独完成就位、转动、蠕变及逐级承载测试。

## Compact Geometry（紧凑几何）

| Metric | Round 6 | Short | Ultra Short |
|---|---:|---:|---:|
| Overall height | 47.7 mm | 33.6 mm | 28.6 mm |
| Lowest `Y` | −36.5 mm | −22.4 mm | −17.4 mm |
| J center `Y` | −24.0 mm | −9.9 mm | −4.9 mm |
| Wall contact | on | on | off |
| Rod / outer span | Ø6 / 25 mm | Ø6 / 25 mm | Ø6 / 25 mm |

- EN: Removing exactly `wall_contact_h=5.0` mm lifts the complete Short hook envelope by 5 mm. The fixed mount still ends at `Y=11.2`, so total height becomes 28.6 mm: 5.0 mm below Short and 19.1 mm below the original Round 6.
  ZH: 精确删除 `wall_contact_h=5.0` mm 后，Short 的完整挂钩包络整体抬高 5 mm。固定安装头顶部仍为 `Y=11.2`，因此总高变为 28.6 mm：比 Short 减少 5.0 mm，比原 Round 6 减少 19.1 mm。
- EN: The D root spans `Y=-17.4…-8.0` with 3.0 / 6.4 / 11.9 mm upper/lower/width extents. Its upper edge ends exactly at the fixed body datum without a shelf or belly; its full-width flat bottom and the J underside share `Y=-17.4` until the 270° circular join.
  ZH: D 形根部覆盖 `Y=-17.4…-8.0`，上侧/下侧/宽度伸出为 3.0 / 6.4 / 11.9 mm。上缘精确终止于固定主体基准，不产生横台或大肚鼓包；满宽平底与 J 钩下缘共同保持 `Y=-17.4`，直到 270° 圆弧接入点。
- EN: The raised spherical tip reaches `Y=2.11487`, still 9.08513 mm below the fixed mount top. Its room-side location avoids the rail claw, but real hanging-item entry clearance remains a physical-test question.
  ZH: 抬高后的球面圆头达到 `Y=2.11487`，仍比固定安装头顶部低 9.08513 mm。其位于房间侧，不会侵入轨道卡爪，但真实挂物的入口净空仍需实物测试。

## Selection Guidance（选型建议）

- EN: Prefer Ultra Short when minimum height, a shorter load arm, and a clean rail-only installation matter, and the intended item does not require the lower wall-contact face for stabilization.
  ZH: 当最小高度、更短受力臂和清爽的轨道单独安装更重要，且目标挂物不需要下方抵墙面提供稳定作用时，优先选择 Ultra Short。
- EN: The shorter plate/root path is structurally favorable for load components whose perpendicular lever arm is reduced: basic torque follows `τ=r⊥F` ([OpenStax](https://openstax.org/books/university-physics-volume-1/pages/10-6-torque)). This supports preferring Ultra Short over a longer unsupported rail-only plate, while the unchanged 25 mm horizontal reach and removed wall contact mean that an absolute capacity ratio still requires testing.
  ZH: 对于垂直有效力臂随之缩短的载荷分量，更短的板身/根部路径在结构上更有利：基础力矩关系为 `τ=r⊥F`（[OpenStax](https://openstax.org/books/university-physics-volume-1/pages/10-6-torque)）。这支持在长板同样不依靠墙面承载时优先选择 Ultra Short；但 25 mm 水平悬出没有改变，且抵墙支点已删除，因此绝对承载倍数仍需测试确定。
- EN: Prefer [Short](hook-round6-short.md) when wall-panel stabilization is desirable, when rail-only rotation is uncertain, or when comparing the two load paths during physical testing.
  ZH: 当希望利用墙板稳定作用、对轨道单独承载后的转动仍有疑虑，或需要在实物测试中比较两条载荷路径时，优先选择 [Short](hook-round6-short.md)。
- EN: Successful printing and excellent rail seating close manufacturability and unloaded-fit questions for the current setup. Real-item clearance, rotation under load, creep, and progressive load behavior remain open; those tests are needed only to quantify the advantage, not to choose Ultra Short as the current preferred compact candidate.
  ZH: 打印成功且轨道卡入效果优秀，已经关闭当前配置下的可制造性与无载配合问题。真实挂物净空、承载时转动、蠕变和逐级承载表现仍保持开放；这些测试用于量化优势，不妨碍现在把 Ultra Short 作为优先的紧凑候选。

## Printing And Verification（打印与验证）

- EN: Keep the mount side-face-down. Exact STL bounds are `X=-5.15…24.198854`, `Y=-17.4…11.2`, and `Z=0…11.9`; the D root therefore does not lift either print side. The centered Ø6 rod still needs localized support for its 2.95 mm bed gap.
  ZH: 保持安装头侧面朝下。STL 精确包络为 `X=-5.15…24.198854`、`Y=-17.4…11.2`、`Z=0…11.9`；因此 D 形根部不会抬高任一打印侧。居中的 Ø6 圆杆仍因 2.95 mm 热床间隙而需要局部支撑。
- EN: Target-only F6 validation reported no warnings/assertions, `Manifold`, `NoError`, genus 0, 5235 vertices, and 10466 facets. Exact topology audit found one component, 15699 edges, zero boundary/non-manifold edges, and Euler characteristic 2.
  ZH: 仅针对本型号的 F6 验证报告零 warning/assertion、`Manifold`、`NoError`、genus 0、5235 个顶点与 10466 个面。精确拓扑审计得到 1 个连通体、15699 条边、0 条边界/非流形边以及 Euler characteristic（欧拉特征数）2。
- EN: Because the shared `rail_accessory()` signature changed, regression validation also rendered all six older production accessories plus the skill example. Every target remained `Manifold`, `NoError`, and genus 0; SHA-256 hashes for all seven legacy STLs were byte-identical before and after the change, confirming that the default `wall_contact=true` branch preserves prior geometry.
  ZH: 由于共享 `rail_accessory()` 签名发生变化，回归验证还渲染了全部 6 个旧正式配件及 skill 示例。所有目标仍为 `Manifold`、`NoError`、genus 0；修改前后 7 个旧 STL 的 SHA-256 均逐字节一致，确认默认 `wall_contact=true` 分支完整保留旧几何。
- EN: Iso, front, and profile inspection confirmed the absent rear pressure face, clean upper contour, continuous Ø6 contraction, full-width flat new bottom, and unchanged claw. The user subsequently printed the model successfully, reported very good print quality, and confirmed excellent rail seating. Progressive load behavior was not part of that report.
  ZH: 等轴、正面与轮廓检查确认后方承压面已删除、上侧轮廓清爽、收细至 Ø6 的过渡连续、新平底保持满宽，且卡爪未改变。用户随后成功打印该模型，反馈打印质量很好，并确认轨道卡入效果优秀；该反馈不包含逐级承载表现。

## Open Questions（开放问题）

- EN: Unloaded rail seating is confirmed. Test light static loads progressively while watching rail rotation, claw opening, layer separation, creep, and the raised tip's entry clearance. Keep both Short variants available until the rail-only capacity advantage is quantified.
  ZH: 已确认无载状态下完全坐入轨道。后续应逐级进行轻载静置测试，并观察轨道转动、卡爪张开、层间开裂、蠕变以及抬高圆头的入口净空。在轨道单独承载的承重优势得到量化前，继续保留两个 Short 版本。
