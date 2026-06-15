# SAPDP Problem Baseline

## Purpose

This document records the validated recurring problems that justify the existence of:

SAPDP

(Solo AI Product Development Protocol)

The purpose of this document is to preserve:

* Why SAPDP exists
* What problems SAPDP attempts to solve
* The original observations that led to SAPDP research
* The validation source for future SAPDP design decisions

This document is part of the Canonical Document Set.

---

# How To Use This Document

This document is a problem baseline.

It records validated problems only.

This document should be used to:

* Understand why SAPDP exists
* Evaluate future SAPDP proposals
* Prevent future design drift
* Preserve original observations

Future SAPDP research and design should remain traceable to the validated problems recorded here.

---

# Problem ID Rules

Problem IDs are immutable.

Once assigned:

P-001
P-002
P-003
...

must never be renumbered.

Deprecated problems may be marked as:

Deprecated

but identifiers remain permanently reserved.

---

# Status Definitions

Observed

Problem has been observed but not yet validated.

Validated

Problem has been repeatedly observed and confirmed.

Partially Solved

Problem is partially addressed but still exists.

Solved

Problem is considered solved within SAPDP.

Deprecated

Problem is no longer relevant but remains preserved for historical traceability.

---

# Non Goals

This document is NOT:

* A solution document
* A design document
* A roadmap
* A lifecycle definition
* An architecture definition
* A workflow specification

This document records problems only.

Solutions belong elsewhere.

---

# Original Observation Preservation Rule

Original observations should be preserved whenever possible.

Future analysis may evolve.

Future interpretations may change.

Original observations are considered primary evidence and should not be removed without explicit review.

The original problem is more important than later theoretical explanations.

---

# Problem Domain 1

## Product Development Model

### P-001

#### Original Observation

想开发一款产品。

知道传统流程是需要经过：

市场调研

需求分析

方案设计

架构设计

等阶段。

总感觉太重。

总感觉应该存在更适合：

One Human
+
AI

的方式。

#### Tag

Traditional Development Overhead

#### Why It Matters

传统软件研发流程主要服务于组织协作。

对于 One Human + AI 场景，可能引入过多流程与文档成本。

#### Status

Validated

---

### P-002

#### Original Observation

开发产品时：

是否真的需要：

PRD

UI设计

架构设计

还是：

如何更快得到正确结果

才是核心目标。

#### Tag

AI-Native Product Validation Problem

#### Why It Matters

过程完整性不一定等于产品成功。

验证速度与结果质量可能比流程完整更重要。

#### Status

Validated

---

### P-003

#### Original Observation

开发一款产品时：

One Human
+
ChatGPT
+
Codex
+
Git

应该经过哪些阶段？

确定不能照搬传统开发模式。

但没有阶段又容易混乱。

#### Tag

Solo-AI Development Lifecycle Problem

#### Why It Matters

SAPDP未来必须回答：

AI辅助单人研发的最优生命周期是什么。

#### Status

Validated

---

# Problem Domain 2

## State Management

### P-004

#### Original Observation

Git维护工作：

每次 pull

push

add

commit

等具体执行操作。

触发时机由谁判断？

由谁执行？

#### Tag

Git State Management Problem

#### Why It Matters

Git已经被定义为System Memory。

状态管理机制不清晰会影响项目可恢复性。

#### Status

Validated

---

### P-005

#### Original Observation

Git的使用不能借鉴传统TEAM经验。

必须结合：

SAPDP

One Human
+
AI

场景重新设计。

禁止默认扩展：

多人协作

分支管理

Merge流程

等传统经验。

#### Tag

Solo-AI Git Optimization Problem

#### Why It Matters

传统Git实践可能不是SAPDP最优方案。

#### Status

Validated

---

### P-006

#### Original Observation

开发新产品时：

需要创建：

ChatGPT Project

Codex Project

Git Repo

目录结构

初始化文件

全部依赖人工完成。

#### Tag

Project Environment Initialization Problem

#### Why It Matters

项目启动成本过高。

#### Status

Validated

---

### P-007

#### Original Observation

产品启动过程缺乏统一Bootstrap。

每次项目启动都需要重复搭建。

#### Tag

