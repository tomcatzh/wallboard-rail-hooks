---
title: "OpenSCAD library boundaries"
type: decision
status: active
sources:
  - lib/rail-mount.scad
  - lib/j-hook.scad
  - .agents/skills/wallboard-rail-mount/SKILL.md
  - https://files.openscad.org/documentation/manual/OpenSCAD_User_Manual.pdf
updated: 2026-07-17
---

# OpenSCAD Library Boundaries（OpenSCAD 库边界）

## Decision（决定）

EN: Keep reusable code under `lib/`, but separate it by responsibility. `lib/rail-mount.scad` owns only the validated rail interface, shared extrusion, and mount-level geometry utilities. `lib/j-hook.scad` owns the parametric `j_hook_body()` profile generator. Do not use a generic `misc/` directory: it would hide whether a file is reusable library code, an accessory entry point, or a temporary experiment.
ZH: 可复用代码继续放在 `lib/`，但按 responsibility（职责）拆分。`lib/rail-mount.scad` 只负责已验证的轨道接口、共享挤出及安装接口层几何工具；`lib/j-hook.scad` 负责参数化 `j_hook_body()` 轮廓生成器。不使用宽泛的 `misc/` 目录，因为它会掩盖文件究竟属于 reusable library（可复用库）、配件入口还是临时实验。

## Dependency Direction（依赖方向）

```text
accessories/hooks/classic.scad ─┐
accessories/hooks/wide-25.scad ─┴─> lib/j-hook.scad ─> lib/rail-mount.scad

all other accessories ───────────────────────────────> lib/rail-mount.scad
```

EN: J-hook entry points include only `j-hook.scad`; that file includes the sibling `rail-mount.scad`. Non-J accessories include `rail-mount.scad` directly. This keeps the fixed interface independent of one body style while avoiding duplicate includes in callers.
ZH: J 勾入口只 include（包含）`j-hook.scad`，再由该文件 include 同目录的 `rail-mount.scad`；非 J 配件直接 include `rail-mount.scad`。这样固定接口不再从属于某一种主体造型，同时调用方不会重复 include。

EN: The official OpenSCAD library lookup order searches the directory of the calling `.scad` file first; for an include inside a library, the library file itself is the caller. Therefore `lib/j-hook.scad` can reliably use `include <rail-mount.scad>`, and the repository skill can mirror the same self-contained layout.
ZH: OpenSCAD 官方 library lookup（库查找）顺序会先搜索调用 `.scad` 文件所在目录；当 library（库）内部继续 include 时，该 library 文件就是 caller（调用方）。因此 `lib/j-hook.scad` 可以稳定使用 `include <rail-mount.scad>`，仓库 skill 也可以镜像同样的自包含布局。

## Canonical Copies（权威副本）

- EN: `lib/rail-mount.scad` must remain byte-identical to `.agents/skills/wallboard-rail-mount/rail-mount.scad`.
  ZH: `lib/rail-mount.scad` 必须与 `.agents/skills/wallboard-rail-mount/rail-mount.scad` 逐字节一致。
- EN: `lib/j-hook.scad` must remain byte-identical to `.agents/skills/wallboard-rail-mount/j-hook.scad`.
  ZH: `lib/j-hook.scad` 必须与 `.agents/skills/wallboard-rail-mount/j-hook.scad` 逐字节一致。

## Verification（验证）

EN: At the user's request, the 2026-07-17 split received a full regression rather than the minimum path-only compile. All seven production accessories plus the skill example rendered with no warning or assertion; every mesh reported `Manifold`, `NoError`, and genus 0. All eight STL SHA-256 hashes remained byte-identical to their pre-refactor baselines, proving that the split changed dependency ownership but not geometry.
ZH: 按用户要求，2026-07-17 的拆分执行了 full regression（全量回归），而不是最低限度的纯路径编译。7 个正式配件及 skill 示例均在零 warning、零 assertion 下完成渲染；所有网格均报告 `Manifold`、`NoError` 与 genus 0。8 个 STL 的 SHA-256 全部与重构前基线逐字节一致，证明本次拆分只改变依赖归属，没有改变几何。
