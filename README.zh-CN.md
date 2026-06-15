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

ChatGPT Audit:

Load SAPDP from:
https://github.com/soyona/SAPDP

Audit Release:
vX.Y.Z
```

最终输出不得重复 Repository、Branch、Commit SHA、Tag、remote verification、validation checklist 或 git execution logs。

---

# Bootstrap 完成体验修复

SAPDP v1.2.4 将本地 Bootstrap 成功与远程 Git 验证分开表达。

Bootstrap 完成结果必须报告：

```text
Local Bootstrap Result:
LOCAL_BOOTSTRAP_PASS or LOCAL_BOOTSTRAP_FAIL

Remote Git Validation:
REMOTE_VALIDATION_PASS or REMOTE_VALIDATION_PENDING or REMOTE_VALIDATION_FAIL

Overall Stage Entry:
PROBLEM_STAGE_ALLOWED or PROBLEM_STAGE_BLOCKED
```

如果本地 Bootstrap 成功且必需的 Bootstrap artifacts 均存在，即使 Remote Git Validation 为 REMOTE_VALIDATION_PENDING，也可以允许进入 Problem Stage。

远程验证 pending 是可追溯性限制，不是本地 Bootstrap 失败。

Codex 初始化后的最终输出必须包含：

```text
A. Bootstrap Summary
B. ChatGPT Handoff
C. Codex Workspace Handoff
D. Problem Stage Entry
E. Remote Git Validation
F. Final Decision
```

当本地 Bootstrap 成功时，Final Decision 不得只输出模糊的 FAIL。

---

# Bootstrap 工作区交接

SAPDP v1.2.3 要求 Bootstrap 完成结果必须明确交接 ChatGPT 会话和 Codex 工作区。

## Post-Bootstrap ChatGPT Session Handoff

LOCAL_BOOTSTRAP_PASS 且 PROBLEM_STAGE_ALLOWED 后，交接内容必须告诉用户输入：

```text
Load SAPDP from:
https://github.com/soyona/SAPDP
```

新产品必须创建绑定该产品的 ChatGPT Project，并上传 Required Load Set。

Start from Problem Stage.

Generate ProblemDefinition_CORE_v1.md using ProblemDefinition_Template.md.

## Post-Bootstrap Codex Workspace Handoff

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
