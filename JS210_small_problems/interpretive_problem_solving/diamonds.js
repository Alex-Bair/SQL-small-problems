/*

Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function. You may assume that the argument will always be an odd integer.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: an single odd integer `n`
-  Output: a four-pointed diamond in an `n` by `n` grid that's logged to the console.

---

**Problem Domain:**

A diamond is composed of a top half, a middle line, and a bottom half.

The bottom half is the mirror image of the top half.

Assuming the diamond lines are numbered from 1 - `n`, with the line number being `lineNum`:
  - Each line in the top half has `2 * lineNum - 1` stars (*) with (n - lineNum) / 2 spaces on both sides.
  - The middle line has `n` number of stars (*) with no spaces.
  - The bottom half is the mirror of the top half.

---

**Explicit Requirements:**
- Input is an odd integer `n`
- The diamond must be logged to the console, in an `n` by `n` grid.
---


**Implicit Requirements:**
- The function must be called diamond.
---

**Clarifying Questions:**

1. Will the argument ever be non-positive odd integers?
  No. Assume the argument is always an odd integer.
2. Should there be a blank line logged before or after the diamond?
  No.
---

**Mental Model:**
- Generate the top half of the diamond
- Generate the middle lineof the diamond
- Generate the bottom half of the diamond
- Log the entire diamond to teh console.
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

diamond(1);
// logs
*

diamond(3);
// logs
 *
***
 *
 

diamond(9);
// logs
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *


---

_Your Test Cases:_

diamond(0) // "Invalid input. Argument must be a non-negative, odd integer."
diamond(-1) // "Invalid input. Argument must be a non-negative, odd integer."
diamond("") // "Invalid input. Argument must be a non-negative, odd integer."
diamond([]) // "Invalid input. Argument must be a non-negative, odd integer."
diamond(2) // "Invalid input. Argument must be a non-negative, odd integer."
diamond(10) // "Invalid input. Argument must be a non-negative, odd integer."

---

Data Structure
--------------

Represent each line of the diamond as a string, like "    *    ".

Represent the overall diamond as an array containing each line of the diamond, like:

for n = 3
[
  ' * ',
  '***',
  ' * ',
]

---

Algorithm
---------

- Initialize an array 'diamondLines' to an empty array.
- Generate the top half of the diamond
  - Iterate from 1 to `n` / 2 rounded down. (use Math.floor). Call the iteration number 'numOfDiamonds'
    - Generate a string with 'numOfDiamonds' number of diamonds using the #generateDiamondLine helper method. Push it onto the 'diamondLines' array.
- Generate the middle line of the diamond with #generateDiamondLine. Push it onto the 'diamondLines' array.
- Generate the bottom half of the diamond
  - Slice the first half of the `diamondLines` array (from indexes 0 - (`n` / 2) rounded down minus 1). Reverse it. Concatenate it to the end of the 'diamondLines' array.
- Log the entire diamond to the console.


#generateDiamondLine(numberOfDiamonds, fullStringLength)
- return a string with `numberOfDiamonds` stars (*) with (`fullStringLength - numberOfDiamonds`) / 2 spaces on both sides of the stars.

Code
----
*/

function generateDiamondLine(numberOfDiamonds, fullStringLength) {
  let numberOfSpaces = (fullStringLength - numberOfDiamonds);

  let stars = '*'.repeat(numberOfDiamonds);
  let halfSpaces = ' '.repeat(numberOfSpaces / 2);

  return halfSpaces + stars + halfSpaces;
}

function diamond(n) {
  let diamondLines = [];

  for (let lineNum = 1; lineNum <= Math.floor(n / 2); lineNum += 1) {
    let numberOfDiamonds = 2 * lineNum - 1;
    diamondLines.push(generateDiamondLine(numberOfDiamonds , n));
  }

  diamondLines.push(generateDiamondLine(n, n));

  let bottomHalf = diamondLines.slice(0, Math.floor(n / 2)).reverse();

  diamondLines = diamondLines.concat(bottomHalf);
  
  diamondLines.forEach(line => console.log(line));
}

// diamond(1);
// diamond(3);
// diamond(5);
// diamond(7);
// diamond(9);

// Further Exploration

function hollowDiamond(n) {
  let diamondLines = [];

  for (let lineNum = 1; lineNum <= Math.floor(n / 2); lineNum += 1) {
    let numberOfDiamonds = 2 * lineNum - 1;
    diamondLines.push(generateDiamondLine(numberOfDiamonds , n));
  }

  diamondLines.push(generateDiamondLine(n, n));

  let bottomHalf = diamondLines.slice(0, Math.floor(n / 2)).reverse();

  let hollowDiamondLines = convertToHollowDiamond(diamondLines.concat(bottomHalf));

  hollowDiamondLines.forEach(line => console.log(line));
}

function convertToHollowDiamond(diamondLines) {
  return diamondLines.map(replaceMiddleStarsWithSpaces);
}

function replaceMiddleStarsWithSpaces(str) {
  if (str.length === 1) return '*';

  let MIDDLE_STARS_REGEX = /^([ ]*)(\*+)([ ]*)$/;

  return str.replace(MIDDLE_STARS_REGEX, (match, space1, stars) => {
    if (stars.length === 1) return match;

    return space1 + '*' + ' '.repeat(stars.length - 2) + '*' + space1;
  });
}

hollowDiamond(1);
hollowDiamond(3);
hollowDiamond(5);
hollowDiamond(7);
hollowDiamond(9);