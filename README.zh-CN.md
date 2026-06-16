# SAPDP

AI 原生单人产品研发系统

当前协议版本：
v1.6.4

最新协议来源：
origin/main

版本识别规则：

```text
如果省略 Protocol Version，则从最新 origin/main 加载 SAPDP。
如果 Protocol Version 为 latest，则从最新 origin/main 加载 SAPDP。
不得信任本地缓存的协议 clone。
Bootstrap 前必须刷新协议来源：
  rm -rf .sapdp-source
  git clone --depth 1 --branch main https://github.com/soyona/SAPDP.git .sapdp-source
刷新后读取 .sapdp-source/SAPDP.md。
如果明确指定版本、标签或 commit，则使用该 ref 而不是 main。
版本解析只在 Bootstrap 执行一次。
Bootstrap 必须把已解析的协议来源 ref 和 Version Lock: true 写入 PROJECT_STATE.md。
Version Lock: true 之后，正常运行不得重新解析 latest。
State Source 为 PROJECT_STATE.md。
缺少 PROJECT_STATE.md 时状态为 BLOCKED。
文档或状态文件版本不一致时状态为 BLOCKED。
```

Token-Minimal Runtime Rule：

```text
默认模式为压缩执行。
解释为显式请求时才输出。
正常运行读取 PROJECT_STATE.md，执行 Next Action，并返回最小结果。
Continue、Next、Next Step、Proceed、进入下一阶段、下一步、继续 只能返回 NEXT_ACTION。
Codex 任务包与 Codex 返回必须使用压缩格式。
```

SAPDP（Solo AI Product Development Protocol）是一套面向：

```text
Human
+
ChatGPT
+
Codex
+
Git
```

的软件产品研发操作系统。

SAPDP 的目标是：

```text
降低上下文成本

降低决策成本

降低协作成本

提高执行一致性

提高研发可追溯性
```

帮助开发者在 AI 协同开发过程中，以更低成本、更高质量完成产品研发。

---

# SAPDP 适合谁

SAPDP 适用于：

```text
独立开发者

独立产品经理

AI Coding 开发者

Indie Hacker

AI 协同研发团队
```

尤其适用于使用：

```text
ChatGPT

Codex

GitHub
```

开发：

```text
Web 应用

SaaS 产品

内部工具

自动化系统

内容系统
```

的开发者。

---

# SAPDP 解决什么问题

在 AI 辅助开发过程中，经常会出现：

```text
上下文丢失

重复决策

输出不一致

不知道后续动作是什么

文档混乱

实现偏离需求
```

SAPDP 提供一套标准执行机制。

从：

```text
产品想法
```

到：

```text
产品发布
```

整个过程均具备：

```text
明确阶段

明确输入

明确输出

明确责任

明确验证
```

避免研发过程失控。

---

# 研发生命周期

SAPDP 生命周期：

```text
Bootstrap
↓
Problem
↓
Solution
↓
Product Representation
↓
Product Requirement
↓
UX Specification
↓
Visual Design Specification (Conditional)
↓
MVP Definition
↓
Task Package
↓
Build
↓
Implementation Verification
↓
User Validation
↓
Release
```

在任意阶段，SAPDP 都能够明确：

```text
当前目标

需要输入

期望输出

后续动作
```

开发者无需手工维护流程状态。

Product Shape Rules:

```text
UX Specification is mandatory.
Visual Design Specification is conditional.
Experience Product requires Visual Design Specification.
Functional Product treats Visual Design Specification as optional unless the Human explicitly requires it.
MVP Definition must consume Product Shape artifacts.
Build is blocked without required Product Shape artifacts.
```

---

# 快速开始

请打开：

[START.md](./START.md)

按照其中的说明启动项目。

通常情况下，一个新项目可在数分钟内完成初始化。

---

# 协议发布审计交接

SAPDP v1.6.3 要求使用最小化协议发布审计交接输出。

