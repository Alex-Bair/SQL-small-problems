"use strict";
/*

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first two numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. Fibonacci numbers often appear in mathematics and nature.

Computationally, the Fibonacci series is a simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075—that's enormous, especially considering that it takes six iterations just to find the first 2-digit Fibonacci number.

Write a function that calculates and returns the index of the first Fibonacci number that has the number of digits specified by the argument. (The first Fibonacci number has an index of 1.)

You may assume that the argument is always an integer greater than or equal to 2.



JavaScript's normal Number type can represent integers accurate up to the value of Number.MAX_SAFE_INTEGER, which is the 16-digit value 9007199254740991. Any integer larger than that value loses accuracy. For instance, the following code outputs 1, not 2 as you may expect:

console.log(Number.MAX_SAFE_INTEGER + 2 - Number.MAX_SAFE_INTEGER);

We'll be working with much larger numbers in this problem. Fortunately, JavaScript now supports a BigInt type that lets you work with massive integers, limited only by the amount of memory available to your program, and the time you can devote to waiting for an answer.

To use BigInt integers in your solution, simply append the letter n to any numbers you use in your solution: 1n, 1234567890123456789012345678901234567890n, and so on. JavaScript will take care of the rest.


PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: A single BigInt number representing a number of digits.
-  Output: Return a single BigInt number representing the index of the first Fibonacci number with the same number of digits as the input.

---

**Problem Domain:**

- The fibonacci series is a series of numbers where:
  - the first two numbers are 1 by definition
  - each subsequent number is the sum of the two previous numbers

The fibonacci seires starts like:
1, 1, 2, 3, 5, 8, 13, 21, 34, 55, etc...


JavaScript's Number type has a max safe integer of 9007199254740991, meaning we lose accuracy when working above the max safe integer. To maintain accuracy, we can use JavaScript's BigInt type to work with huge integers.

To use BigInts, we must append the letter `n` to the end of a number, like so: 1n, 54n, 1234567890123456789012345678901234567890n.

---

**Explicit Requirements:**
- The input will be an integer greater than or equal to 2.
- The function should return a BigInt representing the index of the first number in the fibonacci series that contains the same number of digits as the input.
- We should use JavaScript's BigInt type during calculations in order to maintain accuracy.
- The first number in the fibonacci series `1` has an index of `1`.
---


**Implicit Requirements:**
- The function should be named findFibonacciIndexByLength
---

**Clarifying Questions:**

1. Will the input integer always be a BigInt type?
  No, it could be a regular Number type or a BigInt type.
2. Is there a maximum integer that the input will be?
  No.
3. To confirm, the input will always be an integer greater than or equal to 2?
  Yes.
4. We do not need to return the actual fibonacci number, but rather the index of the specified fibonacci number, correct?
  Yes.
5. Will an argument always be provided to the function?
  Assume so, yes.
6. Will there ever be more than one argument provided to the function?
  No.

---

**Mental Model:**

- Keep track of the previous and current fibonacci numbers and their indexes in the sequence.
- Use the above information to figure out the next fibonacci number and its index in the sequence
- Once the current fibonacci number has the same number of digits as the input integer, return the current fibonacci number's index.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

findFibonacciIndexByLength(2n) === 7n;    // 1 1 2 3 5 8 13
findFibonacciIndexByLength(3n) === 12n;   // 1 1 2 3 5 8 13 21 34 55 89 144
findFibonacciIndexByLength(10n) === 45n;
findFibonacciIndexByLength(16n) === 74n;
findFibonacciIndexByLength(100n) === 476n;
findFibonacciIndexByLength(1000n) === 4782n;
findFibonacciIndexByLength(10000n) === 47847n;

---

Data Structure
--------------

- Use BigInt types to keep track of the fibonacci numbers and their sequences.
  - Keep track of the BigInts in explicitly names variables.
- Don't need list processing methods, so don't need to use an array.

---

Algorithm
---------

#findFibonacciIndexByLength(bigIntNumber)
- Convert the input argument into a BigInt type.
- Set the initial starting conditions for the fibonacci series
  - The previous number is 8n at an index of 6n
  - The current number is 13n at an index of 7n
- Enter a loop
  - If the current fibonacci number has the same number of digits as the input Bigint (checked function #numberOfDigits)
    - Return the current fibonacci number's index.
  - Reassign the previous fib number, the previous fib index, the current fib number, and the current fib index to: (BE CAREFUL WHEN ORDERING THESE OPERATIONS)
      next fib number = current fib number + previous fib number
      next fib index = current fib index + 1n
      previous fib number = current fib number
      previous fib index = currnt fib index
      current fib number = next fib number
      current fib index = next fib index

#numberOfDigits(bigIntNumber)
- convert bigIntNumber to a string
- convert the string to a BigInt type
- return the BigInt result


Code
----

*/

function p(input) {
  console.log(input);
  return input;
}

function numberOfDigits(bigIntNumber) {
  let length = bigIntNumber.toString().length;
  return BigInt(length);
}

function findFibonacciIndexByLength(bigIntNumber) {
  bigIntNumber = BigInt(bigIntNumber);

  let previousFibNum = 8n;
  let currentFibNum = 13n;
  let currentFibIndex = 7n;

  while (true) {
    if (numberOfDigits(currentFibNum) === bigIntNumber) return currentFibIndex;

    let nextFibNum = currentFibNum + previousFibNum;

    previousFibNum = currentFibNum;

    [currentFibNum, currentFibIndex] = [nextFibNum, currentFibIndex + 1n];
  }
}

// p(findFibonacciIndexByLength(2n)) === 7n;    // 1 1 2 3 5 8 13
// p(findFibonacciIndexByLength(3n)) === 12n;   // 1 1 2 3 5 8 13 21 34 55 89 144
// p(findFibonacciIndexByLength(10n)) === 45n;
// p(findFibonacciIndexByLength(16n)) === 74n;
// p(findFibonacciIndexByLength(100n)) === 476n;
// p(findFibonacciIndexByLength(1000n)) === 4782n;
// p(findFibonacciIndexByLength(10000n)) === 47847n;