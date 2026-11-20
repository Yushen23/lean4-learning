import Mathlib

-- 定理：自然数加法交换律的一个具体例子
-- 证明 2 + 3 = 3 + 2
theorem add_comm_example : 2 + 3 = 3 + 2 := by
  omega

-- 定理：对任意自然数 n，n + 0 = n
theorem add_zero (n : Nat) : n + 0 = n := by
  omega

-- 定理：对任意自然数 a b，a + b = b + a（加法交换律）
theorem add_comm (a b : Nat) : a + b = b + a := by
  omega
