---
title: "Source Registry"
type: sources
status: active
updated: 2026-07-15
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
| raw/rail/hook-mount-dimensions.jpg | Mounting-claw cross-section with dimension annotations (2.75 / 7.35 / 2.4 mm) | image | n/a | 2026-07-09 | ingested |
| raw/rail/hook-installed-on-rail.jpg | Bare hook, full side profile (⚠ see content note) | image | n/a | 2026-07-09 | ingested |
| raw/rail/hook-full-view.jpg | Hook installed on wall rail, in-situ (⚠ see content note) | image | n/a | 2026-07-09 | ingested |
| raw/accessories/hook-keyhole9/reference.jpg | User-provided keyhole hanger plate; measured openings 9.5/4.0 mm | image | n/a | 2026-07-14 | ingested |
| raw/accessories/frame-ribba22/existing-flat-hook.jpg | Existing original flat hook currently supporting the recessed-back frame | image | n/a | 2026-07-14 | ingested |
| raw/accessories/frame-ribba22/ribba-label.jpg | Rear label identifying an old IKEA RIBBA frame, code 18288, copyright 1999 | image | n/a | 2026-07-14 | ingested |
| raw/accessories/frame-ribba22/recessed-back.jpg | Full rear view of the RIBBA frame and its recessed hardboard back | image | n/a | 2026-07-14 | ingested |
| raw/accessories/frame-ribba22/raised-reinforced-pair-installed.jpg | Current raised reinforced saddle pair installed on the wall rail | image | n/a | 2026-07-15 | ingested |
| raw/accessories/frame-ribba22/frame-conceals-raised-saddles.jpg | Side view showing the mounted frame concealing the raised saddle pair | image | n/a | 2026-07-15 | ingested |
| https://www.chinayoubang.com/productfamily/detail/195.html | Youbang 挂挂墙·平行系列 product page — rail provenance | web | zh | 2026-07-09 | ingested |
| https://www.hangmanproducts.com/shop/p/keyhole-hangers | Hangman Products keyhole hanger — screw-head capture mechanism | web | en | 2026-07-14 | ingested |
| https://files.openscad.org/documentation/manual/OpenSCAD_User_Manual.pdf | Official OpenSCAD user manual — library lookup and command-line rendering | PDF | en | 2026-07-14 | ingested |
| https://www.ikea.com/gb/en/assembly_instructions/ribba-frame-oak-effect__AA-2212942-3-100.pdf | Current official IKEA RIBBA assembly instructions — series context only, not verified as the old 18288 variant | PDF | en | 2026-07-14 | partial |
| https://openstax.org/books/university-physics-volume-1/pages/5-6-common-forces | OpenStax University Physics — weight components and normal force on an inclined plane | web | en | 2026-07-14 | ingested |

### Content Notes（内容备注）

- EN: The file names of `hook-installed-on-rail.jpg` and `hook-full-view.jpg` are swapped relative to their content: `hook-installed-on-rail.jpg` actually shows the bare hook on a plain background, and `hook-full-view.jpg` actually shows the hook installed on the wall rail. Their image contents and filenames remain unchanged; only their directory was reorganized with the user's approval. The titles above describe actual content.
  ZH: `hook-installed-on-rail.jpg` 与 `hook-full-view.jpg` 的文件名与内容互换：`hook-installed-on-rail.jpg` 实际是纯色背景上的裸钩，`hook-full-view.jpg` 实际是挂钩安装在墙面挂条上的照片。图片内容与文件名保持不变；仅在用户批准后整理了所在目录。上表 title 按实际内容描述。