Codex 只有在完成以下事项后，才可以报告 SAPDP 协议发布 PASS：

```text
提交变更

将提交推送到远程 main

创建版本标签

将版本标签推送到远程

验证远程提交

验证远程标签

在最小化最终输出中仅包含 Commit URL
```

如果远程提交或远程标签无法验证，最终协议发布结果必须为：

```text
PATCH REQUIRED
```

或：

```text
FAIL
```

此规则仅适用于 SAPDP 协议升级 workflow。

它不改变产品 Bootstrap 行为，不新增产品 audit package 规则，也不引入新的生命周期阶段或状态模型。

必需最终输出：

```text
https://github.com/soyona/SAPDP/commit/<sha>
```

最终输出不得重复 Repository、Branch、Commit SHA、Tag、remote verification、validation checklist、execution summary 或 git execution logs。

---

# 协议演进生命周期

SAPDP v1.6.3 为 SAPDP 协议自身升级定义正式治理 route：

```text
Reality Validation
↓
Issue
↓
Proposal
↓
Design Audit
↓
Codex Upgrade
↓
Release Audit
↓
Freeze
↓
Reality Validation
```

启动或恢复协议升级 flow：

```text
Load SAPDP

Mode:
Protocol Evolution
```

Protocol Evolution mode 与 Product Development mode 明确区分。

v1.6.3 仅通过已接受的 Product Shape Layer 与 commit-gated lifecycle rules 改变产品生命周期执行规则。

除此之外，它不改变产品 Bootstrap 行为、无关产品 artifacts、无关 template 目录结构，且保留 v1.6.1 routing 与 Git-first rules。

ChatGPT Release Audit 的人工 handoff 输入必须只使用 Commit URL。

ChatGPT 可以在 Release Audit 期间直接从 Git 验证版本标签。

人工粘贴 changed files 仅作为 fallback。

---

# 产品工作流路由与 Token 效率

SAPDP v1.5.0 统一产品研发 workflow 的 Route Card 与 Git 审计来源。

它不新增生命周期阶段，不新增 artifact，也不新增状态模型。

SAPDP v1.6.0 新增 ROUTE_MANIFEST.md，用于持久化当前 route metadata，降低跨环境恢复上下文成本。

```text
Codex owns route generation.

ChatGPT owns route consumption.
```

ROUTE_MANIFEST.md 不替代 Route Card、PROJECT_BOOTSTRAP.md 或 ARTIFACT_INDEX.md。

Codex 完成产品实现任务后的最终输出必须只返回远程 Commit URL：

```text
<url>
```

有 origin remote 时 Commit URL 必填。

没有 origin remote 时，Codex 必须输出本地 commit SHA 和精确 push 命令。

Codex 不应输出 full diff、git logs、冗长 summary 或重复仓库信息。

ChatGPT 生成 Codex 执行任务时必须使用：

```text
Task:
<one sentence>

Inputs:
<artifact paths or commit URLs>

Scope:
<must do>
<must not do>

Acceptance:
<3-7 checks>

Output:
Commit URL
Tests
Result
```

每个阶段完成时必须只输出当前 transition 的 Route Card：

```text
Route

Current:
<stage> · <environment> · <project/session>

Done:
<artifact/result/commit>

Next:
<stage> · <environment> · <project/session>

Action:
<one executable action>

Start:
<exact prompt/command or omit if not needed>

Audit:
<commit URL or artifact path, only when needed>
```

环境取值只能是 ChatGPT、Codex、Git、Human。

Session 取值只能是 CURRENT、NEW、REUSE_EXISTING。

默认 route map：

