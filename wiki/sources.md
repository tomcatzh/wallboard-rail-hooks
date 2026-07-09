---
title: "Source Registry"
type: sources
status: active
updated: 2026-07-09
---

# Source Registry（来源登记表）

EN: Registry of all raw sources ingested into this wiki. Every entry in `raw/` should have a row here once ingested.
ZH: 本 wiki 中所有已 ingest（摄入）的 raw source（原始来源）的登记表。`raw/` 里每一项在 ingest 后都应在此有一行。

## Columns（列说明）

- EN: `path` — path under `raw/` or external URL.
  ZH: `path` — `raw/` 下的路径或外部 URL。
- EN: `title` — short human title.
  ZH: `title` — 简短的人类可读标题。
- EN: `type` — e.g. `doc`, `article`, `code`, `image`, `transcript`, `spec`.
  ZH: `type` — 例如 `doc`、`article`、`code`、`image`、`transcript`、`spec`。
- EN: `lang` — original language of the source.
  ZH: `lang` — 来源的原始语言。
- EN: `observed` — date first seen (YYYY-MM-DD).
  ZH: `observed` — 首次看到的日期（YYYY-MM-DD）。
- EN: `status` — `new`, `ingested`, `partial`, `stale`.
  ZH: `status` — `new`、`ingested`、`partial`、`stale`（过时）。

## Sources（来源列表）

| path | title | type | lang | observed | status |
|------|-------|------|------|----------|--------|
| raw/assets/hook-mount-dimensions.jpg | Mounting-claw cross-section with dimension annotations (2.75 / 7.35 / 2.4 mm) | image | n/a | 2026-07-09 | ingested |
| raw/assets/hook-installed-on-rail.jpg | Bare hook, full side profile (⚠ see content note) | image | n/a | 2026-07-09 | ingested |
| raw/assets/hook-full-view.jpg | Hook installed on wall rail, in-situ (⚠ see content note) | image | n/a | 2026-07-09 | ingested |

### Content Notes（内容备注）

- EN: The file names of `hook-installed-on-rail.jpg` and `hook-full-view.jpg` are swapped relative to their content: `hook-installed-on-rail.jpg` actually shows the bare hook on a plain background, and `hook-full-view.jpg` actually shows the hook installed on the wall rail. Files were left untouched (`raw/` is immutable); the titles above describe actual content.
  ZH: `hook-installed-on-rail.jpg` 与 `hook-full-view.jpg` 的文件名与内容互换：`hook-installed-on-rail.jpg` 实际是纯色背景上的裸钩，`hook-full-view.jpg` 实际是挂钩安装在墙面挂条上的照片。文件未改动（`raw/` 不可变）；上表 title 按实际内容描述。