Product Bootstrap Automation Problem

#### Why It Matters

重复劳动影响验证速度。

#### Status

Validated

---

### P-008

#### Original Observation

不知道何时应该新开会话。

通常是在：

会话卡顿

上下文膨胀

之后才被动创建新会话。

#### Tag

Session Lifecycle Problem

#### Why It Matters

会话生命周期管理缺失。

#### Status

Validated

---

### P-009

#### Original Observation

新建会话时。

需要当前会话生成正确Bootstrap。

依赖人工整理。

#### Tag

Session Bootstrap Generation Problem

#### Why It Matters

状态迁移成本高。

#### Status

Validated

---

### P-010

#### Original Observation

每次冻结内容时。

都需要手动复制到本地文件。

#### Tag

Conversation Freeze Synchronization Problem

#### Why It Matters

同步成本高。

容易遗漏。

#### Status

Validated

---

# Problem Domain 3

## Context Management

### P-011

#### Original Observation

新会话启动后。

恢复项目上下文成本较高。

#### Tag

Session Context Recovery Problem

#### Why It Matters

状态恢复直接影响开发效率。

#### Status

Validated

---

### P-012

#### Original Observation

项目进行过程中。

ChatGPT理解逐渐偏移。

#### Tag

Context Drift Problem

#### Why It Matters

会导致设计与实现偏离目标。

#### Status

Validated

---

### P-013

#### Original Observation

上下文越来越大。

文档越来越多。

维护成本越来越高。

#### Tag

Context Explosion Problem

#### Why It Matters

长期运行效率下降。

#### Status

Validated

---

# Problem Domain 4

## Human-AI Collaboration

### P-014

#### Original Observation

Codex理解的：

≠

Human想要的。

#### Tag

Codex Interpretation Drift

#### Why It Matters

导致返工与重复开发。

#### Status

Validated

---

### P-015

#### Original Observation

ChatGPT设计。

到Codex实现。

中间存在信息损失。

#### Tag

ChatGPT-Codex Translation Loss

#### Why It Matters

设计正确不代表实现正确。

#### Status

Validated

---

### P-016

#### Original Observation

ChatGPT + Codex协作。

需要人工复制粘贴。

效率过低。

#### Tag

ChatGPT-Codex Communication Problem

#### Why It Matters

协作链路效率低。

#### Status

Validated

---

### P-017

#### Original Observation

Human成为：

ChatGPT

与

Codex

之间的消息总线。

#### Tag

Human As Message Bus Problem

#### Why It Matters

Human成为系统瓶颈。

#### Status

Validated

---

### P-018

#### Original Observation

Human陷入：

复制

粘贴

同步

转发

状态。

虽然仍然负责判断与决策。

#### Tag

Human As Manual Router Problem

#### Why It Matters

高价值时间被机械劳动占据。

#### Status

Validated

---

### P-019

#### Original Observation

使用ChatGPT过程中。

总需要强调：

高标准

专业度

严格审核

担心：

不严谨

不专业

存在漏洞

因此不断设计提示词。

#### Tag

Prompt Burden And Trust Calibration Problem

#### Why It Matters

Human逐渐变成Prompt管理员。

#### Status

Validated

---

# Problem Domain 5

## Output Quality

### P-020

#### Original Observation

Codex生成UI质量不稳定。

需要反复修改提示词。

#### Tag

UI Quality Instability Problem

#### Why It Matters

增加迭代成本。

#### Status

Validated

---

### P-021

#### Original Observation

脑海中的产品。

与AI最终生成的产品。

经常存在偏差。

#### Tag

Expected Outcome Translation Problem

#### Why It Matters

预期传递能力不足。

#### Status

Validated

---

# Problem Domain 6

## Decision And Traceability

### P-022

#### Original Observation

时间久后。

不知道为什么这样设计。

#### Tag

Decision Traceability Problem

#### Why It Matters

决策历史容易丢失。

#### Status

Validated

---

### P-023

#### Original Observation

同一个问题。

反复讨论。

反复分析。

反复决策。

#### Tag

Repeated Decision Problem

#### Why It Matters

浪费时间。

降低一致性。

#### Status

Validated

---

### P-024

#### Original Observation

冻结之后。

