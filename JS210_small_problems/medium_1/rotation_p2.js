"use strict";
/*

Write a function that rotates the last n digits of a number. For the rotation, rotate by one digit to the left, moving the first digit to the end.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: Two numbers. The first number is a `number` while the second number is the number of digits `n` to rotate left by one spot in the first argument `number`.
-  Output: Return a number with the last `n` digits in `number` rotated to the left.

---

**Problem Domain:**

Nothing specific.

---

**Explicit Requirements:**
- Return a number.
- Take two numbers as inputs. First is `number` seconds is `n`.
- When rotating the last `n` digits in `number`, rotate to the left. The leftmost digit in the last `n` digits of `number` gets placed at the end.
---


**Implicit Requirements:**
- Function must be named rotateRightmostDigits
---

**Clarifying Questions:**

1. Will `n` always be a positive integer greater than or equal to 0?
  Yes.
2. Will `n` always be less than or equal to the total number of digits in `number`? i.e. rotateRightmostDigits(123, 4) is not valid?
  `n` can be greater than the number of digits in `number`. But in these cases, act as if `n` is just the number of digits in `number`.
3. Will `n` and `number` always be numbers? i.e. do I need to validate input?
  Assume `n` and `number` will always be numbers.

---

**Mental Model:**

- Validate input (check if `n` is 0 or greater than the number of digits in `number`)
- Split `number` into an array of digits.
- Rotate only the last `n` digits in the array of digits.
- Rejoin the digits together and return the result as a number.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

rotateRightmostDigits(735291, 0);      // 735291
rotateRightmostDigits(735291, 1);      // 735291
rotateRightmostDigits(735291, 2);      // 735219
rotateRightmostDigits(735291, 3);      // 735912
rotateRightmostDigits(735291, 4);      // 732915
rotateRightmostDigits(735291, 5);      // 752913
rotateRightmostDigits(735291, 6);      // 352917
rotateRightmostDigits(735291, 7);      // 352917

rotateRightmostDigits(43, 0);         // 43
rotateRightmostDigits(43, 1);         // 43
rotateRightmostDigits(43, 2);         // 34
rotateRightmostDigits(43, 3);         // 34


rotateRightmostDigits(400, 2);        // 400
rotateRigthmostDigits(400, 3);        // 4
---

Data Structure
--------------

Use strings to contain each digit.

"4"
"3"

Use an array to contain the strings of individual digits. Will allow use of list processing methods.

["4", "3"]

---

Algorithm
---------

- Validate input (check if `n` is 0 or 1 or greater than the number of digits in `number`)
  - If `n` is less than or equal to 1, return the input number.
  - If `n` is greater than the number of digits in `number`
    - Reassign `n` to the number of digits in `number`.
- Split `number` into an array of digits.
  - Convert `number` to a string. Split the string into an array of strings containing a single digit.
- Rotate only the last `n` digits in the array of digits.
  - Determine the array index that contains the leftmost digit in the `n` last digits. Assign to variable `leftmostDigitIndex`
    - leftmostDigitIndex = array length - `n`
  - Destructively splice the digit at the `leftmostDigitIndex`. Push it onto the end of the array of digits. 
- Rejoin the digits together and return the result as a number.
  - Join the digits together. Convert the resulting string to a number. Return the number.

Code
----
*/

function rotateRightmostDigits(number, n) {
  if (n <= 1) {
    console.log(number);
    return number;
  } else if (n > String(number).length) {
    n = String(number).length;
  }

  let digits = String(number).split('');

  let leftmostDigitIndex = digits.length - n;

  digits = digits.concat(digits.splice(leftmostDigitIndex, 1));

  let result = Number(digits.join(''));
  console.log(result);
  return result;
}

rotateRightmostDigits(735291, 0);      // 735291
rotateRightmostDigits(735291, 1);      // 735291
rotateRightmostDigits(735291, 2);      // 735219
rotateRightmostDigits(735291, 3);      // 735912
rotateRightmostDigits(735291, 4);      // 732915
rotateRightmostDigits(735291, 5);      // 752913
rotateRightmostDigits(735291, 6);      // 352917
rotateRightmostDigits(735291, 7);      // 352917

rotateRightmostDigits(43, 0);         // 43
rotateRightmostDigits(43, 1);         // 43
rotateRightmostDigits(43, 2);         // 34
rotateRightmostDigits(43, 3);         // 34


rotateRightmostDigits(400, 2);        // 400
rotateRightmostDigits(400, 3);        // 4