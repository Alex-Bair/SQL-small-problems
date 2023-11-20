"use strict";
/*

A triangle is classified as follows:

Equilateral: All three sides are of equal length.
Isosceles: Two sides are of equal length, while the third is different.
Scalene: All three sides are of different lengths.
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and every side must have a length greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

Write a function that takes the lengths of the three sides of a triangle as arguments and returns one of the following four strings representing the triangle's classification: 'equilateral', 'isosceles', 'scalene', or 'invalid'.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: three numbers representing the three sides of a triangle
-  Output: return a string representing what kind of triangle is represented by the input integers

---

**Problem Domain:**

Equilateral triangle have three sides of equal length.

Isosceles triangele have two sides of equal length and the third side is different

Scalene has three side of different length.

Valid triangle must have sides with lengths greater than 0 AND the shortest two sides must sum to be greater than the third side.

---

**Explicit Requirements:**
- See Problem Domain
- Return a string
  - "equilateral" for equilateral triangles
  - "isosceles" for isosceles triangles
  - "scalene" for scalene triangeles
  - "invalid" for invalid triangles
---


**Implicit Requirements:**
- The function must be named triangle
---

**Clarifying Questions:**

1. Will three arguments always be provided?
  No.
2. Will the arguments always be integers?
  Yes, assume so.
3. So the inputs will never be BigInt types?
  No.
4. Should we ignore any arguments that are passed in beyond the third argument?
  If too few arguments or too many arguments are passed, return "invalid".

---

**Mental Model:**

- validate the input
  - Return the string "invalid" if the input is invalid
- Place the input integers into an array and sort them based on their numeric value.
- Return the appropriate string based on the classificaition of the triangle

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

triangle(3, 3, 3);        // "equilateral"
triangle(3, 3, 1.5);      // "isosceles"
triangle(3, 4, 5);        // "scalene"
triangle(0, 3, 3);        // "invalid"
triangle(3, 1, 1);        // "invalid"
triangle(3);              // "invalid"
triangle(3, 3, 3, 3);     // "invalid"
triangle(3, 3);           // "invalid"
triangle(3, 3, "3");      // "invalid"

---

Data Structure
--------------

Use an array to contain the numbers representing the sides of the triangle.

[3, 3, 3]

---

Algorithm
---------

#triangle
- Place the input arguments into an array and sort them based on their numeric value.
- validate the input
  - Return the string "invalid" if the input is invalid (use #isInvalidSidesArray)
- Return the appropriate string based on the classificaition of the triangle
  - filter the array of arguments to only the unique numbers in the array
  - return "equilateral" if there is only 1 unique number in the array of arguments
  - return "scalene" if there are 3 unique numbers in the array of arguments
  - otherwise, return "isosceles"

#isInvalidSidesArray(sidesArr)
- return true IF
  - the length of the sidesArr is not strictly equal to 3
  - the elements of the sidesArr are not all numbers (i.e. typeof element !== "number" for all elements)
  - any of the numbers in the sidesArr are less than or equal to 0
  - the first two numbers in sidesArr sum to be less than  or equal to the last number in sidesArr
- else return false

Code
----

*/

function isInvalidSidesArray(sidesArr) {
  return sidesArr.length !== 3 ||
            sidesArr.some(element => typeof(element) !== 'number') ||
            sidesArr.some(num => num <= 0) ||
            (sidesArr[0] + sidesArr[1] <= sidesArr[2]);
}

function triangle(...sidesArr) {
  sidesArr.sort((a, b) => a - b);
  if (isInvalidSidesArray(sidesArr)) return "invalid";

  if (sidesArr[0] === sidesArr[2]) {
    return "equilateral";
  } else if (sidesArr[0] === sidesArr[1] || sidesArr[1] === sidesArr[2]) {
    return "isosceles";
  } else {
    return "scalene";
  }
}

console.log(triangle(3, 3, 3));        // "equilateral"
console.log(triangle(3, 3, 1.5));      // "isosceles"
console.log(triangle(3, 4, 5));        // "scalene"
console.log(triangle(0, 3, 3));        // "invalid"
console.log(triangle(3, 1, 1));        // "invalid"
console.log(triangle(3));              // "invalid"
console.log(triangle(3, 3, 3, 3));     // "invalid"
console.log(triangle(3, 3));           // "invalid"
console.log(triangle(3, 3, "3"));      // "invalid"