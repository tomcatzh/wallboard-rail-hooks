---
title: "Impact-scoped render validation"
type: decision
status: active
sources:
  - .agents/skills/wallboard-rail-mount/SKILL.md
  - https://files.openscad.org/documentation/manual/OpenSCAD_User_Manual.pdf
updated: 2026-07-17
---

# Impact-Scoped Render Validation（按影响面渲染验证）

## Decision（决定）

EN: Select render targets from the changed dependency surface. A body-only edit renders only that accessory; unrelated production models are not regression targets when both shared libraries (`lib/rail-mount.scad` and `lib/j-hook.scad`) are unchanged. Documentation-only edits do not render. A path-only move compiles the moved entry points to CSG/AST without regenerating meshes or images. A shared rail-interface or J-helper change triggers the full production-accessory and skill-example regression.
ZH: 根据 changed dependency surface（变更依赖面）选择渲染目标。仅修改某个主体时，只渲染该配件；两个共享库（`lib/rail-mount.scad` 与 `lib/j-hook.scad`）均未变化时，其他正式模型不属于回归目标。仅文档修改不渲染。纯路径迁移只把迁移后的入口编译为 CSG/AST，不重新生成网格或图片。共享轨道接口或 J helper（J 辅助模块）变化时，才触发全部正式配件与 skill 示例回归。

## Output Discipline（输出约束）

EN: Every rendered target must remain warning-free and produce a manifold `NoError`, genus 0 mesh. Inspect only the views needed for the changed geometry. Summarize successful runs in one concise line per target; retain detailed logs for failures or unexpected differences.
ZH: 每个实际渲染目标都必须零 warning，并生成 manifold（流形）`NoError`、genus 0 网格。只检查变更几何所需的视图。成功运行按每个目标一行简洁汇总；仅在失败或出现意外差异时展开详细日志。

## Rationale（理由）

EN: OpenSCAD supports command-line rendering and library lookup, but regression scope is a project dependency decision. Limiting routine body validation avoids repeated compute and context use without weakening checks on the model that actually changed.
ZH: OpenSCAD 支持 command-line rendering（命令行渲染）和 library lookup（库查找），但回归范围属于项目依赖决策。日常主体修改采用最小验证集，可以避免重复计算和上下文消耗，同时不削弱对实际变更模型的检查。
