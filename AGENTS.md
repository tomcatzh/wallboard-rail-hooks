# AGENTS.md — work-hook

Operating rules for agents working in this repository. This file is the canonical schema; `AGENTS.md` points here.

## LLM Wiki

This project maintains a persistent Karpathy-style LLM Wiki. Follow these rules whenever you read, write, or answer questions against it.

- EN: For every LLM Wiki bootstrap, ingest, query, writeback, or lint operation, load and follow the `llm-wiki-bilingual` skill first. This file remains the canonical project-specific schema; the skill supplies the reusable workflow.
  ZH: 每次执行 LLM Wiki 的 bootstrap（初始化）、ingest（摄入）、query（查询）、writeback（回写）或 lint（检查）操作时，先加载并遵循 `llm-wiki-bilingual` skill。本文件仍是项目专属 schema（规范）的权威来源；skill 提供可复用工作流。

### Directory Layout（目录布局）

```text
raw/                    # immutable raw sources — read; do not modify
  assets/               # images, PDFs, binary attachments
wiki/
  index.md              # top-level content map — read this first
  log.md                # append-only chronological activity log
  sources.md            # registry of raw sources
  topics/               # topic pages
  entities/             # entity pages
  outputs/              # synthesized answers / deliverables written back from queries
.agents/skills/
  wallboard-rail-mount/ # canonical reusable OpenSCAD project workflow
AGENTS.md               # this file — canonical operating rules
AGENTS.md               # thin pointer to AGENTS.md
```

- EN: `raw/` is source of truth — do not modify source files unless the user explicitly asks to reorganize.
  ZH: `raw/` 是 source of truth（事实来源）—— 除非用户明确要求整理，否则不要修改源文件。
- EN: `wiki/` is the compiled synthesis layer — freely create, update, split, merge, and cross-link pages.
  ZH: `wiki/` 是 compiled synthesis layer（编译后的综合层）—— 可以自由创建、更新、拆分、合并、交叉链接页面。
- EN: `.agents/skills/wallboard-rail-mount/` is the repository-canonical reusable workflow. Keep its `rail-mount.scad` byte-identical to `lib/rail-mount.scad` and validate the skill after edits.
  ZH: `.agents/skills/wallboard-rail-mount/` 是仓库内权威的 reusable workflow（可复用工作流）。修改后保持其中的 `rail-mount.scad` 与 `lib/rail-mount.scad` 字节完全一致，并验证该 skill。

### Bilingual Requirement（双语要求）

- EN: All wiki body content must be bilingual English then Chinese, in that order.
  ZH: 所有 wiki 正文必须双语，先英文后中文。
- EN: Keep technical terms, product names, filenames, APIs, commands, model names, and proper nouns in English. On the first Chinese occurrence of an important term, add a concise Chinese meaning in parentheses.
  ZH: 保持技术术语、产品名、文件名、API、命令、模型名和专有名词为英文。重要术语首次在中文中出现时，在括号里加简明中文含义。
- EN: Frontmatter, code blocks, filenames, URLs, IDs, and citations stay unchanged (not translated).
  ZH: frontmatter、代码块、文件名、URL、ID 和 citation（引用）保持不变（不翻译）。

Example paragraph pair:

```markdown
EN: The wiki is a compiled synthesis layer, not the source of truth.
ZH: wiki 是 compiled synthesis layer（编译后的综合层），不是 source of truth（事实来源）。
```

Example list pair:

```markdown
- EN: Update `wiki/index.md` after every ingest.
  ZH: 每次 ingest（摄入）后都要更新 `wiki/index.md`。
```

### Workflows（工作流）

- EN: **Ingest** — register the source in `wiki/sources.md`; extract facts/entities/decisions; create or update topic/entity pages; update `index.md`; append `log.md`.
  ZH: **Ingest（摄入）** —— 在 `wiki/sources.md` 登记来源；提取事实/实体/决定；创建或更新 topic/entity 页；更新 `index.md`；追加 `log.md`。
- EN: **Query** — read `index.md` first, then relevant wiki pages, then raw sources for exact evidence. Cite pages and raw sources. Write back durable conclusions by default.
  ZH: **Query（查询）** —— 先读 `index.md`，再读相关 wiki 页，需要精确证据时读 raw source。引用页和 raw source。durable（持久）的结论默认 writeback（回写）。
- EN: **Writeback** — never leave durable decisions, comparisons, contradictions, or synthesized answers only in chat. Put them into a page and link from `index.md`.
  ZH: **Writeback（回写）** —— durable 的决定、比较、矛盾、综合答案绝不能只留在聊天里。写成页并从 `index.md` 链接。
- EN: **Lint** — periodically check for orphan pages, stale claims, duplicates, missing sources, unresolved contradictions. Move obsolete claims to an `Obsolete / Superseded` section; never silently delete knowledge.
  ZH: **Lint（检查）** —— 定期检查孤立页、stale（过时）claim、重复、缺来源、未解决的矛盾。把 obsolete（作废）的 claim 移到 `Obsolete / Superseded` 小节；绝不静默删除知识。

### Source Grounding（来源溯源）

- EN: Ground important claims in raw sources via the `sources:` frontmatter field and inline links.
  ZH: 重要 claim 必须通过 frontmatter `sources:` 字段和行内链接对应到 raw source。
- EN: If the wiki conflicts with a raw source, the raw source wins — update the wiki.
  ZH: wiki 与 raw source 冲突时，raw source 胜出 —— 更新 wiki。

### Page Frontmatter（页头元数据）

Default page shape:

```markdown
---
title: "Page Title"
type: topic          # topic | entity | source | decision | comparison | timeline | output | status
status: active       # active | draft | stale | superseded
sources:
  - raw/path-or-url
updated: YYYY-MM-DD
---
```

### Log Format（日志格式）

Append entries to `wiki/log.md` in this parseable format:

```markdown
## [YYYY-MM-DD] <op> | <short title>

- EN: What changed, which files.
  ZH: 变更内容，涉及的文件。
- EN: Review needed / open questions.
  ZH: 需要 review 的内容 / 开放问题。
```

Operation labels: `bootstrap`, `ingest`, `query`, `writeback`, `lint`, `refactor`, `source-update`.

### Tooling（工具）

- EN: Prefer direct filesystem reading and `rg` (ripgrep) search. Do not add vector databases or heavyweight RAG unless the wiki grows too large for direct reading or the user asks.
  ZH: 优先直接读文件系统 + `rg`（ripgrep）搜索。除非 wiki 太大不能直接读或用户要求，否则不引入 vector database（向量数据库）或重量级 RAG（检索增强生成）。
