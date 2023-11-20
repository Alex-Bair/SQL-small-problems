"use strict";
/*

Write a function that takes a year as an argument and returns the number of 'Friday the 13ths' in that year. 
You may assume that the year is greater than 1752 (when the modern Gregorian Calendar was adopted by the United Kingdom). 
You may also assume that the same calendar will remain in use for the foreseeable future.

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: an integer representing a year
-  Output: return an integer representing how many 'Friday the 13ths' occur in that year.

---

**Problem Domain:**

Nothing specific.

---

**Explicit Requirements:**
- Assume that the input year is greater than 1752
- Assume the same calendar will remain in use for the forseeable future.
---


**Implicit Requirements:**
- The function should be named fridayThe13ths
- The function should return an integer
---

**Clarifying Questions:**

1. Will there always be a single argument provided to the function?
  yes
2. Will the argument always be an integer of the Number type? (i.e. no BigInt types)
  Yes
3. Can we use built in Date methods to solve the problem?
  Yes
4. Will the input year always have only 4 digits?
  Yes.

---

**Mental Model:**

- Declare and initialize a count variable to 0. This will keep track of how many Friday the 13ths occur in the input year.
- Iterate over the months from 1 - 12.
  - Check if the 13th of the month is a Friday. If so, increment the count variable.
- Return the count variable's value.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

fridayThe13ths(1986);      // 1
fridayThe13ths(2015);      // 3
fridayThe13ths(2017);      // 2
fridayThe13ths(2023);      // 2

---

Data Structure
--------------

Use a string to "build" the date, like so:
"YYYY-MM-13T00:00:00"

Convert the string above to a Date object, then we can check if that Date is a Friday.

---

Algorithm
---------

- Declare and initialize a count variable to 0. This will keep track of how many Friday the 13ths occur in the input year.
- Iterate over the months from 1 - 12.
  - Check if the 13th of the month is a Friday. If so, increment the count variable.
- Return the count variable's value.

Code
----

*/

function fridayThe13ths(year) {
  const JANUARY = 0;
  const DECEMBER = 11;
  const FRIDAY = 5;
  
  let count = 0;

  for (let month = JANUARY; month < DECEMBER; month += 1) {
    let date = new Date(year, month, 13);
    if (date.getDay() === FRIDAY) count += 1;
  }

  return count;
}

fridayThe13ths(1986);      // 1
fridayThe13ths(2015);      // 3
fridayThe13ths(2017);      // 2
fridayThe13ths(2023);      // 2