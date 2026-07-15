---
title: "hook-classic-wallpad25-fast — half-width fit test"
type: output
status: superseded
sources:
  - raw/rail/hook-full-view.jpg
updated: 2026-07-10
---

# hook-classic-wallpad25-fast（2.5 mm 半宽快速试装版）

## Superseded（已被替代）

EN: The matching 2.0 mm specimen was selected on 2026-07-10 and promoted into the full-width production library. The 2.5 mm source was removed; see [hook-classic-wallpad-fit-pair](hook-classic-wallpad-fit-pair.md) for the comparison and decision.
ZH: 2026-07-10，配套的 2.0 mm 样件被选中并提升为全宽正式库几何。2.5 mm 源码已删除；对照与定案见 [hook-classic-wallpad-fit-pair](hook-classic-wallpad-fit-pair.md)。

## Summary（摘要）

EN: `hooks/hook-classic-wallpad25-fast.scad` was a fast-print fit probe. It kept the validated mounting interface and 17 mm classic J profile, raised the local wall-pressure reach from the superseded 1.6 mm candidate to 2.5 mm, and halved width from 11.9 to 5.95 mm. It was intentionally a fit test, not a load-test part.
ZH: `hooks/hook-classic-wallpad25-fast.scad` 曾是快速打印试装探针。它保留已验证的安装接口与 17 mm 经典 J 轮廓，把已废弃 1.6 mm 候选方案的局部抵墙总凸高提高到 2.5 mm，并把宽度从 11.9 减半到 5.95 mm。它只用于试装，不用于承载测试。

EN: User evidence: after probing the installation with calipers on 2026-07-10, the user judged 1.6 mm conservative and requested a 2.5 mm trial. This is a test target rather than a final clearance measurement. The WeChat image remains in chat and is not stored under `raw/`.
ZH: 用户证据：2026-07-10 用游标卡尺探测安装位置后，用户判断 1.6 mm 偏保守，并要求试做 2.5 mm。该值是测试目标，不是最终间隙实测值。WeChat 图片仍在聊天中，未存入 `raw/`。

## Geometry（几何）

- EN: Width `part_w=5.95` (exactly half of 11.9); classic span remains 17 mm.
  ZH: 宽度 `part_w=5.95`（11.9 精确减半）；经典跨度仍为 17 mm。
- EN: Flat contact face remains y=−16…−21, 5 mm tall, starting 8 mm below the estimated rail lower edge.
  ZH: 平直接触面仍为 y=−16…−21、高 5 mm，从估计轨道下缘下方 8 mm 开始。
- EN: Total wallward reach `contact_back=2.5`; local addition beyond existing `pad_back=0.8` is 1.7 mm.
  ZH: 总向墙凸高 `contact_back=2.5`；在现有 `pad_back=0.8` 轮廓之外局部再增加 1.7 mm。
- EN: Top transition is a 1.7 mm 1:1 ramp. The bottom has only 1.3 mm before the J begins, so it uses a 1.1 mm ramp and preserves 0.2 mm clearance to the J datum.
  ZH: 顶部使用 1.7 mm 的 1:1 斜坡。接触面下方到 J 起点只有 1.3 mm，因此底部斜坡压缩为 1.1 mm，并保留 0.2 mm 到 J 基准的余量。
- EN: Nominal flat contact area is 5×5.95 = 29.75 mm²; because width is halved, do not infer the full-width load rating from this sample.
  ZH: 名义平直接触面积为 5×5.95 = 29.75 mm²；由于宽度减半，不能从这个样件推导全宽版本承载评级。

## Verification（验证）

- EN: Docker `scad-render` completed with zero warnings/assertions. Echo: contact X=−2.5; Y=−16…−21; height 5; ramps 1.7/1.1; width 5.95.
  ZH: Docker `scad-render` 零 warning、零 assert 完成。echo：接触面 X=−2.5；Y=−16…−21；高度 5；斜坡 1.7/1.1；宽度 5.95。
- EN: STL is one manifold solid: `NoError`, genus 0, 2674 vertices / 5344 facets. Top and isometric views confirm the pad does not enter the J arc.
  ZH: STL 为单一 manifold（流形）实体：`NoError`、genus 0、2674 vertices / 5344 facets。top 与 isometric（等轴测）视图确认承压块没有侵入 J 弧。
- EN: Generated artifacts: `out/hook-classic-wallpad25-fast.stl` and four projection PNGs. The earlier [wallpad16](hook-classic-wallpad16.md) candidate was superseded before printing.
  ZH: 生成产物：`out/hook-classic-wallpad25-fast.stl` 与四张投影 PNG。此前的 [wallpad16](hook-classic-wallpad16.md) 候选方案在打印前已被替代。

## Historical Fit Questions（历史试装检查）

- EN: Does the claw still seat fully without forcing it?
  ZH: 安装爪是否无需硬压就能完全就位？
- EN: Does the 2.5 mm pad touch/compress the lower wallboard, and is the preload acceptable?
  ZH: 2.5 mm 承压块是否贴住/压紧下方墙板，预紧是否可接受？
- EN: If too tight, the next full-width value should be bracketed below 2.5; if still loose, re-check vertical placement before increasing reach further.
  ZH: 若过紧，下一版全宽尺寸应在 2.5 以下收敛；若仍松，继续加凸高前先复核竖向位置。