各文件之间同步困难。

#### Tag

Freeze Consistency Problem

#### Why It Matters

系统状态可能不一致。

#### Status

Validated

---

### P-025

#### Original Observation

文档越来越多。

维护越来越困难。

#### Tag

Documentation Explosion Problem

#### Why It Matters

维护成本持续增长。

#### Status

Validated

---

# Problem Domain 7

## Research Governance

### P-026

#### Original Observation

讨论越来越抽象。

越来越脱离真实问题。

#### Tag

Theory Inflation Problem

#### Why It Matters

容易脱离现实需求。

#### Status

Validated

---

### P-027

#### Original Observation

讨论很多。

冻结很少。

推进速度下降。

#### Tag

Research Velocity Problem

#### Why It Matters

影响SAPDP迭代效率。

#### Status

Validated

---

### P-028

#### Original Observation

担心SAPDP设计跑偏。

担心变成：

更复杂

更多文档

更多流程

更多管理

的新体系。

#### Tag

Design Direction Drift Problem

#### Why It Matters

SAPDP必须持续聚焦于解决真实问题。

#### Status

Validated

---


# Problem Domain 8

## Lifecycle

### P-029

#### Original Observation

需求分析结束后。

产品设计可能位于新的会话。

MVP Scope 可能位于新的会话。

Build 可能位于新的会话。

前阶段已经形成的结论。

无法自动被后续阶段可靠继承。

经常需要重新解释。

重新分析。

重新恢复上下文。

#### Tag

Cross-Session State Continuity Problem

#### Why It Matters

阶段之间缺乏可靠状态连续性。

会增加上下文恢复成本。

导致重复分析与设计漂移。

#### Status

Validated

---

### P-030

#### Original Observation

开发过程中。

需要记住：

当前阶段。

下一阶段。

阶段输入。

阶段输出。

Required Artifact。

流程推进依赖人工记忆。

#### Tag

Workflow Memory Ownership Problem

#### Why It Matters

Human 不应成为流程状态存储器。

流程记忆成本会随着项目复杂度持续增加。

#### Status

Validated

---

### P-031

#### Original Observation

阶段完成后。

不知道应该由谁推动进入下一阶段。

通常依赖人工判断：

下一步做什么。

导致流程推进不稳定。

不同项目之间执行方式不一致。

#### Tag

Workflow Progression Ownership Problem

#### Why It Matters

流程推进责任不清晰。

会导致阶段停滞。

遗漏步骤。

执行不一致。

#### Status

Validated

---

### P-032

#### Original Observation

进入新阶段时。

无法自动确定：

需要哪些输入。

需要读取哪些结论。

需要加载哪些产物。

经常依赖人工查找和整理。

#### Tag

Artifact Discovery Problem

#### Why It Matters

阶段衔接成本高。

增加上下文恢复成本。

容易遗漏关键输入。

#### Status

Validated


# Problem Domain 9

## Artifact System & Project Bootstrap

### P-033

#### Original Observation

开发进入新阶段时。

经常不知道：

当前阶段应该产生哪些 Artifact。

哪些 Artifact 必须长期保存。

哪些 Artifact 可以丢弃。

不同项目之间产生的文档结构不一致。

难以形成统一规范。

#### Tag

Artifact Definition Problem

#### Why It Matters

Artifact 缺乏统一定义会导致：

上下文恢复困难。

协作成本增加。

项目之间难以复用。

#### Status

Validated

---

### P-034

#### Original Observation

进入新阶段时。

无法自动确定：

应该读取哪些 Artifact。

应该忽略哪些 Artifact。

需要依赖人工查找和判断。

#### Tag

Artifact Consumption Problem

#### Why It Matters

Artifact 与阶段之间缺乏明确关联。

增加上下文恢复成本。

容易遗漏关键输入。

#### Status

Validated

---

### P-035

#### Original Observation

随着项目推进。

Artifact 数量持续增长。

缺乏明确边界。

容易出现：

文档越来越多。

维护越来越困难。

不知道哪些仍有价值。

#### Tag

Artifact Explosion Problem

#### Why It Matters

Artifact 系统如果失控。

会重现传统研发中的文档负担。

#### Status

