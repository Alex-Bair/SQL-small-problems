=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: integer representing the nth Fibonacci number
-  Output: integer representing the nth Fibonacci number

---

**Problem Domain:**
Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers:

1 1 2 3 5 8 13 21 etc...

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

A recursive method is one in which the method calls itself.
Recurvise methods have three primary qualities:
  - They call themselve at least once
  - They have a condition that stops the recursion
  - They use the result returned by themselves.

---

**Explicit Requirements:**
- Input is an integer
- Output is an integer
---


**Implicit Requirements:**
- None obvious
- Base conditions are:
  fibonacci(1) = 1
  fibonacci(2) = 2
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

Use base cases of fibonacci(1) = 1 and fibonacci(2) = 2 to recursively determine the nth fibonacci number.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

fibonacci(1) == 1
1

fibonacci(2) == 1
1 1

fibonacci(3) == 2
2
1 1

fibonacci(4) == 3
3
2   1
1 1 1

fibonacci(5) == 5

5
3     2
2   1 1 1
1 1 1 1 1

fibonacci(12) == 144
fibonacci(20) == 6765

---

Data Structure
--------------

---

Algorithm
---------

- Return 1 if the input integer n is 1 or 2. (base fibonacci numbers)
- Calculate the fibonacci number of (n - 1) and add the fibonacci number of (n - 2).

Code
----

=end

def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765