"use strict";
/*

Write a function that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a number n
-  Output: the difference between:
              - the square of the sum of the first n positive integers
              - the sum of the squares of the first n positive integers

---

**Problem Domain:**

Nothing specific.

---

**Explicit Requirements:**
- 
---


**Implicit Requirements:**
- Return a single number
- function should be named sumSquareDifference

---

**Clarifying Questions:**

1. Will there always be only a single argument provided to the function?
  Yes
2. Will the single argument always be a positive integer?
  Yes.
3. Is there a max positive integer argument?
  No.

---

**Mental Model:**

- Create an array to contain the first `n` positive integers.
- Calculate the square of the sum of the numbers in the array.
- Calcualte the sum of the squares of the numbers in the array.
- Return the difference between the two.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

sumSquareDifference(3);      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sumSquareDifference(10);     // 2640
sumSquareDifference(1);      // 0
sumSquareDifference(100);    // 25164150

---

Data Structure
--------------

Use an array to contain the first n positive integers.

[1, 2, 3, 4, etc....]

---

Algorithm
---------

- Create an array to contain the first `n` positive integers.
- Calculate the square of the sum of the numbers in the array.
- Calcualte the sum of the squares of the numbers in the array.
- Return the difference between the two.

Code
----

*/

function sumSquareDifference(n) {
  let numbers = Array(n).fill(0).map((blank, index) => index + 1);

  let squareOfSum = squareSums(numbers);

  let sumOfSquares = sumSquares(numbers);

  return squareOfSum - sumOfSquares;
}

function sumSquares(numbersArray) {
  return numbersArray.reduce((sum, num) => sum += Math.pow(num, 2), 0);
}

function squareSums(numbersArray) {
  let sum = numbersArray.reduce((sum, num) => sum += num, 0);
  return Math.pow(sum, 2);
}

sumSquareDifference(3);      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sumSquareDifference(10);     // 2640
sumSquareDifference(1);      // 0
sumSquareDifference(100);    // 25164150

// LS Solution

// function sumSquareDifference(n) {
//   let sum = 0;
//   let sumOfSquares = 0;

//   for (let i = 1; i <= n; i += 1) {
//     sum += i;
//     sumOfSquares += i ** 2;
//   }

//   return sum ** 2 - sumOfSquares;
// }