Validated

---

### P-036

#### Original Observation

创建新项目时。

需要重复创建：

项目目录。

初始化文件。

研发文档。

协作文件。

状态文件。

每个项目都需要重新搭建。

#### Tag

Project Scaffold Problem

#### Why It Matters

项目启动成本过高。

难以标准化。

影响 Idea → Validation 速度。

#### Status

Validated

---

### P-037

#### Original Observation

即使形成了 SAPDP 协议。

仍然无法确定：

如何将协议规则转化为实际执行系统。

如何保证不同项目按照相同方式运行。

协议与实际执行之间存在明显落差。

#### Tag

Protocol To Scaffold Gap Problem

#### Why It Matters
协议如果无法稳定落地。

将难以形成可复制研发体系。

协议价值无法持续复用。

#### Status

Validated

---

### P-038

#### Original Observation

随着 SAPDP 演化。

协议定义。

Artifact 定义。

项目结构定义。

初始化定义。

可能分散在多个位置。

难以判断：

什么是规范。

什么是实现。

什么是运行时状态。

#### Tag

Protocol Engineering Boundary Problem

#### Why It Matters

职责边界不清晰。

容易导致系统不断膨胀。

#### Status

Validated

---

### P-039

#### Original Observation

Reality Validation Round-2 observed:

Project Name:

```text
The Super Mario
```

but generated Project Root:

```text
initialize-a-new-project-using-sapdp
```

Project Root was derived from startup instruction instead of Project Name.

#### Tag

Project Identity Resolution Problem

#### Why It Matters

Bootstrap can appear valid while initializing the wrong Product Project Root.

#### Status

Validated

---

### P-040

#### Original Observation

Reality Validation Round-2 observed Bootstrap internal execution directories inside the final Product Project Root:

```text
outputs/
work/
```

#### Tag

Bootstrap Scaffold Conformance Problem

#### Why It Matters

Bootstrap can pass existence checks while producing a scaffold that does not conform to SAPDP Project Scaffold.

#### Status

Validated



# Maintenance Rule

New validated problems may be appended.

Existing problem identifiers must not change.

Existing original observations should be preserved whenever possible.

The purpose of this document is traceability rather than problem management.


# Summary

SAPDP exists because the problems recorded in this document repeatedly occur during:

One Human
+
ChatGPT
+
Codex
+
Git

collaboration.

Future SAPDP research, design, validation, lifecycle design, documentation design, Git strategy design, and Human-AI collaboration design should remain traceable to the validated problems recorded in this document.



# Problem Domain 10

## Reality Validation Findings

Validation Source:

PinyinLearningWeb

Purpose:

Preserve project execution findings discovered during SAPDP v1 Reality Validation.

Issue identifiers are intentionally preserved.

These identifiers are cross-referenced by:

SAPDP_DECISION_LOG.md

Reality Validation Records

SAPDP v1 Patch Cycle

Issue identifiers must not be renumbered.

---

### Issue-001

#### Original Observation

新项目PinyinLearningWeb初始化目录需要人工创建。

没有初始化脚本。

效率低下。

#### Tag

Project Initialization Automation Problem

#### Why It Matters

项目启动成本仍然较高。

影响：

Idea → Validation

速度。

#### Status

Solved

#### Resolution

D-0061

Project Bootstrap Protocol

---

### Issue-002

#### Original Observation

初始化阶段：

需要创建：

ChatGPT Project

Codex Project

Sources

但协议没有明确说明：

如何配置。

配置步骤是什么。

#### Tag

Project Environment Setup Guidance Problem

#### Why It Matters

项目启动流程缺乏可执行指导。

#### Status

Solved

#### Resolution

D-0061

Project Bootstrap Protocol

---

### Issue-003

#### Original Observation

ChatGPT Project

Codex Project

缺乏统一项目指令加载机制。

容易出现：

执行约束不一致。

理解偏差。

#### Tag

Project Instruction Resolution Problem

#### Why It Matters

影响跨环境执行一致性。

#### Status

Solved

#### Resolution

D-0064

Project Instruction Resolution Protocol

---

### Issue-004

#### Original Observation

项目初始化完成后。

不知道：

第一个会话如何开始。

