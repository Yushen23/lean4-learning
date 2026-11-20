import Mathlib

set_option linter.style.header false

/-!
# 基本语法

这一部分演示 Lean 4 作为「编程语言」的基础语法：
类型、函数定义、模式匹配、条件表达式。
-/

/- ## 基本类型 -/

-- 自然数、整数、布尔值、字符串
#check Nat
#check Int
#check Bool
#check String

-- 字面量及其类型
#check 42
#check (42 : Nat)
#check true
#check "hello"

/- ## 函数定义 -/

-- 定义一个「加倍」函数
def double (n : Nat) : Nat := n * 2

#eval double 5

-- 定义「平方」函数
def mySquare (n : Nat) : Nat := n * n

#eval mySquare 7

-- 多个参数的函数
def myAdd (a b : Nat) : Nat := a + b

#eval myAdd 3 4

/- ## 递归函数 -/

-- 阶乘：n! = n * (n-1) * ... * 1
def myFactorial : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * myFactorial n

#eval myFactorial 5

-- 斐波那契数列
def myFib : Nat → Nat
  | 0 => 0
  | 1 => 1
  | n + 2 => myFib n + myFib (n + 1)

#eval myFib 10

/- ## 模式匹配 -/

-- 用 match 对自然数分类
def describe (n : Nat) : String :=
  match n with
  | 0 => "零"
  | 1 => "一"
  | _ => "大于一"

#eval describe 0
#eval describe 5

/- ## 条件表达式 -/

def myAbs (n : Int) : Int :=
  if n >= (0 : Int) then n else -n

#eval myAbs (-5)
#eval myAbs 7
