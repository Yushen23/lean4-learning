import Mathlib

/-!
# 基础策略

这一部分系统学习 Lean 4 定理证明中最常用的策略（tactics）。
每个定理都演示一种策略的用法。
-/

/- ## 一、闭合目标的策略 -/

-- rfl：证明左右两边「算出来完全相同」的等式
theorem tactic_rfl : 1 + 1 = 2 := by
  rfl

-- exact：直接给出证明项
theorem tactic_exact : 2 + 3 = 5 := by
  exact rfl

-- assumption：目标正好是某个已知假设时直接用
theorem tactic_assumption (h : 2 + 3 = 5) : 2 + 3 = 5 := by
  assumption

/- ## 二、化简策略 -/

-- simp：自动化简
theorem tactic_simp : (fun x => x + 0) 5 = 5 := by
  simp

-- rw：用定理重写目标
theorem tactic_rw (a b c : Nat) (h : a + b = c) : a + b + 0 = c := by
  rw [Nat.add_zero]
  exact h

/- ## 三、拆解结构的策略 -/

-- intro：引入全称量词
theorem tactic_intro : ∀ n : Nat, n + 0 = n := by
  intro n
  omega

-- constructor：拆解「且」∧ 为两个目标
theorem tactic_constructor : (1 + 1 = 2) ∧ (2 + 2 = 4) := by
  constructor
  · rfl
  · rfl

-- cases：分类讨论（布尔值）
theorem tactic_cases (b : Bool) : b = true ∨ b = false := by
  cases b
  · left
    rfl
  · right
    rfl

-- induction：数学归纳法
theorem tactic_induction (n : Nat) : n + 0 = n := by
  induction n with
  | zero => rfl
  | succ k ih =>
      omega

/- ## 四、算术自动策略 -/

-- omega：自然数/整数线性算术
theorem tactic_omega (x : Nat) (h : x > 5) : x > 3 := by
  omega

-- ring：多项式恒等式
theorem tactic_ring (a b : Nat) : (a + b) * (a + b) = a * a + 2 * a * b + b * b := by
  ring

/- ## 五、进阶策略 -/

-- have：先证中间结论
theorem tactic_have (a : Nat) : a + 0 = a := by
  have h : a + 0 = a := by omega
  exact h

-- by_contra：反证法
theorem tactic_by_contra : 1 ≠ 2 := by
  by_contra h
  omega