应该进入哪个阶段。

需要加载什么。

#### Tag

Project Entry Point Problem

#### Why It Matters

项目启动缺乏明确入口。

#### Status

Solved

#### Resolution

D-0061

Project Bootstrap Protocol

---

### Issue-005

#### Original Observation

开发过程中。

无法快速知道：

当前阶段。

整体进度。

剩余阶段。

#### Tag

Lifecycle Visibility Problem

#### Why It Matters

流程状态可见性不足。

#### Status

Solved

#### Resolution

D-0062

Runtime Completion Contract

---

### Issue-006

#### Original Observation

阶段完成后。

不知道：

是否应该新开会话。

新会话如何开始。

需要加载什么。

#### Tag

Session Transition Guidance Problem

#### Why It Matters

阶段切换成本高。

#### Status

Solved

#### Resolution

D-0062

Runtime Completion Contract

---

### Issue-007

#### Original Observation

流程推进提示。

与当前阶段任务内容。

混杂在一起。

难以区分。

#### Tag

Runtime Guidance Presentation Problem

#### Why It Matters

降低执行可读性。

#### Status

Validated

#### Resolution

Unresolved

Future Backlog

---

### Issue-008

#### Original Observation

长Markdown内容。

有时无法完整复制。

存在截断风险。

#### Tag

Artifact Delivery Reliability Problem

#### Why It Matters

Artifact交付可靠性不足。

#### Status

Solved

#### Resolution

D-0065

Artifact Delivery Protocol

---

### Issue-009

#### Original Observation

TaskPackage生成后。

没有明确说明：

下一步应该在Codex执行什么。

#### Tag

Execution Handoff Problem

#### Why It Matters

ChatGPT → Codex

交接不完整。

#### Status

Solved

#### Resolution

D-0063

Artifact-Based Handoff Protocol

---

### Issue-010

#### Original Observation

Codex完成实现后。

不知道：

下一步进入哪个阶段。

需要提交什么材料。

#### Tag

Implementation Completion Handoff Problem

#### Why It Matters

Codex → Verification

交接不完整。

#### Status

Solved

#### Resolution

D-0062

Runtime Completion Contract

D-0063

Artifact-Based Handoff Protocol

---

### Issue-011

#### Original Observation

Implementation Verification时。

审核材料收集与上传效率较低。

#### Tag

Verification Material Delivery Problem

#### Why It Matters

增加审核成本。

#### Status

Solved

#### Resolution

D-0063

Artifact-Based Handoff Protocol

D-0065

Artifact Delivery Protocol

---

### Issue-012

#### Original Observation

Implementation Verification完成后。

虽然给出了：

User Validation

但没有明确说明：

是否需要新会话。

新会话名称是什么。

Bootstrap是什么。

#### Tag

Lifecycle Completion Guidance Problem

#### Why It Matters

阶段完成后的执行连续性不足。

#### Status

Solved

#### Resolution

D-0062

Runtime Completion Contract


---

# Problem Domain 10

## Bootstrap To Lifecycle Handoff

### P-038

#### Original Observation

Reality Validation Round-1 中，Codex 完成新项目 Bootstrap 后返回：

Bootstrap Audit Result:
PASS

Current Stage:
Problem

Next Action:
Create ProblemDefinition_CORE_v1.md

但没有明确说明：

下一步应在哪个环境执行

需要加载哪些文件

应该由 ChatGPT 还是 Codex 执行

应输入什么启动指令

应生成哪个 Artifact

生成后如何更新 Runtime

完成后如何进入下一阶段

导致使用者不知道 Bootstrap PASS 后如何继续。

#### Tag

Bootstrap Completion Handoff Problem

#### Why It Matters

Bootstrap 虽然完成了项目初始化，但没有形成可执行的 Lifecycle Entry Handoff。

如果 Bootstrap PASS 后仍需要 Human 自行判断下一步操作，SAPDP 仍然没有彻底解决：

Workflow Memory Ownership Problem

Workflow Progression Ownership Problem

Artifact Discovery Problem

Human As Manual Router Problem

该问题会导致 Bootstrap 到 Problem Stage 的衔接依赖人工理解，而不是协议驱动。

#### Status

Validated
