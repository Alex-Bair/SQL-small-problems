"use strict";
/*

Take the number 735291 and rotate it by one digit to the left, getting 352917. Next, keep the first digit fixed in place and rotate the remaining digits to get 329175. Keep the first two digits fixed in place and rotate again to get 321759. Keep the first three digits fixed in place and rotate again to get 321597. Finally, keep the first four digits fixed in place and rotate the final two digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a function that takes an integer as an argument and returns the maximum rotation of that integer. You can (and probably should) use the rotateRightmostDigits function from the previous exercise.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a single integer
-  Output: return a number that represents the maximum rotation of the input integer

Note: we can uset the rotateRightmostDigits function from the last exercise

---

**Problem Domain:**

The maximum rotation of an integer is performed by:
- iterating from the number of digits in the integer down to 1. call the number `digitsToRotate`
  - on each iteration, rotating the right most `digitsToRotate` digits in the integer.
  - reassigning the integer to the result of the above rotation

---

**Explicit Requirements:**
- The argument should be an integer
- The maximum rotation of the integer should be performed and returned as a number
- We can use the rotateRightmostDigits function from the previous exercise

---


**Implicit Requirements:**
 - the function should be named maxRotation
 - any leading zeros in the final returned number should be dropped
 - any leading zeros that occur in the interim rotations should NOT be dropped.
---

**Clarifying Questions:**

1. Can we assume the input is always a non-negative integer?
  Yes.
2. To confirm, zeros should be maintained in the returned number as long as they don't become leading zeros in the final returned number, right?
  Yes.

---

**Mental Model:**

- Split the input into an array of digits (as strings).
- Perform the max rotation on the array of digits.
- Rejoin the digits into a string, convert to a number, and return the result.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

maxRotation(735291);          // 321579
maxRotation(3);               // 3
maxRotation(35);              // 53
maxRotation(105);             // 15 -- the leading zero gets dropped
maxRotation(8703529146);      // 7321609845
maxRotation(1430);            // 1430 -> 4301 -> 4013 -> 4031
maxRotation(10004);           // 10004 -> 00041 -> 00410 -> 00104 -> 00140 -> 140
maxRotation(10043);           // 10043 -> 00431 -> 04310 -> 04103 -> 04130 -> 4130

---

Data Structure
--------------

- Use strings to represent each digit. This will allow us to maintain zeros (as long as they don't become leading zeros) in the result.
- Use an array to contain the strings of digits. This will allow use of list processing methods.

---

Algorithm
---------

- Split the input into an array of digits (as strings).
- Use an empty array to contain the max rotation digits. We'll only push elements to this array once their position is set in the overall "number".
- Perform the max rotation on the array of digits.
  - Iterate from 1 to the length of the array.
    - Rotate the entire digits array to the left one spot.
    - Shift the first element from the digits array onto the end of the max rotation result array.
- Join the max rotation result array into a string, convert to a number, and return the result.

Code
----
*/

function maxRotation(integer) {
  let maxRotationArr = [];
  let digits = String(integer).split('');
  
  for (let iteration = digits.length; iteration > 0; iteration -= 1) {
    digits = digits.concat(digits.splice(0, 1));
    maxRotationArr.push(digits.shift());
  }

  return Number(maxRotationArr.join(''));
}

maxRotation(735291);          // 321579
maxRotation(3);               // 3
maxRotation(35);              // 53
maxRotation(105);             // 15 -- the leading zero gets dropped
maxRotation(8703529146);      // 7321609845
maxRotation(1430);            // 1430 -> 4301 -> 4013 -> 4031
maxRotation(10004);           // 10004 -> 00041 -> 00410 -> 00104 -> 00140 -> 140
maxRotation(10043);           // 10043 -> 00431 -> 04310 -> 04103 -> 04130 -> 4130