---
title: "hook-classic-wallpad16 — wall-pressure print test"
type: output
status: superseded
sources:
  - raw/rail/hook-full-view.jpg
updated: 2026-07-10
---

# hook-classic-wallpad16（抵墙承压块打印测试版）

## Superseded（已被替代）

EN: Superseded before printing on 2026-07-10 by the half-width 2.0/2.5 mm [fit pair](hook-classic-wallpad-fit-pair.md). The user ultimately selected 2.0 mm and promoted it into the production library. This page preserves the earlier rendered 1.6 mm candidate.
ZH: 2026-07-10 在打印前被半宽 2.0/2.5 mm [试装对照组](hook-classic-wallpad-fit-pair.md) 替代。用户最终选择 2.0 mm 并将其提升为正式库几何。本页保留先前已渲染的 1.6 mm 候选方案。

## Summary（摘要）

EN: `hooks/hook-classic-wallpad16.scad` is a separate copy-derived variant of the fit-validated 17 mm `hook-classic.scad`. It leaves `lib/rail-mount.scad`, the mounting claw, and the original classic design untouched, then unions one local wall-pressure pad onto the lower shank for a real print test.
ZH: `hooks/hook-classic-wallpad16.scad` 是从已验证试装的 17 mm `hook-classic.scad` 派生出的独立测试版。它不修改 `lib/rail-mount.scad`、安装爪和原经典版，只在下段杆身 union（并集）一个局部抵墙承压块，用于实物打印测试。

EN: Motivation: the user's WeChat image and estimate on 2026-07-10 indicate an ≈1.6 mm setback between the rail contact plane and the lower wallboard. The classic profile reaches only 0.8 mm wallward, so it may leave ≈0.8 mm clearance instead of carrying the horizontal reaction H. The image remains in chat and has not been copied into `raw/`.
ZH: 动机：用户 2026-07-10 的 WeChat 图片与估计显示，轨道接触基准面到下方墙板约有 1.6 mm 后退量。经典轮廓只向墙伸出 0.8 mm，因此可能仍留约 0.8 mm 空隙，不能承担水平反力 H。该图片仍在聊天中，尚未复制到 `raw/`。

## Geometry（几何）

| Parameter | Value | Meaning |
|---|---:|---|
| `rail_bottom_drop` | 8.0 mm | estimated rail lower edge below the Y=0 slot ceiling; currently aliases `pad_top_drop` |
| `contact_below_rail` | 8.0 mm | contact-face top below the estimated rail lower edge |
| `contact_top_y` | −16.0 mm | top of the flat pressure face |
| `contact_bottom_y` | −21.0 mm | bottom of the flat pressure face |
| `contact_h` | 5.0 mm | flat vertical contact length |
| `contact_back` | 1.6 mm | total wallward reach from X=0 |
| `contact_extra` | 0.8 mm | local addition beyond the existing `pad_back=0.8` profile |
| `contact_ramp` | 0.8 mm | 1:1 transition at each end |
| `part_w` | 11.9 mm | width along the rail; unchanged from classic |

EN: The estimated rail lower edge was 8.0 mm below the slot-ceiling datum; the 5.0 mm flat face therefore ran from Y=−16.0 to −21.0. Its total reach was 1.6 mm, adding 0.8 mm beyond the baseline contour with 0.8 mm 1:1 ramps. Width remained 11.9 mm.
ZH: 核心几何：把轨道下缘暂定为槽顶基准下方 8.0 mm；再向下 8.0 mm 开始接触面，因此平直接触段位于 y=−16.0…−21.0、长度 5.0 mm。总向墙凸高为 1.6 mm；由于原轮廓已经有 0.8 mm，本测试版只局部再增加 0.8 mm，并在上下各用 0.8 mm 的 1:1 斜坡回到原轮廓。沿轨道宽度仍为 11.9 mm。

## Verification（验证）

- EN: Rendered with `openab-openscad-toolchain-base:openscad-nightly-2026.01.19.2` via `scad-render`; produced `out/hook-classic-wallpad16.stl` plus iso/top/front/right PNGs with no warnings or assertion failures.
  ZH: 使用 `openab-openscad-toolchain-base:openscad-nightly-2026.01.19.2` 经 `scad-render` 渲染；生成 `out/hook-classic-wallpad16.stl` 与 iso/top/front/right PNG，零 warning、零 assert 失败。
- EN: Full STL result: one manifold solid, `NoError`, genus 0, 2674 vertices / 5344 facets. Echo checks: span 17; contact X=−1.6; contact Y=−16…−21; contact height 5; width 11.9.
  ZH: 完整 STL 结果：单一 manifold（流形）实体，`NoError`、genus 0、2674 vertices / 5344 facets。echo 自检：跨度 17；接触面 X=−1.6；接触面 Y=−16…−21；接触长度 5；宽度 11.9。
- EN: Visual review of top and isometric projections confirms the added pad is confined to the lower shank and stops before the J arc; mounting-head geometry is inherited unchanged from the validated library.
  ZH: top 与 isometric（等轴测）投影目视确认：新增块仅位于下段杆身，并在 J 弧前结束；安装头几何原样继承已验证的库。

## Outcome（结果）

- EN: Not printed. The source was removed after the later A/B process selected 2.0 mm; retain this page only as superseded design history.
  ZH: 未打印。后续 A/B 流程选定 2.0 mm 后，源码已删除；本页仅保留为已废弃的设计历史。
