/*

Write a function that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the function. The smallest such star you need to handle is a 7x7 grid (i.e., when n is 7).

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: an odd integer `n` that is greater than or equal to 7
-  Output: logs to the console an 8-pointed star in an `n` by `n` grid

---

**Problem Domain:**

star(7);
// logs
*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *


8-pointed stars have a top half, a middle line, and a bottom half.

The bottom half is a mirror reflection of the top half.

The middle line is a line full of stars (i.e. a line of `n` stars)

The top half always has 3 stars (*) on each line. The top half has (`n` - 1) / 2 lines. Each line has (n - 3) spaces. Assuming the lines are numbered 1 through (n - 1) / 2:
  - a given line is `n` characters long
  - a given line has stars at positions:
    - lineNumber          (left)
    - `n` / 2 rounded up  (middle)
    - `n` - lineNumber    (right)

---

**Explicit Requirements:**
- The function must accept an odd integer `n` as an argument.
- The smallest integer we must handle is 7.
- We must display an 8-pointed star in an `n` by `n` grid.
---


**Implicit Requirements:**
- Function must be named #star
- There are no empty lines before or after the star is displayed
---

**Clarifying Questions:**

1. Can we always assume the input will be an odd integer greater than or equal to 7?
  Yes.
2. Is there a maximum integer we should handle?
  No.
3.

---

**Mental Model:**

- Build the top half of the star.
- Build the middle line of the star.
- Build the bottom half of the star.
- Log the lines of the star to the console.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

star(7);
// logs
*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *


star(9);
// logs
*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *
---

star(11)
*    *    *
 *   *   *
  *  *  *
   * * *
    ***
 *********
    ***
   * * *
  *  *  *
 *   *   *
*    *    *

---

Data Structure
--------------

Ues strings to represent each individual line of the star.

Use an array to contain all lines of the star in sequence.
The array index will be one less than the star line number.
Ex: index 0 is star line 1.

---

Algorithm
---------

#star
- Initialize a variable starLines to an array to contain the lines of the star.
- Build the top half of the star.
  - Iterate from 1 to (n - 1) / 2. Call the iteration number lineNumber.
    - Build the appropriate star line with the #generateStarLine function, passing in the line number and the total line width (`n`).
    - Push the star line onto the starLines array.
- Build the middle line of the star.
    - Push a string of `n` stars onto the starLines array.
- Build the bottom half of the star.
  - Copy the top half of the star, reverse it, and concatenate it to the starLines array. We can use slice(0, -1) to copy all lines but the last line (aka the middle line).
- Log the lines of the star to the console.

#generateStarLine(lineNumber, lineWidth)
- Create an Array of length lineWidth. Fill the array with elements that are a single space character.
- Reassign elements at the following indexes to stars (*):
  - lineNumber - 1
  - lineWidth / 2 rounded down
  - lineWidth - lineNumber - 1
  

Code
----
*/

function generateStarLine(lineNumber, lineWidth) {
  let line = Array(lineWidth).fill(' ');

  let leftStarIndex = lineNumber - 1;
  let middleStarIndex = Math.floor(lineWidth / 2);
  let rightStarIndex = (lineWidth - 1) - (lineNumber - 1);

  [leftStarIndex, middleStarIndex, rightStarIndex].forEach(index => line[index] = '*');

  return line.join('');
}

function star(n) {
  let starLines = [];

  for (let lineNumber = 1; lineNumber <= (n - 1) / 2; lineNumber += 1) {
    starLines.push(generateStarLine(lineNumber, n));
  }

  starLines.push('*'.repeat(n));

  starLines = starLines.concat(starLines.slice(0, -1).reverse());

  starLines.forEach(line => console.log(line));
}

star(7);
console.log('');
star(9);
console.log('');
star(11);