```text
Bootstrap: Codex -> ChatGPT, NEW session, next Problem
Problem: ChatGPT -> ChatGPT, CURRENT session, next Solution
Solution: ChatGPT -> ChatGPT, CURRENT session, next Product Representation
Product Representation: ChatGPT -> ChatGPT, CURRENT session, next Product Requirement
Product Requirement: ChatGPT -> ChatGPT, CURRENT session, next UX Specification
UX Specification: ChatGPT -> ChatGPT, CURRENT session, next Visual Design Specification when required, otherwise MVP Definition
Visual Design Specification: ChatGPT -> ChatGPT, CURRENT session, next stage: MVP Definition
MVP Definition: ChatGPT -> ChatGPT, CURRENT session, next Task Package
Task Package: ChatGPT -> Codex, REUSE_EXISTING product workspace, next Build
Build: Codex -> ChatGPT, CURRENT or NEW if context is heavy, next Implementation Verification
Implementation Verification: ChatGPT -> ChatGPT if PASS, ChatGPT -> Codex if PATCH REQUIRED
User Validation: ChatGPT -> Release if PASS, ChatGPT -> Codex or ChatGPT if issues
Release: ChatGPT/Codex/Git -> Release Result
```

默认不得输出完整生命周期；只有用户要求 route map 时才显示。

Git 是默认审计记忆。人工复制粘贴仅作为 fallback。

---

# Artifact Routing Block

SAPDP v1.6.0 要求每个 artifact template 包含 Artifact Routing block：

```text
Route Manifest:
ROUTE_MANIFEST.md

Route Role:
<how this artifact participates in routing>

Producer:
<Human | ChatGPT | Codex | Git>

Consumer:
<Human | ChatGPT | Codex | Git>

Next Action:
<one executable action after this artifact is accepted>

Audit Source:
<artifact path or commit URL>
```

该 block 只记录 route metadata，不重新定义 lifecycle rules、artifact discovery 或 runtime state。

---

# Bootstrap 完成交接

SAPDP v1.6.4 要求产品 Bootstrap 完成后使用压缩输出。

产品 Bootstrap 完成后，Codex 最终输出必须使用：

```text
RESULT:
PASS / FAIL

PROTOCOL:
vX.Y.Z

STATE:
Problem -> Create ProblemDefinition_CORE_v1.md

PROJECT_DIR:
<absolute project root>
```

如果 FAIL，Bootstrap 只能额外输出：

```text
BLOCKER:
<one concise blocker>
```

Problem Stage 默认在 ChatGPT 执行。

新产品 Bootstrap 应建议创建名为 <Name> 的 ChatGPT Project；如果该产品已有绑定的 ChatGPT Project，则复用它。

如果远程 product commit 存在，ChatGPT audit 必须使用 Commit URL。

文件上传列表仅作为 fallback。

如果远程 product commit 不存在，Codex 必须输出本地 commit SHA 和精确 push 命令，且 Result 不得为 PASS。

Codex 最终输出不得显示内部 Bootstrap state 名称，也不得输出冲突的 verified commit 值。

---

# Bootstrap 工作区边界

交接内容还必须告诉用户：

```text
Open or switch Codex workspace to:

<Project Root>

Use this initialized project directory as the active workspace.
Do not continue product implementation from the SAPDP protocol repository.
Codex must not continue product work from the SAPDP protocol repository.
```

---

# 仓库结构

- [README.md](./README.md)
- [README.zh-CN.md](./README.zh-CN.md)
- [START.md](./START.md)
- [DEVELOPER.md](./DEVELOPER.md)
- [engine/](./engine/)
- [templates/](./templates/)
- [internal/](./internal/)

### engine/

Codex 运行时执行层。

### templates/

产品研发过程中的 Artifact 模板库。

### internal/

SAPDP 协议源文件、决策记录、问题基线以及维护资料。

---

# 开发者入口

如果你想使用 SAPDP 开发产品：

[启动 SAPDP](./START.md)

如果你想参与 SAPDP 本身的维护与演进：

[阅读 DEVELOPER.md](./DEVELOPER.md)

---

# 核心理念

SAPDP 建立在一个简单原则之上：

```text
人负责决策

AI负责执行

系统负责流程
```
