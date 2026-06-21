# SAPDP 中文启动手册

SAPDP 是一套面向 Human 用户的 AI 协同产品研发协议。它帮助你在 ChatGPT、Codex、Git/GitHub 之间建立清晰分工，用文件和 Git 替代不可靠的会话记忆，让产品研发过程可以被继续、审核和修复。

当前协议将 DNA 分为 Visual DNA（How It Looks）和 Product DNA（How It Works）。完成 Problem 和 Solution 后，Human 必须分别选择一个 Visual DNA 和一个 Product DNA，再进入 Product Representation。两类 DNA 可自由组合且职责不得重叠；DNA 不绑定框架、语言、数据库或技术栈。

DNA 目录与使用规则见 [`dna/README.md`](dna/README.md)。

## SAPDP 能带来什么

SAPDP 主要解决 AI 协同开发中的这些问题：

- 降低上下文丢失：关键决策、阶段状态、任务结果都沉淀到文件和 Git 中，而不是只留在聊天记录里。
- 明确 ChatGPT / Codex / Git 分工：ChatGPT 负责规划和审核，Codex 负责读取协议并修改工作区，Git/GitHub 负责保存事实。
- 用文件和 Git 替代会话记忆：产品定义、阶段产物、执行结果以仓库文件和 commit 记录为准。
- 稳定复刻视觉与产品体验：Visual DNA 和 Product DNA 减少设计漂移、返工和重复上下文消耗。
- 用 Commit URL 作为审核依据：ChatGPT 审核 Codex 工作时，应基于 Commit URL，而不是基于口头描述。
- 支持闭环修复：ChatGPT 给出 `PATCH REQUIRED` 后，Codex 按审核结果修复、提交，并返回新的 Commit URL。

## 适用环境

SAPDP 适用于：

- ChatGPT + Codex + Git/GitHub
- ChatGPT Project / 文件 / 指令，如果当前界面支持
- Codex Project / Workspace / Task，绑定产品目录或 Git 仓库
- 具体入口以当前官方界面为准

三类工具的分工如下：

- ChatGPT：规划、产品定义、任务设计、审核。
- Codex：读取协议、初始化工作区、修改文件/代码、测试、git commit。
- Git/GitHub：事实源和审核依据。

## 先区分两个仓库

使用 SAPDP 前，先明确两个对象：

- SAPDP 仓库：协议来源，用来保存和演化 SAPDP 协议。
- 产品目录/仓库：实际产品工作区，用来开发你的产品。

不要在 SAPDP 仓库里开发产品文件。只有升级 SAPDP 协议本身时，才在 SAPDP 协议仓库中操作。创建或继续产品时，应在产品目录/仓库中操作。

## 场景路由

- 输入 `sapdp`（不区分大小写）会显示 SAPDP Home，版本从 [`SAPDP.md`](SAPDP.md) 第一行解析，不会自动进入任何流程。
- 输入 `sapdp` 并附带用户内容时，会直接路由到对应入口，不显示 SAPDP Home。
- 如果还在探索产品想法：先用 ChatGPT。
- 如果要创建全新产品：在 Codex 中使用空产品目录/仓库。
- 如果要继续一个遵循 SAPDP 协议的项目：在 Codex 中打开该产品目录/仓库。
- 如果已有代码项目想接入 SAPDP：先问 ChatGPT，不要直接 Build。
- 如果要升级 SAPDP 协议本身：在 SAPDP 协议仓库中操作。

SAPDP Home、Intent Router 和模式边界由 [`SAPDP.md`](SAPDP.md) 的 Invocation 章节定义。

## 场景 A：产品想法还不清楚

环境：ChatGPT

可复制提示词：

```text
我想用 SAPDP 开发一个产品。

产品想法：
<写下你的想法>

请先帮我澄清：
1. 目标用户
2. 真实问题
3. 核心使用场景
4. MVP 边界

不要进入 Codex 执行。
```

## 场景 B：创建全新产品

环境：Codex + 产品目录/仓库

步骤：

1. 创建或打开一个空产品目录/仓库。
2. 在 Codex 中创建/打开绑定该产品目录或仓库的 Project / Workspace / Task。
3. 不要把 SAPDP 仓库作为产品工作区。
4. 首次启动时，向 Codex 提供 SAPDP 协议仓库 URL。

Codex 首次启动提示词：

```text
SAPDP

Protocol:
https://github.com/soyona/SAPDP.git

Goal:
Build <产品名称>
```

