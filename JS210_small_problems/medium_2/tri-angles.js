"use strict";
/*

A triangle is classified as follows:

Right: One angle is a right angle (exactly 90 degrees).
Acute: All three angles are less than 90 degrees.
Obtuse: One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and every angle must be greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

Write a function that takes the three angles of a triangle as arguments and returns one of the following four strings representing the triangle's classification: 'right', 'acute', 'obtuse', or 'invalid'.

You may assume that all angles have integer values, so you do not have to worry about floating point errors. You may also assume that the arguments are in degrees.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: three integers representing the three angles of a triangle
-  Output: return a string representing the triangle's classification (right, actute, obtuse, or invalid)

---

**Problem Domain:**

A triangle is classified as follows:

Right: One angle is a right angle (exactly 90 degrees).
Acute: All three angles are less than 90 degrees.
Obtuse: One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and every angle must be greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

---

**Explicit Requirements:**
- Assume all angles have integer values.
- Assume all arguments are in degrees.
- Return a string representing the triangle's classification
- An valid triangle has:
  - angles greater than 0
  - angles that sum up to exactly 180 degrees.
---


**Implicit Requirements:**
- The function must be named triangle.
---

**Clarifying Questions:**

1. Can we assume the integers are all Number types and not BigInts?
  Yes
2. Can we assume that there will always only be 3 arguments provided to the function, not more and not fewer?
  Yes.

---

**Mental Model:**

- check if the three angles make an invalid triangle
  - if so, return "invalid"
- if the largest angle is greater than 90 degrees, return "obtuse"
- if the largest angle is 90, return "right"
- otherwise, return "acute"

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

triangle(60, 70, 50);       // "acute"
triangle(30, 90, 60);       // "right"
triangle(120, 50, 10);      // "obtuse"
triangle(0, 90, 90);        // "invalid"
triangle(50, 50, 50);       // "invalid"
triangle(90, 90);           // "invalid"
triangle(90, 70, 10, 10);   // "invalid"


---

Data Structure
--------------

- use an array to contain the angles

[50, 40, 90]

---

Algorithm
---------

- check if the three angles make an invalid triangle
  - if any of the arguments are 0 or less OR if the arguments don't sum up to exactly 180, the triangle is invalid
  - if so, return "invalid"
- if the largest angle is greater than 90 degrees, return "obtuse"
- if the largest angle is 90, return "right"
- otherwise, return "acute"

Code
----

*/

function isInvalidTriangle(anglesArr) {
  return anglesArr.length !== 3 ||
          anglesArr.some(num => num <= 0) ||
          anglesArr.reduce((sum, num) => sum + num) !== 180;
}

function triangle(...anglesArr) {
  if (isInvalidTriangle(anglesArr)) return 'invalid';

  anglesArr.sort((a, b) => a - b);

  let max = anglesArr[2];

  if (max > 90) {
    return 'obtuse';
  } else if (max === 90) {
    return 'right';
  } else {
    return 'acute';
  }
}

console.log(triangle(60, 70, 50));       // "acute"
console.log(triangle(30, 90, 60));       // "right"
console.log(triangle(120, 50, 10));      // "obtuse"
console.log(triangle(0, 90, 90));        // "invalid"
console.log(triangle(50, 50, 50));       // "invalid"
console.log(triangle(90, 90));           // "invalid"
console.log(triangle(90, 70, 10, 10));   // "invalid"