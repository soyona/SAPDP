# SAPDP

AI 原生单人产品研发系统

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

不知道下一步做什么

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
MVP Scope
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

下一步动作
```

开发者无需手工维护流程状态。

---

# 快速开始

请打开：

```text
START.md
```

按照其中的说明启动项目。

通常情况下，一个新项目可在数分钟内完成初始化。

---

# 协议发布审计交接

SAPDP v1.2.6 要求使用最小化协议发布审计交接输出。

Codex 只有在完成以下事项后，才可以报告 SAPDP 协议发布 PASS：

```text
提交变更

将提交推送到远程 main

创建版本标签

将版本标签推送到远程

验证远程提交

验证远程标签

在最小化最终输出中包含 Commit URL 和 Tag URL
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
Protocol Release Audit Handoff

Version:
vX.Y.Z

Commit URL:
https://github.com/soyona/SAPDP/commit/<sha>

Tag URL:
https://github.com/soyona/SAPDP/releases/tag/vX.Y.Z

Files Changed:
<n>

Release Result:
PASS / PATCH REQUIRED / FAIL
```

最终输出不得重复 Repository、Branch、Commit SHA、Tag、remote verification、validation checklist 或 git execution logs。

---

# 产品工作流交接与 Token 效率

SAPDP v1.4.0 统一产品研发 workflow 的环境感知交接格式与 Git 审计来源。

它不新增生命周期阶段，不新增 artifact，也不新增状态模型。

Codex 完成产品实现任务后的最终输出必须使用：

```text
Codex Completion Handoff

Project:
<name>

Commit URL:
<url>

Changed:
<n>

Tests:
PASS / FAIL / NOT RUN

Result:
PASS / PATCH REQUIRED / FAIL

ChatGPT Audit:
<Commit URL>
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

生命周期阶段完成交接必须显示下一步执行环境：

```text
Current:
<stage>

Done:
<artifact/result>

Environment:
ChatGPT | Codex | Git | Human

Session:
NEW | CURRENT | REUSE_EXISTING

Action:
<one executable action>
```

Git 是默认审计记忆。人工复制粘贴仅作为 fallback。

---

# Bootstrap 完成交接

SAPDP v1.4.0 要求产品 Bootstrap 完成后使用最小化、Git 优先、环境感知的交接格式。

产品 Bootstrap 完成后，Codex 最终输出必须使用：

```text
Bootstrap Handoff

Project:
<Name>

Commit URL:
<remote product commit URL>

Environment:
ChatGPT

ChatGPT Project:
<Name>

Session:
NEW

Startup:
Load SAPDP from:
https://github.com/soyona/SAPDP

Audit product commit:
<remote product commit URL>

Action:
Create ProblemDefinition_CORE_v1.md

Workspace:
<absolute project root>

Result:
PASS | PATCH REQUIRED | FAIL

Do not continue product implementation from the SAPDP protocol repository.
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

```text
README.md
START.md
DEVELOPER.md

engine/
templates/
internal/
```

### engine/

Codex 运行时执行层。

### templates/

产品研发过程中的 Artifact 模板库。

### internal/

SAPDP 协议源文件、决策记录、问题基线以及维护资料。

---

# 开发者入口

如果你想使用 SAPDP 开发产品：

```text
打开 START.md
```

如果你想参与 SAPDP 本身的维护与演进：

```text
打开 DEVELOPER.md
```

---

# 核心理念

SAPDP 建立在一个简单原则之上：

```text
人负责决策

AI负责执行

系统负责流程
```
