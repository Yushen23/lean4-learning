import Mathlib

set_option linter.style.header false

/-!
# 经典定理证明

这一部分是「入门毕业」的标志：几个经典数学定理的证明。
包括数学归纳法证明求和公式、以及一些基础的数论命题。
-/

/- ## 求和公式：1 + 2 + ... + n = n(n+1)/2 -/

-- 先定义「前 n 个自然数之和」1 + 2 + ... + n
def sumUpTo : Nat → Nat
  | 0 => 0
  | n + 1 => (n + 1) + sumUpTo n

-- 高斯求和公式的证明（数学归纳法）
theorem sum_formula (n : Nat) : 2 * sumUpTo n = n * (n + 1) := by
  induction n with
  | zero => rfl
  | succ k ih =>
      -- 归纳步骤：假设对 k 成立，证明对 k+1 成立
      rw [sumUpTo]
      nlinarith [ih]

/- ## 奇偶性 -/

-- 偶数的定义：存在 k 使得 n = 2*k
def IsEven (n : Nat) : Prop := ∃ k : Nat, n = 2 * k

-- 0 是偶数
theorem zero_is_even : IsEven 0 := by
  exact ⟨0, by simp⟩

-- 2 是偶数
theorem two_is_even : IsEven 2 := by
  exact ⟨1, by simp⟩

-- 偶数加偶数是偶数
theorem even_add_even {m n : Nat} (hm : IsEven m) (hn : IsEven n) : IsEven (m + n) := by
  rcases hm with ⟨a, ha⟩
  rcases hn with ⟨b, hb⟩
  use a + b
  rw [ha, hb]
  ring

/- ## 整除性 -/

-- d 整除 n 的定义
def Divides (d n : Nat) : Prop := ∃ k : Nat, n = d * k

-- 任何数整除 0
theorem everything_divides_zero (d : Nat) : Divides d 0 := by
  use 0
  simp

-- 1 整除任何数
theorem one_divides_everything (n : Nat) : Divides 1 n := by
  use n
  simp

/- ## 平方的非负性（整数） -/

-- 任何整数的平方都非负
theorem square_nonneg (x : Int) : x ^ 2 ≥ 0 := by
  exact sq_nonneg x