Codex 必须从 SAPDP 协议仓库读取协议，在当前产品工作区执行 Bootstrap，commit，并只返回 Commit URL。

## Bootstrap 定义

Bootstrap 不是写业务代码。

Bootstrap 是把空产品工作区初始化成遵循 SAPDP 协议的工作区。它应建立必要的协议文件、状态文件和后续阶段入口，让产品工作区可以被 ChatGPT 审核和继续。

Bootstrap PASS 后，不要直接开始写代码，应回到 ChatGPT 进入 Problem 阶段。

## DNA Selection

DNA Selection 位于 Solution 和 Product Representation 之间：

```text
Problem
↓
Solution
↓
DNA Selection
↓
Product Representation
```

输入为已批准的 Problem 和 Solution，输出为一个 Selected Visual DNA 和一个 Selected Product DNA。Human 可以请求 DNA Recommendation，也可以直接从 DNA Library 选择。任意 Visual DNA 与任意 Product DNA 均可自由组合；同一 DNA Type 不得选择多个资产。

Selected Visual DNA 和 Selected Product DNA 是 Product Representation、Product Requirement、UX Specification、Visual Design Specification、MVP Definition、Task Package、Build、Implementation Verification 和 User Validation 的必需输入。

## Bootstrap 审核

环境：ChatGPT

可复制提示词：

```text
请审核这个 SAPDP Bootstrap 结果：
<Commit URL>
```

## PASS 后下一步

环境：ChatGPT

可复制提示词：

```text
请基于 SAPDP 进入 Problem 阶段，生成 ProblemDefinition_CORE_v1.md。
```

## PATCH REQUIRED 闭环

当 ChatGPT 审核后给出 `PATCH REQUIRED`，把审核内容交给 Codex 修复。

环境：Codex + 当前产品目录/仓库

可复制提示词：

```text
请按以下 ChatGPT 审核结果修复。
修复后 commit 并只返回 Commit URL。

<PATCH REQUIRED 内容>
```

Codex 修复后仍应保持 Git-Native Handoff：只返回新的 Commit URL。然后 Human 再把新的 Commit URL 交给 ChatGPT 审核。

## 场景 C：继续一个遵循 SAPDP 协议的项目

环境：Codex + 遵循 SAPDP 协议的项目目录/仓库

如果需要显式提供协议来源，可复制提示词：

```text
SAPDP

Protocol:
https://github.com/soyona/SAPDP.git

Goal:
Continue <产品名称>
```

如果项目中已记录协议来源，可使用简化提示词：

```text
SAPDP

Goal:
Continue <产品名称>
```

Codex 应读取当前项目中的 SAPDP 状态和协议记录，在当前产品工作区继续执行，并在完成后 commit，只返回 Commit URL。

## 场景 D：已有代码项目接入 SAPDP

环境：ChatGPT

已有代码项目不要直接 Bootstrap，也不要直接进入 Build。先让 ChatGPT 判断最小风险接入方案。

可复制提示词：

```text
我有一个已有代码项目，想接入 SAPDP。

项目情况：
- 项目名称：
- 技术栈：
- 当前 Git 仓库：
- 当前目录结构：
- 当前阶段：
- 我想解决的问题：

请判断如何接入 SAPDP。
不要直接 Bootstrap。
先给出最小风险接入方案。
```

## 场景 E：升级 SAPDP 协议本身

环境：SAPDP 协议仓库

只有协议演化才在 SAPDP 仓库中操作。

可复制提示词：

```text
SAPDP

Goal:
Upgrade SAPDP
```

## 旧协议兜底

如果 Codex 可能使用了旧版 SAPDP，可复制提示词：

```text
请刷新 SAPDP 协议源到 origin/main 后重新执行。
```

## Git-Native Handoff

SAPDP 的审核依据是 Git/GitHub 中的事实，而不是聊天中的解释。

因此，当 Codex 完成 Bootstrap、修复或阶段任务后，应：

1. 修改当前产品目录/仓库中的文件。
2. 运行必要检查。
3. 执行 git commit。
4. 只返回 Commit URL。

Human 再把 Commit URL 交给 ChatGPT 审核。ChatGPT 审核结果如果是 `PASS`，进入下一阶段；如果是 `PATCH REQUIRED`，把修复要求交给 Codex，Codex 修复后提交并返回新的 Commit URL。
