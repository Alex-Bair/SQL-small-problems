"use strict";
/*

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, with all of its digits occurring exactly once each. For example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a function that takes an integer as an argument and returns the next featured number greater than the integer. Issue an error message if there is no next featured number.

NOTE: The largest possible featured number is 9876543201.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: integer argument
-  Output: the next featured number higher than the integer argument

---

**Problem Domain:**

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, with all of its digits occurring exactly once each.

The largest featured number is 9876543201.

---

**Explicit Requirements:**
- If there is a featured number greater than the input integer, return the next featured number.
- If the input is greater than or equal to 9876543201, issue an error message - "There is no possible number that fulfills those requirements."
- A featured number is an odd number that's a multiple of 7, will all of its digits occurring exactly once.
---


**Implicit Requirements:**
- We should return the next largest featured number (if it exists) if the input is also a featured number.
---

**Clarifying Questions:**

1. When issuing the error message, should it be returned or logged to the console?
  Logged to the console.
2. Will the input always be an integer of the Number type?
  Yes.
3. Will the input always be a positive integer?
  Yes.
4. Will there always be a single argument, no more and no fewer?
  Yes.
  
---

**Mental Model:**

- Check if the input is greater than or equal to the largest featured number 9876543201.
  - If so, log the error message.
- Find the next odd, multiple of seven that's greater than the input integer.
- Loop
  - If the current number is a featured number (at this point, just making sure all the digits occur once), return the current number.
  - Increment the current number by 14.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

featured(12);           // 21
featured(20);           // 21
featured(21);           // 35
featured(997);          // 1029
featured(1029);         // 1043
featured(999999);       // 1023547
featured(999999987);    // 1023456987
featured(9876543186);   // 9876543201
featured(9876543200);   // 9876543201
featured(9876543201);   // "There is no possible number that fulfills those requirements."

---

Data Structure
--------------

Use numbers. 

Use strings and arrays when determining if the digits in a number only occur once.

---

Algorithm
---------

#featured
- Check if the input is greater than or equal to the largest featured number 9876543201.
  - If so, log the error message.
- Find the next odd, multiple of seven that's greater than the input integer with #nextOddMultipleOf7
- Loop
  - If the current number has only unique digits (checked with #hasUniqueDigits), return the current number.
  - Increment the current number by 14.

#nextOddMultipleOf7(number)
- Loop
  - increment number by 1
  - if number is odd AND is a multiple of 7, return it

#hasUniqueDigits(number)
- convert the number into a string
- split the number into an array of digits
- sort the array of digits
- iterate over the array of digits
  - if the current element is the same as the next element in the array, return false
- return true if iteration completes without returning early

Code
----

*/

function nextOddMultipleOf7(number) {
  while(true) {
    number += 1;
    if (number % 2 === 1 && number % 7 === 0) return number;
  }
}

function hasUniqueDigits(number) {
  let digits = String(number).split('');

  let seenDigits = {};

  for (let index = 0; index < digits.length; index += 1) {
    if (seenDigits[digits[index]]) return false;

    seenDigits[digits[index]] = true;
  }

  return true;
}

function featured(number) {
  const MAX_FEATURED_NUM = 9876543201;

  if (number >= MAX_FEATURED_NUM) {
    console.log('There is no possible number that fulfills those requirements');
  } else {
    number = nextOddMultipleOf7(number);

    while (true) {
      if (hasUniqueDigits(number)) return number;
      number += 14;
    }
  }
}

console.log(featured(12));           // 21
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9876543186));   // 9876543201
console.log(featured(9876543200));   // 9876543201
console.log(featured(9876543201));   // "There is no possible number that fulfills those requirements."

// LS Solution

// function featured(number) {
//   const MAX_FEATURED = 9876543201;
//   let featuredNum = toOddMultipleOf7(number);

//   do {
//     if (allUnique(featuredNum)) {
//       return featuredNum;
//     }

//     featuredNum += 14;
//   } while (featuredNum <= MAX_FEATURED);

//   return 'There is no possible number that fulfills those requirements.';
// }

// function toOddMultipleOf7(number) {
//   do {
//     number += 1;
//   } while (number % 2 === 0 || number % 7 !== 0);

//   return number;
// }

// function allUnique(number) {
//   let digits = String(number).split('');
//   let seen = {};

//   for (let idx = 0; idx < digits.length; idx += 1) {
//     if (seen[digits[idx]]) {
//       return false;
//     }

//     seen[digits[idx]] = true;
//   }

//   return true;
// }