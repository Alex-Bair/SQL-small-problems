"use strict";
/*

Rewrite the recursive fibonacci function from earlier to use memoization.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs:
-  Output:

---

**Problem Domain:**

Memoization is an approach that involves saving a computed answer for future reuse, instead of computing it from scratch every time it is needed. 
In the case of our recursive fibonacci function, using memoization saves calls to fibonacci(nth - 2) because the necessary values have already been computed by the recursive calls to fibonacci(nth - 1).

---

**Explicit Requirements:**
- Must use recursion still.
- Must use memoization.
---


**Implicit Requirements:**

---

**Clarifying Questions:**

1.
2.
3.

---

**Mental Model:**

The memo will have to be constant across the function calls.

We could use a #generateFibonacci function to return a #fibonacci function with a constant memo in its closure.

## how to use memoization in function #

- look up input n in memo. If it exists, return the associated value.
- set memo with key `n` to the result of fibonacci(n - 2) + fibonacci(n - 1)
- return the result above.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
console.log(fibonacci(20));      // 6765

---

Data Structure
--------------

Use an object to "remember" previous results for function calls.

The keys would be numbers, and the values would be the result of calling fibonacci(key).

memo = {
  1: 1,
  2: 1,
  3: 2,
  4: 3,
  etc...
}

---

Algorithm
---------

Code
----

*/

function createFibonacci() {
  const memo = {1: 1, 2: 1 };

  return function fib(n) {
    if (memo[n]) return memo[n];

    memo[n] = fib(n - 2) + fib(n - 1);
    return memo[n];
  };
}

const fibonacci = createFibonacci();

console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
console.log(fibonacci(20));      // 6765

// Further Exploration - do once I've finished with IIFE's in JS225