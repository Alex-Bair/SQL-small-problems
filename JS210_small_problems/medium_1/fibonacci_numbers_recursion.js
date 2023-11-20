"use strict";
/*

The Fibonacci series is a sequence of numbers in which each number is the sum of the previous two numbers. The first two Fibonacci numbers are 1 and 1. The third number is 1 + 1 = 2, the fourth is 1 + 2 = 3, the fifth is 2 + 3 = 5, and so on. In mathematical terms, this can be represented as:

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

This simple sequence can easily be computed using a recursive function. A recursive function is one in which the function calls itself. For example, the following function is a recursive function that computes the sum of all integers between 1 and n:

function sum(n) {
  if (n === 1) {
    return 1;
  } else {
    return n + sum(n - 1);
  }
}

A good recursive function has three primary qualities:
It calls itself at least once.
It has an ending condition — e.g., if (n === 1), in the sum function above.
The results of each recursion are used in each step — e.g., n + sum(n - 1) uses sum(n - 1).


Write a recursive function that computes the nth Fibonacci number, where nth is an argument passed to the function.

NOTE: This exercise verges on the Advanced level of exercises, so do not be discouraged if you are not able to solve it on your own; recursion is tricky, and even experienced developers can have difficulty dealing with it.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: an integer `n` that represents the `nth` number in the fibonacci series
-  Output: an integer that is the `nth` number in the fibonacci series

---

**Problem Domain:**

The Fibonacci series is a sequence of numbers in which each number is the sum of the previous two numbers. The first two Fibonacci numbers are 1 and 1. The third number is 1 + 1 = 2, the fourth is 1 + 2 = 3, the fifth is 2 + 3 = 5, and so on. In mathematical terms, this can be represented as:

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

This simple sequence can easily be computed using a recursive function. A recursive function is one in which the function calls itself. For example, the following function is a recursive function that computes the sum of all integers between 1 and n:

function sum(n) {
  if (n === 1) {
    return 1;
  } else {
    return n + sum(n - 1);
  }
}

A good recursive function has three primary qualities:
It calls itself at least once.
It has an ending condition — e.g., if (n === 1), in the sum function above.
The results of each recursion are used in each step — e.g., n + sum(n - 1) uses sum(n - 1).

---

**Explicit Requirements:**
- Funciton must be a recursive function. Meaning we must
  - Call the function within itself
  - Have an ending condition
  - Must use the results of the recursion in each step
- The first two numbers of the fibonacci series are both 1
  - Meaning n = 1 and n = 2 should return 1.
---


**Implicit Requirements:**
- function must be called fibonacci
  - parameter should be named `n`
---

**Clarifying Questions:**

1. Will the input always be a positive integer number?
  Yes.
2. Will an argument always be provided?
  Yes
3. Will additional arguments beyond the first one be provided?
  No.
4. 

---

**Mental Model:**

- Use an if statement to contain the baseline condition (n === 1 or n === 2) and the recursive calls in the else branch
  - the recursive calls should look like fibonacci(n - 2) + fibonacci(n - 1 )

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

fibonacci(1);       // 1
fibonacci(2);       // 1
fibonacci(3);       // 2
fibonacci(4);       // 3
fibonacci(5);       // 5
fibonacci(12);      // 144
fibonacci(20);      // 6765

---

Data Structure
--------------

Just use integers for the calcualtions. No list processing needed, so we don't need to use an array.

---

Algorithm
---------

- Use an if statement to contain the baseline condition (n === 1 or n === 2) and the recursive calls in the else branch
  - the recursive calls should look like fibonacci(n - 2) + fibonacci(n - 1 )

Code
----

*/

function fibonacci(n) {
  if (n === 1 || n === 2) {
    return 1;
  } else {
    return fibonacci(n - 2) + fibonacci(n - 1);
  }
}

console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
console.log(fibonacci(20));      // 6765