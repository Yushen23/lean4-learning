# Lean 4 学习项目（Lean 4 Learning）

一个系统学习 [Lean 4](https://lean-lang.org/) 定理证明与函数式编程的入门项目，基于 [Mathlib](https://github.com/leanprover-community/mathlib4) 数学库。

## 项目简介

Lean 4 是微软研究院开发的**定理证明助手**兼**函数式编程语言**。它基于「命题即类型」的 Curry-Howard 同构思想，让数学证明可以像写代码一样被机器逐行验证。

本项目是作者学习 Lean 4 的完整记录，从环境配置、基本语法到定理证明，逐步进阶。

## 目录结构

```
proofs/
├── Proofs.lean              # 项目入口，import 所有模块
├── Proofs/
│   ├── Basic.lean           # 入门：第一个定理（加法交换律）
│   ├── Syntax.lean          # 基本语法：类型、函数、模式匹配、递归
│   ├── Tactics.lean         # 核心策略：rfl、simp、omega、induction 等
│   └── Theorems.lean        # 经典定理：求和公式、奇偶性、整除性
├── lakefile.toml            # 项目配置
├── lean-toolchain           # 指定 Lean 版本（v4.35.0）
└── lake-manifest.json       # 依赖清单（Mathlib 等）
```

## 学习路线

项目按以下顺序组织，建议按此顺序学习：

| 模块 | 内容 | 掌握目标 |
|------|------|---------|
| `Basic.lean` | 第一个定理 | 理解 `theorem`、`:= by`、`omega` |
| `Syntax.lean` | 基本语法 | 会用 `def`、`match`、递归、`#eval` |
| `Tactics.lean` | 核心策略 | 掌握 10+ 个常用策略 |
| `Theorems.lean` | 经典定理 | 能用归纳法独立证明数学命题 |

## 快速开始

### 环境要求

- [VS Code](https://code.visualstudio.com/)（推荐）
- [elan](https://github.com/leanprover/elan)（Lean 版本管理器）
- Git

### 安装步骤

1. **安装 elan**（Lean 版本管理器）：

   Windows（PowerShell）：
   ```powershell
   curl.exe -O --location https://elan.lean-lang.org/elan-init.ps1
   powershell -ExecutionPolicy Bypass -File elan-init.ps1
   ```

   macOS / Linux：
   ```bash
   curl https://elan.lean-lang.org/elan-init.sh -sSf | sh
   ```

2. **安装 VS Code 扩展**：在扩展市场搜索 `lean4`，安装发布者为 `leanprover` 的官方扩展。

3. **克隆本项目**：
   ```bash
   git clone git@github.com:Yushen23/lean4-learning.git
   cd lean4-learning
   ```

4. **构建项目**（首次会编译 Mathlib，需要较长时间）：
   ```bash
   lake build
   ```

5. **用 VS Code 打开项目文件夹**，即可开始交互式学习。

## 使用说明

- 每个 `.lean` 文件都包含带注释的完整示例
- 在 VS Code 中，光标停在任意代码上，右侧 **Lean InfoView** 面板会显示类型信息和证明状态
- 使用 `#eval` 计算表达式，`#check` 查询类型

## 核心概念速查

### 命题即类型（Curry-Howard 同构）

在 Lean 中，**定理 = 类型，证明 = 值**。证明一个定理，就是构造一个该类型的项。

### 常用策略

| 策略 | 作用 |
|------|------|
| `rfl` | 证明两边字面相同的等式 |
| `omega` | 自动解决自然数/整数线性算术 |
| `ring` | 自动解决多项式恒等式 |
| `simp` | 自动化简 |
| `intro` | 引入变量/假设 |
| `exact` | 用已知证明闭合目标 |
| `constructor` | 拆解「且」∧ 目标 |
| `cases` | 分类讨论 |
| `induction` | 数学归纳法 |
| `have` | 引入中间结论 |

## 参考资源

- [Lean 4 官方文档](https://lean-lang.org/)
- [Mathlib 文档](https://leanprover-community.github.io/mathlib4_docs/)
- [Mathematics in Lean（教材）](https://leanprover-community.github.io/mathematics_in_lean/)
- [Theorem Proving in Lean 4（教材）](https://leanprover.github.io/theorem_proving_in_lean4/)

## 许可证

MIT License
