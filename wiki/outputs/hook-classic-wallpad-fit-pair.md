---
title: "Classic hook wall-pad A/B fit pair"
type: comparison
status: superseded
sources:
  - raw/rail/hook-full-view.jpg
updated: 2026-07-10
---

# Classic Hook Wall-Pad A/B Fit Pair（经典小钩抵墙块 A/B 试装组）

## Summary（摘要）

EN: Two half-width fast-print specimens isolate the wall-pressure reach as the test variable. Both preserve the validated mounting interface, 17 mm classic J profile, 5 mm contact-face location at y=−16…−21, and width 5.95 mm. They differ only in `contact_back`: 2.0 versus 2.5 mm, plus the top ramp length derived from that reach.
ZH: 两只半宽快速打印样件把抵墙凸高隔离为唯一测试变量。二者都保留已验证的安装接口、17 mm 经典 J 轮廓、位于 y=−16…−21 的 5 mm 接触面，以及 5.95 mm 宽度。区别只有 `contact_back`：2.0 对 2.5 mm，以及由凸高派生的顶部斜坡长度。

EN: Earlier/detailed history: [1.6 mm candidate](hook-classic-wallpad16.md) and [2.5 mm candidate](hook-classic-wallpad25-fast.md). The 2.0 mm specimen is documented directly on this comparison page.
ZH: 更早/详细历史：[1.6 mm 候选方案](hook-classic-wallpad16.md)与 [2.5 mm 候选方案](hook-classic-wallpad25-fast.md)。2.0 mm 样件直接记录在本对照页中。

## Pair（对照组）

| Specimen | STL | Total reach | Added beyond 0.8 | Top / bottom ramp | Width |
|---|---|---:|---:|---:|---:|
| 2.0 | `out/hook-classic-wallpad20-fast.stl` | 2.0 mm | 1.2 mm | 1.2 / 1.1 mm | 5.95 mm |
| 2.5 | `out/hook-classic-wallpad25-fast.stl` | 2.5 mm | 1.7 mm | 1.7 / 1.1 mm | 5.95 mm |

EN: The specimen STLs were `out/hook-classic-wallpad20-fast.stl` and `out/hook-classic-wallpad25-fast.stl`. The 2.0 version added 1.2 mm beyond the 0.8 mm baseline with 1.2/1.1 mm ramps; the 2.5 version added 1.7 mm with 1.7/1.1 mm ramps. Both were 5.95 mm wide.
ZH: 两个样件的 STL 分别为 `out/hook-classic-wallpad20-fast.stl` 与 `out/hook-classic-wallpad25-fast.stl`。2.0 版在原 0.8 mm 轮廓外增加 1.2 mm，顶部/底部斜坡为 1.2/1.1 mm；2.5 版增加 1.7 mm，斜坡为 1.7/1.1 mm。二者宽度均为 5.95 mm。

## Verification（验证）

- EN: Both Docker renders completed with zero warnings/assertions. Each STL is one manifold solid: `NoError`, genus 0, 2674 vertices / 5344 facets.
  ZH: 两个 Docker 渲染均零 warning、零 assert。每个 STL 都是单一 manifold（流形）实体：`NoError`、genus 0、2674 vertices / 5344 facets。
- EN: Echo checks for 2.0: contact X=−2; Y=−16…−21; height 5; ramps 1.2/1.1; width 5.95. Echo checks for 2.5: X=−2.5; same Y/height/width; ramps 1.7/1.1.
  ZH: 2.0 版 echo：接触面 X=−2；Y=−16…−21；高度 5；斜坡 1.2/1.1；宽度 5.95。2.5 版 echo：X=−2.5；Y/高度/宽度相同；斜坡 1.7/1.1。

## Decision（定案）

- EN: On 2026-07-10 the user selected the 2.0 mm reach from this pair. It was promoted into `lib/rail-mount.scad` as the full-width production `wall_contact_*` geometry used by both `hook-classic.scad` and `hook-wide25.scad`; the three temporary test source files were removed.
  ZH: 2026-07-10，用户从本对照组中选择 2.0 mm 凸高。该方案已作为全宽正式 `wall_contact_*` 几何并入 `lib/rail-mount.scad`，由 `hook-classic.scad` 与 `hook-wide25.scad` 共用；三份临时测试源码已删除。
- EN: The 2.5 mm candidate is superseded. This page remains as the A/B decision record; current geometry and verification live in [hook-scad-v1](hook-scad-v1.md).
  ZH: 2.5 mm 候选方案已废弃。本页保留为 A/B 决策记录；现行几何与验证见 [hook-scad-v1](hook-scad-v1.md)。

## Historical Selection Rule（历史选择规则）

- EN: If 2.0 seats fully and already contacts the panel without play, prefer 2.0 for lower preload.
  ZH: 若 2.0 能完全就位且已经无晃动地贴住墙板，优先选 2.0，以降低预紧。
- EN: If 2.0 remains loose and 2.5 seats comfortably with definite contact, select 2.5.
  ZH: 若 2.0 仍松、而 2.5 能舒适就位并明确贴墙，则选 2.5。
- EN: If 2.0 is slightly loose but 2.5 is too tight, the next full-width trial should be 2.2–2.25 mm.
  ZH: 若 2.0 略松但 2.5 过紧，下一轮全宽试件应取 2.2–2.25 mm。
- EN: These half-width pieces are fit gauges only. Do not hang a meaningful load from them.
  ZH: 这两只半宽件只是配合量规，不要用它们挂实际重物。
